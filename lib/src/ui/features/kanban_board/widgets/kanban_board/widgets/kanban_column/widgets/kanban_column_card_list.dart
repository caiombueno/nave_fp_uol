import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/empty_card_list_drag_target.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_card_drop_target.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/kanban_column.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/utils/utils.dart';

/// Displays a list of cards.
///
/// It tracks which card is being dragged so that when a card is moved its
/// original slot (including the gap) is removed.
class KanbanColumnCardList extends StatefulWidget {
  const KanbanColumnCardList({
    super.key,
    required this.tasks,
    this.onTaskDropped,
    this.onTaskTapped,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.draggingTaskId,
    this.padding,
    required this.taskStatus,
  });

  final List<TaskSummaryVM> tasks;
  final OnTaskDropped? onTaskDropped;
  final OnTaskTapped? onTaskTapped;
  final void Function(String? taskId) onDragStarted;
  final VoidCallback onDragEnded;
  final String? draggingTaskId;
  final EdgeInsetsGeometry? padding;
  final TaskStatus taskStatus;

  @override
  State<KanbanColumnCardList> createState() => _KanbanColumnCardListState();
}

class _KanbanColumnCardListState extends State<KanbanColumnCardList>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;

  List<TaskSummaryVM> _tasks = [];

  @override
  void didUpdateWidget(covariant KanbanColumnCardList oldWidget) {
    setState(() {
      _tasks = widget.tasks
          .whereNot((task) => task.id == widget.draggingTaskId)
          .toList();
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _tasks = widget.tasks
        .whereNot((task) => task.id == widget.draggingTaskId)
        .toList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _autoScrollTimer?.cancel();
    _autoScrollTicker?.stop();
    if (!(_autoScrollTicker?.isActive ?? false)) _autoScrollTicker?.dispose();

    super.dispose();
  }

  Ticker? _autoScrollTicker;

  bool _isAutoScrolling = false;

  /// Starts the ticker if not already running.
  void _startAutoScrollTicker({
    required KanbanColumnAutoScrollDirection autoScrollDirection,
  }) {
    if (_autoScrollTicker != null) return;

    Ticker? ticker;
    try {
      ticker = createTicker(
        (_) => _triggerAutoScroll(
          autoScrollDirection: autoScrollDirection,
        ),
      );
    } catch (_) {
      ticker = null;
    }

    if (ticker == null) return;

    _autoScrollTicker = ticker;

    ticker.start();
  }

  /// Stops and disposes the ticker.
  void _stopAutoScrollTicker() {
    _autoScrollTicker?.stop();
  }

  /// Triggers auto scroll if the scroll direction is set and no animation is in progress.
  void _triggerAutoScroll({
    required KanbanColumnAutoScrollDirection autoScrollDirection,
  }) {
    // If no scroll direction is set or an animation is already in progress, do nothing.
    if (_isAutoScrolling || !_scrollController.hasClients) return;

    // How much to scroll per tick.
    const double scrollDelta = 50.0;

    // Calculate the new scroll offset based on the scroll direction.
    final targetOffset;
    if (autoScrollDirection == KanbanColumnAutoScrollDirection.bottom) {
      targetOffset = (_scrollController.offset - scrollDelta)
          .clamp(0.0, _scrollController.position.maxScrollExtent);
    } else {
      targetOffset = (_scrollController.offset + scrollDelta)
          .clamp(0.0, _scrollController.position.maxScrollExtent);
    }

    // Trigger the scroll action call and mark that an animation is in progress.
    _isAutoScrolling = true;
    _scrollController
        .animateTo(
      targetOffset,
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    )
        .whenComplete(() {
      _isAutoScrolling = false;
    });
  }

  /// If the pointer is near the top or bottom of the widget, start auto-scrolling.
  /// Otherwise, stop auto-scrolling.
  void _onPointerMoving(Offset globalPosition) {
    if (widget.draggingTaskId == null || !mounted) return;

    // Convert the global position to the widget's local coordinate system.
    final renderBox = castOrNull<RenderBox>(context.findRenderObject());

    if (renderBox == null) return;

    final Offset localOffset = renderBox.globalToLocal(globalPosition);

    final double widgetHeight = renderBox.size.height;

    // The threshold to start auto-scrolling.
    const double edgeThreshold = 80.0;

    // Determine the scroll direction based on pointer location.
    if (localOffset.dy < edgeThreshold) {
      _startAutoScrollTicker(
        autoScrollDirection: KanbanColumnAutoScrollDirection.bottom,
      );
    } else if (localOffset.dy > widgetHeight - edgeThreshold) {
      _startAutoScrollTicker(
        autoScrollDirection: KanbanColumnAutoScrollDirection.top,
      );
    } else {
      _stopAutoScrollTicker();
    }
  }

  int? _calculateInsertionIndex(String droppedTaskId, int index) {
    final droppedTaskIndex = _tasks.findTaskIndex(droppedTaskId);

    final isDroppedTaskAlreadyInColumn = droppedTaskIndex != null;

    final isDroppedTaskInSamePosition = droppedTaskIndex == index;

    if (isDroppedTaskAlreadyInColumn && isDroppedTaskInSamePosition) {
      return null;
    }

    final isDroppedTaskInColumnAndOnTopOfCurrentSlot =
        isDroppedTaskAlreadyInColumn && index > droppedTaskIndex;

    final droppedTaskNewIndex =
        (isDroppedTaskInColumnAndOnTopOfCurrentSlot ? index - 1 : index)
            .clamp(0, _tasks.length);

    return droppedTaskNewIndex;
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _tasks;
    if (tasks.isEmpty) {
      return EmptyCardListDragTarget(
        onTaskDropped: widget.onTaskDropped,
      );
    }

    return Listener(
      onPointerMove: (PointerMoveEvent event) {
        _onPointerMoving(event.position);
      },
      onPointerUp: (_) => _stopAutoScrollTicker(),
      child: Scrollbar(
        controller: _scrollController,
        child: ListView.separated(
          primary: false,
          controller: _scrollController,
          padding: widget.padding,
          shrinkWrap: true,
          // Add one extra slot to allow dropping a card at the end.
          itemCount: tasks.length + 1,
          separatorBuilder: (context, index) =>
              (index == tasks.length || index == tasks.length - 1)
                  ? SizedBox.shrink()
                  : SizedBox(height: KnotCoreSpacings.small),
          itemBuilder: (context, index) {
            final isLastItem = index == tasks.length;

            final task = isLastItem ? null : tasks[index];

            // If this slot corresponds to a card that is currently being dragged,
            // return an empty widget.
            if (!isLastItem && task?.id == widget.draggingTaskId) {
              return SizedBox.shrink(
                key: ValueKey('$index, ${task?.id}'),
              );
            }

            return KanbanCardDropTarget(
              key: ValueKey('$index, ${task?.id}'),
              task: task,
              taskStatus: widget.taskStatus,
              onTaskTapped: widget.onTaskTapped,
              onDragStarted: () => widget.onDragStarted(task?.id),
              onDragEnded: widget.onDragEnded,

              onTaskDropped: (String? droppedTaskId) {
                if (droppedTaskId == null) return;

                final validIndex =
                    _calculateInsertionIndex(droppedTaskId, index);

                if (validIndex == null) return;

                widget.onTaskDropped?.call(validIndex, droppedTaskId);
              },
              // Accept the drop if the task is not in the column.
              //
              // If it is in the column, only accept if it is not in the same position
              // or in the next position (as it will be inserted in the same place).
              shouldAcceptDrop: (droppedTaskId) {
                if (droppedTaskId == null) return false;

                final droppedTaskIndex = tasks.findTaskIndex(droppedTaskId);

                final isDroppedTaskInColumn = droppedTaskIndex != -1;

                final isDroppedTaskInSamePosition = droppedTaskIndex == index;

                final isDroppedTaskInNextPosition =
                    droppedTaskIndex == index - 1;

                final isDroppedTaskInSameOrNextPosition =
                    isDroppedTaskInSamePosition || isDroppedTaskInNextPosition;

                final shouldAcceptDrop = !isDroppedTaskInColumn ||
                    !isDroppedTaskInSameOrNextPosition;

                return shouldAcceptDrop;
              },
            );
          },
        ),
      ),
    );
  }
}

extension TaskListExtensions on List<TaskSummaryVM> {
  int? findTaskIndex(String taskId) {
    final index = indexWhere((task) => task.id == taskId);
    if (index == -1) return null;
    return index;
  }
}

enum KanbanColumnAutoScrollDirection {
  top,
  bottom;
}
