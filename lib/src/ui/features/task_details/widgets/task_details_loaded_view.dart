import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_description.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_lessons_section.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_notes_section/task_details_notes_section.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class TaskDetailsLoadedView extends StatelessWidget {
  const TaskDetailsLoadedView({
    super.key,
    required this.descriptionContent,
    required this.isUserTask,
    required this.lessons,
    required this.notes,
  });
  final quill.Delta? descriptionContent;
  final bool isUserTask;
  final List<TaskDetailsLessonVM>? lessons;
  final List<TaskDetailsNoteVM>? notes;

  @override
  Widget build(BuildContext context) {
    final lessons = this.lessons;

    final descriptionContent = this.descriptionContent;

    const sectionGap = const SizedBox(
      height: KnotSemanticSpacings.taskDetailsScreenSectionGap,
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (descriptionContent != null)
            TaskDetailsDescription(
              descriptionContent: descriptionContent,
              isUserTask: isUserTask,
            ),
          if (lessons != null) ...[
            sectionGap,
            TaskDetailsLessonsSection(lessons: lessons),
          ],
          if (notes != null) ...[
            sectionGap,
            TaskDetailsNotesSection(notes: notes),
          ],
        ],
      ),
    );
  }
}
