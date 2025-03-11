import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';

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

  @override
  Future<void> close() {
    _taskSubscription.cancel();
    return super.close();
  }
}
