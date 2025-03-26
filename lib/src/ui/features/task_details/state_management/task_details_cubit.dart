import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

part 'task_details_mappers.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit({
    required this.taskId,
    required this.isUserTask,
  }) : super(const TaskDetailsLoading()) {
    if (isUserTask) {
      _taskSubscription = _taskRepository.watchUserTask(taskId).listen(
        (taskEither) {
          emit(
            taskEither.fold(
              (failure) => const TaskDetailsFailed(),
              (task) => TaskDetailsLoaded(
                task: task.toTaskDetailsVM(),
              ),
            ),
          );
        },
      );
      return;
    }

    _taskSubscription = _taskRepository.watchSystemTask(taskId).listen(
      (taskEither) {
        emit(
          taskEither.fold(
            (failure) => const TaskDetailsFailed(),
            (task) => TaskDetailsLoaded(
              task: task.toTaskDetailsVM(),
            ),
          ),
        );
      },
    );
  }
  final String taskId;
  final bool isUserTask;

  late final StreamSubscription _taskSubscription;

  final _taskRepository = sl<TaskRepository>();

  void createNote({
    required List<Map<String, dynamic>> content,
  }) {
    final state = this.state;

    if (state is! TaskDetailsLoaded) {
      return;
    }

    final encodedContent = content.toEncodedContentOrNull();

    if (encodedContent == null) {
      return;
    }

    _taskRepository.createNote(
      taskId: taskId,
      content: encodedContent,
      isSystemTask: !state.task.isUserTask,
    );
  }

  void deleteNote({
    required String noteId,
  }) {
    final state = this.state;

    if (state is! TaskDetailsLoaded) {
      return;
    }

    _taskRepository.deleteNote(
      taskId: taskId,
      noteId: noteId,
      isSystemTask: !state.task.isUserTask,
    );
  }

  void editNote({
    required String noteId,
    required List<Map<String, dynamic>> content,
  }) {
    final state = this.state;

    if (state is! TaskDetailsLoaded) {
      return;
    }

    final encodedContent = content.toEncodedContentOrNull();

    if (encodedContent == null) {
      return;
    }

    _taskRepository.updateNote(
      taskId: taskId,
      noteId: noteId,
      content: encodedContent,
      isSystemTask: !state.task.isUserTask,
    );
  }

  @override
  Future<void> close() {
    _taskSubscription.cancel();
    return super.close();
  }
}
