import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/router.gr.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_lesson_list_tile.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_expansion_tile.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

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
        title: Text(
          context.l10n.taskDetailsLessonsSectionTitle,
          style: KnotSemanticTextStyles.taskDetailsLessonSectionTitle,
        ),
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
                onTap: () {
                  context.router.push(
                    switch (lesson) {
                      TaskDetailsTextLessonVM lesson =>
                        TextLessonRoute(lessonId: lesson.id),
                      TaskDetailsVideoLessonVM lesson =>
                        VideoLessonRoute(lessonId: lesson.id),
                    },
                  );
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
