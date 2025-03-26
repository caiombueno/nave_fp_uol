import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:timezone/timezone.dart';

part 'generated/task.mapper.dart';

@MappableClass()
sealed class Task with TaskMappable {
  const Task({
    required this.id,
    required this.title,
    required this.descriptionContent,
    required this.status,
    required this.lastStatusUpdateDateTime,
    required this.notes,
  });

  final String? id;
  final String? title;
  final String? descriptionContent;
  final TaskStatus status;
  final TZDateTime? lastStatusUpdateDateTime;
  final List<Note>? notes;
}

@MappableClass()
class SystemTask extends Task with SystemTaskMappable {
  const SystemTask({
    required String? id,
    required String? title,
    required String? descriptionContent,
    required TaskStatus status,
    required TZDateTime? lastStatusUpdateDateTime,
    required List<Note>? notes,
    required this.isFree,
    required this.blockingTaskIds,
    required this.lessons,
  }) : super(
          id: id,
          title: title,
          descriptionContent: descriptionContent,
          status: status,
          lastStatusUpdateDateTime: lastStatusUpdateDateTime,
          notes: notes,
        );

  final bool? isFree;
  final List<String>? blockingTaskIds;
  final List<Lesson>? lessons;
}

@MappableClass()
class UserTask extends Task with UserTaskMappable {
  const UserTask({
    required String? id,
    required String? title,
    required String? descriptionContent,
    required TaskStatus status,
    required TZDateTime? lastStatusUpdateDateTime,
    required List<Note>? notes,
  }) : super(
          id: id,
          title: title,
          descriptionContent: descriptionContent,
          status: status,
          lastStatusUpdateDateTime: lastStatusUpdateDateTime,
          notes: notes,
        );
}
