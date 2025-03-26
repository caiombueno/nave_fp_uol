import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_sizings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

class TaskDetailsLessonListTile extends StatelessWidget {
  const TaskDetailsLessonListTile._internal({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });
  final String? title;
  final VoidCallback? onTap;
  final IconData? icon;

  factory TaskDetailsLessonListTile({
    Key? key,
    required TaskDetailsLessonVM lesson,
    VoidCallback? onTap,
  }) {
    return TaskDetailsLessonListTile._internal(
      key: key,
      onTap: onTap,
      title: lesson.title,
      icon: switch (lesson) {
        TaskDetailsTextLessonVM _ => KnotIcons.document,
        TaskDetailsVideoLessonVM _ => KnotIcons.video,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        selected: true,
        enableFeedback: true,
        horizontalTitleGap:
            KnotSemanticSpacings.taskDetailsLessonListTileHorizontalTitleGap,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        leading: (icon == null)
            ? null
            : Icon(
                icon,
                color: KnotSemanticColors.taskDetailsLessonListTileIcon,
                size: KnotSemanticSizings.taskDetailsLessonListTileIcon,
              ),
        title: (title != null)
            ? Text(
                title,
                style: KnotSemanticTextStyles.taskDetailsLessonListTileTitle,
              )
            : null,
      ),
    );
  }
}
