import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_column_footer/kanban_column_footer.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_border_radius.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

import 'widgets/kanban_column_card_list.dart';

typedef OnTaskDropped = void Function(
  int index,
  String? taskId,
);

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({
    super.key,
    this.onTaskDropped,
    this.onTaskTapped,
    this.onCreateTask,
    required this.tasks,
    required this.title,
    this.width,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.draggingTaskId,
    required this.taskStatus,
  });

  final OnTaskDropped? onTaskDropped;
  final OnTaskTapped? onTaskTapped;
  final void Function(String title)? onCreateTask;
  final List<TaskSummaryVM> tasks;
  final TaskStatus taskStatus;
  final double? width;

  final void Function(String? taskId) onDragStarted;
  final VoidCallback onDragEnded;
  final String? draggingTaskId;

  final String title;

  void _createTask(String title) {
    if (title.isEmpty) return;
    onCreateTask?.call(title);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        elevation: 1,
        borderRadius: KnotCoreRadius.mediumLarge,
        color: KnotSemanticColors.kanbanColumnBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: KnotSemanticSpacings.kanbanColumnVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal:
                      KnotSemanticSpacings.kanbanColumnHorizontalPadding,
                ),
                child: Text(
                  title,
                  style: KnotSemanticTextStyles.kanbanColumnTitle,
                ),
              ),
              const SizedBox(height: KnotCoreSpacings.small),
              Flexible(
                child: KanbanColumnCardList(
                  taskStatus: taskStatus,
                  tasks: tasks,
                  onTaskDropped: onTaskDropped,
                  onTaskTapped: onTaskTapped,
                  onDragStarted: onDragStarted,
                  onDragEnded: onDragEnded,
                  draggingTaskId: draggingTaskId,
                  padding: const EdgeInsets.symmetric(
                    horizontal:
                        KnotSemanticSpacings.kanbanColumnHorizontalPadding,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: KanbanColumnFooter(
                  onCreateCard: _createTask,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
