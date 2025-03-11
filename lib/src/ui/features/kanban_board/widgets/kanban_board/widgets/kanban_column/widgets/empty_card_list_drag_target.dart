import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_cards/kanban_card.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/kanban_column.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

/// A widget that acts as a drop target for cards when a column is empty.
///
/// Displays a placeholder card when a card is dragged over it.
class EmptyCardListDragTarget extends StatelessWidget {
  const EmptyCardListDragTarget({
    super.key,
    required this.onTaskDropped,
  });

  final OnTaskDropped? onTaskDropped;

  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskSummaryVM>(
      onWillAcceptWithDetails: (_) => true,
      onAcceptWithDetails: (details) {
        onTaskDropped?.call(
          0,
          details.data.id,
        );
      },
      builder: (_, candidateData, __) {
        final isDragging = candidateData.isNotEmpty;
        final task = (isDragging) ? candidateData.first : null;
        final taskTitle = (isDragging) ? task?.title : null;

        return AnimatedSize(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.bottomCenter,
          child: (isDragging && taskTitle != null)
              ? PlaceholderKanbanCard(
                  title: taskTitle,
                  accessStatus:
                      task?.accessStatus ?? TaskAccessStatus.lockedByPayment,
                )
              : const SizedBox(height: KnotCoreSpacings.medium),
        );
      },
    );
  }
}
