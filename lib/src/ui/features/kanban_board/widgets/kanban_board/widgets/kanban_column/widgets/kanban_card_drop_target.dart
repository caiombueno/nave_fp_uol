import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_cards/kanban_card.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

/// This widget wraps each card (or an extra drop zone at the end) in a [DragTarget].
///
/// It also receives the id of the card being dragged and, if the card for this slot
/// is being dragged, returns an empty widget (hiding both the card and its gap).
class KanbanCardDropTarget extends StatelessWidget {
  const KanbanCardDropTarget({
    super.key,
    required this.onTaskDropped,
    required this.shouldAcceptDrop,
    required this.task,
    required this.onTaskTapped,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.taskStatus,
  });

  final void Function(String? droppedTaskId) onTaskDropped;
  final bool Function(String? droppedTaskId) shouldAcceptDrop;
  final OnTaskTapped? onTaskTapped;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;
  final TaskStatus taskStatus;
  final TaskSummaryVM? task;

  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskSummaryVM>(
      onWillAcceptWithDetails: (details) => shouldAcceptDrop(details.data.id),
      onAcceptWithDetails: (details) {
        onTaskDropped(details.data.id);
      },
      builder: (context, candidateData, _) {
        // wether a card is being dragged over this drop zone
        final isDraggingOver = candidateData.isNotEmpty;

        final draggedTask = isDraggingOver ? candidateData.first : null;

        final task = this.task;

        // If a card is being dragged over this drop zone, show a placeholder card.
        // It will indicate that a card can be dropped at the location.
        final placeholderCard = draggedTask != null
            ? PlaceholderKanbanCard(
                title: draggedTask.title,
                accessStatus: draggedTask.accessStatus,
              )
            : null;

        // If there is no card for this slot, return an empty slot
        // so that a card can be dropped here.
        if (task == null) {
          return AnimatedSize(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.bottomCenter,
            child: isDraggingOver && placeholderCard != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: KnotCoreSpacings.xSmall),
                    child: placeholderCard,
                  )
                : const SizedBox(height: KnotCoreSpacings.medium),
          );
        }

        return AnimatedSize(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (placeholderCard != null) ...[
                placeholderCard,
                const SizedBox(height: KnotCoreSpacings.small),
              ],
              KanbanCard(
                task: task,
                onTaskTapped: onTaskTapped,
                onDragStarted: onDragStarted,
                onDragEnded: onDragEnded,
                taskStatus: taskStatus,
              ),
              // const SizedBox(height: KnotCoreSpacings.small)
            ],
          ),
        );
      },
    );
  }
}
