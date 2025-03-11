import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_lesson_list_tile.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_expansion_tile.dart';

class TaskDetailsLessonsSection extends StatelessWidget {
  const TaskDetailsLessonsSection({
    super.key,
    required this.lessons,
  });
  final List<TaskDetailsLessonVM> lessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KnotSemanticColors.taskDetailsSectionBackground,
      padding: const EdgeInsets.symmetric(
        vertical: KnotSemanticSpacings.taskDetailsSectionVerticalPadding,
        horizontal: KnotSemanticSpacings.taskDetailsSectionHorizontalPadding,
      ),
      child: KnotExpansionTile(
        title: Text('Lessons'),
        leading: Icon(
          KnotIcons.checklist,
          color: KnotSemanticColors.taskDetailsLessonsSectionTitle,
        ),
        leadingGap: KnotSemanticSpacings.taskDetailsLessonsSectionLeadingGap,
        child: Column(
          children: lessons.map(
            (lesson) {
              return TaskDetailsLessonListTile(
                lesson: lesson,
                onTap: () {},
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
