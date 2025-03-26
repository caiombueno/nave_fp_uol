part of 'task_details_cubit.dart';

extension on Task {
  TaskDetailsTaskVM toTaskDetailsVM() {
    final task = this;

    final lessons =
        (task is SystemTask) ? task.lessons?.toTaskDetailsLessonVM() : null;

    final quillDescriptionContent = descriptionContent?.toQuillDocumentOrNull();

    final isUserTask = this is UserTask;

    return TaskDetailsTaskVM(
      title: title,
      descriptionContent: quillDescriptionContent,
      isUserTask: isUserTask,
      lessons: lessons,
      notes: notes?.toTaskDetailsNoteVM(),
    );
  }
}

extension on List<Note> {
  List<TaskDetailsNoteVM> toTaskDetailsNoteVM() {
    return map((note) => note.toTaskDetailsNoteVM()).toList();
  }
}

extension on Note {
  TaskDetailsNoteVM toTaskDetailsNoteVM() {
    return TaskDetailsNoteVM(
      id: id,
      content: content?.toQuillDocumentOrNull(),
    );
  }
}

extension on List<Lesson> {
  List<TaskDetailsLessonVM> toTaskDetailsLessonVM() {
    return map((lesson) => lesson.toTaskDetailsLessonVM()).toList();
  }
}

extension on Lesson {
  TaskDetailsLessonVM toTaskDetailsLessonVM() => switch (this) {
        TextLesson lesson => TaskDetailsTextLessonVM(
            id: lesson.id,
            title: lesson.title,
            isCompleted: lesson.isCompleted,
          ),
        VideoLesson lesson => TaskDetailsVideoLessonVM(
            id: lesson.id,
            title: lesson.title,
            isCompleted: lesson.isCompleted,
          ),
      };
}
