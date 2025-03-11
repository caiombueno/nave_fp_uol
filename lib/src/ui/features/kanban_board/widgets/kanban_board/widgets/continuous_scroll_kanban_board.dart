import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/kanban_column.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_sizings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/utils/utils.dart';

class ContinuousScrollKanbanBoard extends StatefulWidget {
  const ContinuousScrollKanbanBoard({
    super.key,
    required this.toDoTaskSummaryList,
    required this.inProgressTaskSummaryList,
    required this.doneTaskSummaryList,
    required this.toDoColumnTitle,
    required this.inProgressColumnTitle,
    required this.doneColumnTitle,
    this.onCreateTask,
    this.onTaskMove,
    this.onTaskTapped,
  });
  final List<TaskSummaryVM> toDoTaskSummaryList;
  final List<TaskSummaryVM> inProgressTaskSummaryList;
  final List<TaskSummaryVM> doneTaskSummaryList;
  final String toDoColumnTitle;
  final String inProgressColumnTitle;
  final String doneColumnTitle;
  final OnTaskMove? onTaskMove;
  final OnTaskTapped? onTaskTapped;
  final OnCreateTask? onCreateTask;

  @override
  State<ContinuousScrollKanbanBoard> createState() =>
      _ContinuousScrollKanbanBoardState();
}

enum ContinuousAutoScrollDirection {
  left,
  right,
}

class _ContinuousScrollKanbanBoardState
    extends State<ContinuousScrollKanbanBoard> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  Ticker? _autoScrollTicker;

  bool _isAutoScrolling = false;

  String? _draggingTaskId;

  void _initDraggingMode(String? taskId) {
    setState(() {
      _draggingTaskId = taskId;
    });
  }

  void _stopDraggingMode() {
    setState(() {
      _draggingTaskId = null;
    });
  }

  @override
  void dispose() {
    _autoScrollTicker?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Triggers an auto-scroll in the given direction.
  void _triggerAutoScroll({required ContinuousAutoScrollDirection direction}) {
    if (_isAutoScrolling) return;

    // Adjust these values to control speed and distance per tick.
    const double scrollDelta = 50.0;
    const Duration animDuration = Duration(milliseconds: 100);
    const Curve curve = Curves.linear;

    final double currentOffset = _scrollController.offset;
    final double targetOffset = (direction == ContinuousAutoScrollDirection.left
            ? (currentOffset - scrollDelta)
            : (currentOffset + scrollDelta))
        .clamp(_scrollController.position.minScrollExtent,
            _scrollController.position.maxScrollExtent);

    _isAutoScrolling = true;
    _scrollController
        .animateTo(
      targetOffset,
      duration: animDuration,
      curve: curve,
    )
        .whenComplete(() {
      _isAutoScrolling = false;
    });
  }

  /// Starts the ticker if not already running.
  void _startAutoScrollTicker({
    required ContinuousAutoScrollDirection direction,
  }) {
    // If a ticker is already running, update the direction.
    if (_autoScrollTicker != null) {
      return;
    }
    _autoScrollTicker = createTicker((_) {
      _triggerAutoScroll(direction: direction);
    });
    _autoScrollTicker!.start();
  }

  /// Stops and disposes the ticker.
  void _stopAutoScrollTicker() {
    _autoScrollTicker?.stop();
    _autoScrollTicker?.dispose();
    _autoScrollTicker = null;
  }

  /// Called on pointer movement. Checks if the pointer is near the left or right edge.
  void _onPointerMove(Offset globalPosition) {
    // Only auto-scroll when a drag is active.
    if (_draggingTaskId == null) {
      _stopAutoScrollTicker();
      return;
    }

    final renderBox = castOrNull<RenderBox>(context.findRenderObject());
    if (renderBox == null) return;

    final Offset localOffset = renderBox.globalToLocal(globalPosition);
    final double widgetWidth = renderBox.size.width;
    const double edgeThreshold = 80.0;

    if (localOffset.dx < edgeThreshold) {
      // Near the left edge.
      _startAutoScrollTicker(
        direction: ContinuousAutoScrollDirection.left,
      );
    } else if (localOffset.dx > widgetWidth - edgeThreshold) {
      // Near the right edge.
      _startAutoScrollTicker(
        direction: ContinuousAutoScrollDirection.right,
      );
    } else {
      _stopAutoScrollTicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) => _onPointerMove(event.position),
      onPointerUp: (_) {
        _stopAutoScrollTicker();
        _stopDraggingMode();
      },
      child: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: KnotCoreSpacings.mediumLarge,
            ),
            sliver: SliverList.list(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: KanbanColumn(
                    taskStatus: TaskStatus.toDo,
                    title: widget.toDoColumnTitle,
                    tasks: widget.toDoTaskSummaryList,
                    width: KnotSemanticSizings.kanbanColumnWidth,
                    draggingTaskId: _draggingTaskId,
                    onTaskTapped: widget.onTaskTapped,
                    onTaskDropped: (int index, String? taskId) =>
                        widget.onTaskMove?.call(taskId, TaskStatus.toDo, index),
                    onCreateTask: (title) =>
                        widget.onCreateTask?.call(TaskStatus.toDo, title),
                    onDragStarted: (taskId) {
                      _initDraggingMode(taskId);
                    },
                    onDragEnded: () {
                      _stopDraggingMode();
                    },
                  ),
                ),
                const SizedBox(width: KnotCoreSpacings.mediumLarge),
                Align(
                  alignment: Alignment.topCenter,
                  child: KanbanColumn(
                    taskStatus: TaskStatus.inProgress,
                    title: widget.inProgressColumnTitle,
                    tasks: widget.inProgressTaskSummaryList,
                    width: KnotSemanticSizings.kanbanColumnWidth,
                    draggingTaskId: _draggingTaskId,
                    onTaskTapped: widget.onTaskTapped,
                    onTaskDropped: (int index, String? taskId) => widget
                        .onTaskMove
                        ?.call(taskId, TaskStatus.inProgress, index),
                    onCreateTask: (title) =>
                        widget.onCreateTask?.call(TaskStatus.inProgress, title),
                    onDragStarted: (taskId) {
                      _initDraggingMode(taskId);
                    },
                    onDragEnded: () {
                      _stopDraggingMode();
                    },
                  ),
                ),
                const SizedBox(width: KnotCoreSpacings.mediumLarge),
                Align(
                  alignment: Alignment.topCenter,
                  child: KanbanColumn(
                    taskStatus: TaskStatus.done,
                    title: widget.doneColumnTitle,
                    tasks: widget.doneTaskSummaryList,
                    width: KnotSemanticSizings.kanbanColumnWidth,
                    draggingTaskId: _draggingTaskId,
                    onTaskTapped: widget.onTaskTapped,
                    onTaskDropped: (int index, String? taskId) =>
                        widget.onTaskMove?.call(taskId, TaskStatus.done, index),
                    onCreateTask: (title) =>
                        widget.onCreateTask?.call(TaskStatus.done, title),
                    onDragStarted: (taskId) {
                      _initDraggingMode(taskId);
                    },
                    onDragEnded: () {
                      _stopDraggingMode();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
