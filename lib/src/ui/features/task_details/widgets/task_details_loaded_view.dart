import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_description.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_lessons_section.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_notes_section/task_details_notes_section.dart';

class TaskDetailsLoadedView extends StatelessWidget {
  const TaskDetailsLoadedView({
    super.key,
    required this.descriptionContent,
    required this.isUserTask,
    required this.lessons,
    required this.notes,
  });
  final quill.Document? descriptionContent;
  final bool isUserTask;
  final List<TaskDetailsLessonVM>? lessons;
  final List<TaskDetailsNoteVM>? notes;

  @override
  Widget build(BuildContext context) {
    final lessons = this.lessons;
    final descriptionContent = this.descriptionContent;
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
            const SizedBox(height: 14),
            TaskDetailsLessonsSection(lessons: lessons),
          ],
          if (notes != null) ...[
            const SizedBox(height: 14),
            TaskDetailsNotesSection(notes: notes),
          ],
        ],
      ),
    );
  }
}
