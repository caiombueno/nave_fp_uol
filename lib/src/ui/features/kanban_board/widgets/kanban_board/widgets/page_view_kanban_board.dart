import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/kanban_column.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewKanbanBoard extends StatefulWidget {
  const PageViewKanbanBoard({
    super.key,
    required this.toDoTaskSummaryList,
    required this.inProgressTaskSummaryList,
    required this.doneTaskSummaryList,
    required this.toDoColumnTitle,
    required this.inProgressColumnTitle,
    required this.doneColumnTitle,
    this.onTaskMove,
    this.onCreateTask,
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
  State<PageViewKanbanBoard> createState() => _PageViewKanbanBoardState();
}

enum PageViewAutoScrollDirection {
  left,
  right,
}

class _PageViewKanbanBoardState extends State<PageViewKanbanBoard>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
  );

  String? _draggingTaskId;

  Ticker? _autoScrollTicker;
  bool _isAutoScrolling = false;

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTicker?.dispose();
    super.dispose();
  }

  /// Starts the ticker if not already running.
  void _startAutoScrollTicker({
    required PageViewAutoScrollDirection direction,
  }) {
    // If a ticker is already running, update the direction.
    if (_autoScrollTicker != null) {
      return;
    }

    Ticker? autoScrollTicker;
    try {
      autoScrollTicker = createTicker((_) {
        _triggerAutoScroll(direction: direction);
      });
    } catch (_) {
      autoScrollTicker = null;
    }

    _autoScrollTicker = autoScrollTicker;

    _autoScrollTicker?.start();
  }

  /// Stops and disposes the ticker.
  void _stopAutoScrollTicker() {
    _autoScrollTicker?.stop();
    _autoScrollTicker?.dispose();
    _autoScrollTicker = null;
  }

  /// Triggers an auto-scroll in the given direction.
  void _triggerAutoScroll({required PageViewAutoScrollDirection direction}) {
    if (_isAutoScrolling) return;

    // Adjust these values to control speed and distance per tick.
    const double scrollDelta = 50.0;
    const Duration animDuration = Duration(milliseconds: 100);
    const Curve curve = Curves.linear;

    final double currentOffset = _pageController.offset;
    final double targetOffset = (direction == PageViewAutoScrollDirection.left
            ? (currentOffset - scrollDelta)
            : (currentOffset + scrollDelta))
        .clamp(_pageController.position.minScrollExtent,
            _pageController.position.maxScrollExtent);

    _isAutoScrolling = true;
    _pageController
        .animateTo(
      targetOffset,
      duration: animDuration,
      curve: curve,
    )
        .whenComplete(() {
      _isAutoScrolling = false;
    });
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
        direction: PageViewAutoScrollDirection.left,
      );
    } else if (localOffset.dx > widgetWidth - edgeThreshold) {
      // Near the right edge.
      _startAutoScrollTicker(
        direction: PageViewAutoScrollDirection.right,
      );
    } else {
      _stopAutoScrollTicker();
    }
  }

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

  bool get _isDragModeActive => _draggingTaskId != null;

  @override
  Widget build(BuildContext context) {
    final columnsCount = TaskStatus.values.length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Listener(
            onPointerMove: (PointerMoveEvent event) =>
                _onPointerMove(event.position),
            onPointerUp: (_) {
              _stopAutoScrollTicker();
              _stopDraggingMode();
            },
            child: PageView(
              controller: _pageController,
              // Disable snapping during drag.
              pageSnapping: !_isDragModeActive,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: KanbanColumn(
                      taskStatus: TaskStatus.toDo,
                      title: widget.toDoColumnTitle,
                      tasks: widget.toDoTaskSummaryList,
                      draggingTaskId: _draggingTaskId,
                      onTaskTapped: widget.onTaskTapped,
                      onTaskDropped: (int index, String? taskId) =>
                          widget.onTaskMove?.call(
                        taskId,
                        TaskStatus.toDo,
                        index,
                      ),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: KanbanColumn(
                      taskStatus: TaskStatus.inProgress,
                      title: widget.inProgressColumnTitle,
                      tasks: widget.inProgressTaskSummaryList,
                      draggingTaskId: _draggingTaskId,
                      onTaskTapped: widget.onTaskTapped,
                      onTaskDropped: (int index, String? taskId) =>
                          widget.onTaskMove?.call(
                        taskId,
                        TaskStatus.inProgress,
                        index,
                      ),
                      onCreateTask: (title) => widget.onCreateTask
                          ?.call(TaskStatus.inProgress, title),
                      onDragStarted: (taskId) {
                        _initDraggingMode(taskId);
                      },
                      onDragEnded: () {
                        _stopDraggingMode();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: KanbanColumn(
                      taskStatus: TaskStatus.done,
                      title: widget.doneColumnTitle,
                      tasks: widget.doneTaskSummaryList,
                      draggingTaskId: _draggingTaskId,
                      onTaskTapped: widget.onTaskTapped,
                      onTaskDropped: (int index, String? taskId) =>
                          widget.onTaskMove?.call(
                        taskId,
                        TaskStatus.done,
                        index,
                      ),
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
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: KnotCoreSpacings.mediumLarge),
        _PageIndicator(
          pageController: _pageController,
          columnsCount: columnsCount,
        ),
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.pageController,
    required this.columnsCount,
  });

  final PageController pageController;
  final int columnsCount;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: columnsCount,
      effect: ColorTransitionEffect(
        dotWidth: 8,
        dotHeight: 8,
        activeDotColor: Colors.white,
        dotColor: Colors.white.withValues(alpha: 0.5),
      ),
    );
  }
}
