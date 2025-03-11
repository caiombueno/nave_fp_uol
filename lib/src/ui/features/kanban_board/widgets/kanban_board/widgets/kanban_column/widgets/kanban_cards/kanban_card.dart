import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_cards/kanban_card_container.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_sizings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

/// Modified KanbanCard that calls the provided callbacks when dragging starts/ends.
class KanbanCard extends StatelessWidget {
  const KanbanCard({
    super.key,
    required this.task,
    required this.taskStatus,
    this.onTaskTapped,
    this.onDragStarted,
    this.onDragEnded,
  });

  final TaskSummaryVM task;
  final OnTaskTapped? onTaskTapped;
  final VoidCallback? onDragStarted;
  final VoidCallback? onDragEnded;
  final TaskStatus taskStatus;

  @override
  Widget build(BuildContext context) {
    final taskTitle = task.title;
    if (taskTitle == null) return const SizedBox.shrink();

    final kanbanCard = _KanbanCardTile(
      title: taskTitle,
      accessStatus: task.accessStatus,
      taskStatus: taskStatus,
    );

    return LayoutBuilder(
      builder: (_, constraints) => LongPressDraggable<TaskSummaryVM>(
        data: task,
        onDragStarted: onDragStarted,
        onDraggableCanceled: (_, __) => onDragEnded?.call(),
        onDragEnd: (_) => onDragEnded?.call(),
        feedback: Transform.rotate(
          angle: 0.1,
          child: SizedBox(
            width: constraints.maxWidth,
            child: kanbanCard,
          ),
        ),
        childWhenDragging: const SizedBox.shrink(),
        child: GestureDetector(
          onTap: () => onTaskTapped?.call(task.id),
          child: kanbanCard,
        ),
      ),
    );
  }
}

class PlaceholderKanbanCard extends StatelessWidget {
  const PlaceholderKanbanCard({
    super.key,
    required this.title,
    required this.accessStatus,
  });
  final String? title;
  final TaskAccessStatus? accessStatus;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.0,
      child: _KanbanCardTile(
        title: title ?? '',
        accessStatus: accessStatus ?? TaskAccessStatus.unlocked,
        taskStatus: TaskStatus.toDo,
      ),
    );
  }
}

class _KanbanCardTile extends StatelessWidget {
  const _KanbanCardTile({
    required this.title,
    required this.accessStatus,
    required this.taskStatus,
  });

  final String title;
  final TaskAccessStatus accessStatus;
  final TaskStatus taskStatus;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return KanbanCardContainer(
      child: Row(
        children: [
          if (accessStatus != TaskAccessStatus.unlocked) ...[
            Icon(
              (accessStatus == TaskAccessStatus.lockedByPayment)
                  ? Icons.lock
                  : Icons.lock_outline,
              size: KnotSemanticSizings.kanbanCardLeadingIcon,
              color: KnotSemanticColors.kanbanCardLeadingIcon,
            ),
            const SizedBox(width: KnotCoreSpacings.small),
          ],
          // add blur effect to the title if the task is locked by payment
          ImageFiltered(
            enabled: (accessStatus == TaskAccessStatus.lockedByPayment),
            imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Text(
              title,
              style: (taskStatus == TaskStatus.done)
                  ? KnotSemanticTextStyles.kanbanCardDoneTitle
                  : KnotSemanticTextStyles.kanbanCardTitle,
            ),
          ),
        ],
      ),
    );
  }
}
