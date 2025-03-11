import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

part 'generated/task_details_state.mapper.dart';

@MappableClass()
sealed class TaskDetailsState with TaskDetailsStateMappable {
  const TaskDetailsState();
}

@MappableClass()
class TaskDetailsLoading extends TaskDetailsState
    with TaskDetailsLoadingMappable {
  const TaskDetailsLoading();
}

@MappableClass()
class TaskDetailsFailed extends TaskDetailsState
    with TaskDetailsFailedMappable {
  const TaskDetailsFailed();
}

@MappableClass()
class TaskDetailsLoaded extends TaskDetailsState
    with TaskDetailsLoadedMappable {
  const TaskDetailsLoaded({
    required this.task,
  });
  final TaskDetailsTaskVM task;
}

@MappableClass()
class TaskDetailsTaskVM with TaskDetailsTaskVMMappable {
  const TaskDetailsTaskVM({
    required this.title,
    required this.isUserTask,
    required this.descriptionContent,
    required this.lessons,
    required this.notes,
  });

  final String? title;
  final quill.Document? descriptionContent;
  final bool isUserTask;
  final List<TaskDetailsLessonVM>? lessons;
  final List<TaskDetailsNoteVM>? notes;
}

@MappableClass()
sealed class TaskDetailsLessonVM with TaskDetailsLessonVMMappable {
  const TaskDetailsLessonVM({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  final String id;
  final String? title;
  final bool? isCompleted;
}

@MappableClass()
class TaskDetailsTextLessonVM extends TaskDetailsLessonVM
    with TaskDetailsTextLessonVMMappable {
  const TaskDetailsTextLessonVM({
    required String id,
    required String? title,
    required bool? isCompleted,
  }) : super(id: id, title: title, isCompleted: isCompleted);
}

@MappableClass()
class TaskDetailsVideoLessonVM extends TaskDetailsLessonVM
    with TaskDetailsVideoLessonVMMappable {
  const TaskDetailsVideoLessonVM({
    required String id,
    required String? title,
    required bool? isCompleted,
  }) : super(id: id, title: title, isCompleted: isCompleted);
}

@MappableClass()
class TaskDetailsNoteVM with TaskDetailsNoteVMMappable {
  final String id;
  final quill.Document? content;

  const TaskDetailsNoteVM({
    required this.id,
    required this.content,
  });
}
