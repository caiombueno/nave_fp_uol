import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/auth_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/user_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/synced_data_source.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';
import 'package:nave_fp_uol/src/domain_models/task_summary.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart';

part 'task_repository_mappers.dart';

class TaskRepository {
  const TaskRepository({
    required SyncedDataSource syncedDataSource,
    required AuthDataSource authDataSource,
  })  : _syncedDataSource = syncedDataSource,
        _authDataSource = authDataSource;

  final SyncedDataSource _syncedDataSource;
  final AuthDataSource _authDataSource;

  Stream<Either<Failure, List<SystemTaskSummary>>>
      watchSystemTaskSummaryList() {
    final systemTasksStream = _syncedDataSource.watchSystemTaskList();

    return _authDataSource.watchUserId().switchMap((userId) {
      return Rx.combineLatest2<
          Either<Failure, List<SystemTaskSM>>,
          Either<Failure, List<SystemTaskUserDataSM>>,
          Either<Failure, List<SystemTaskSummary>>>(
        systemTasksStream,
        userId != null
            ? _syncedDataSource.watchSystemTaskUserDataList(userId)
            : Stream.value(
                right([]),
              ),
        (systemTaskListEither, taskUserDataListEither) {
          return taskUserDataListEither.bind((taskUserDataList) {
            return systemTaskListEither.map(
              (smList) => smList.toDM(
                taskUserDataList,
              ),
            );
          });
        },
      );
    });
  }

  Stream<Either<Failure, List<UserTaskSummary>>> watchUserTaskSummaryList() {
    return _watchWithUser((userId) {
      return _syncedDataSource.watchUserTaskList(userId).map(
            (either) => either.map(
              (smList) => smList.toDM(),
            ),
          );
    });
  }

  Stream<Either<Failure, SystemTask>> watchSystemTask(String taskId) {
    return _authDataSource.watchUserId().switchMap((userId) {
      return Rx.combineLatest4<
          Either<Failure, SystemTaskSM>,
          Either<Failure, SystemTaskUserDataSM?>,
          Either<Failure, List<NoteSM>>,
          Either<Failure, List<Lesson>>,
          Either<Failure, SystemTask>>(
        _syncedDataSource.watchSystemTask(taskId),
        userId != null
            ? _syncedDataSource.watchSystemTaskUserData(
                userId: userId,
                taskId: taskId,
              )
            : Stream.value(
                right(null),
              ),
        userId != null
            ? _syncedDataSource.watchSystemTaskNotes(
                userId: userId,
                taskId: taskId,
              )
            : Stream.value(
                right([]),
              ),
        _watchLessonList(),
        (systemTaskEither, taskUserDataEither, noteListEither,
            lessonListEither) {
          return taskUserDataEither.bind((taskUserData) {
            return noteListEither.bind((noteList) {
              return lessonListEither.bind((lessons) {
                return systemTaskEither.map(
                  (smList) => smList.toDM(
                    taskUserData: taskUserData,
                    notes: noteList,
                    allLessons: lessons,
                  ),
                );
              });
            });
          });
        },
      );
    });
  }

  Stream<Either<Failure, List<Lesson>>> _watchLessonList() {
    final lessonsStream = _syncedDataSource.watchLessonList();
    return _authDataSource.watchUserId().switchMap((userId) {
      return Rx.combineLatest2<
          Either<Failure, List<LessonSM>>,
          Either<Failure, List<LessonUserDataSM>>,
          Either<Failure, List<Lesson>>>(
        lessonsStream,
        userId != null
            ? _syncedDataSource.watchLessonUserDataList(userId)
            : Stream.value(
                right([]),
              ),
        (lessonListEither, lessonUserDataListEither) {
          return lessonUserDataListEither.bind((lessonUserDataList) {
            return lessonListEither.map(
              (smList) => smList.toDM(
                lessonUserDataList,
              ),
            );
          });
        },
      );
    });
  }

  Stream<Either<Failure, UserTask>> watchUserTask(String taskId) {
    return _watchWithUser((userId) {
      return Rx.combineLatest2<Either<Failure, UserTaskSM>,
          Either<Failure, List<NoteSM>>, Either<Failure, UserTask>>(
        _syncedDataSource.watchUserTask(
          userId: userId,
          taskId: taskId,
        ),
        _syncedDataSource.watchUserTaskNotes(
          userId: userId,
          taskId: taskId,
        ),
        (userTaskEither, noteListEither) {
          return noteListEither.bind((noteList) {
            return userTaskEither.map(
              (sm) => sm.toDM(
                notes: noteList,
              ),
            );
          });
        },
      );
    });
  }

  Future<Either<Failure, void>> updateTaskPlacement({
    required String taskId,
    required TaskStatus status,
    required bool isSystemTask,
    required double selectedSortKey,
    required bool didUpdateStatus,
  }) async {
    return _doWithUser((userId) async {
      if (isSystemTask) {
        await _syncedDataSource.updateSystemTaskPlacement(
          userId: userId,
          taskId: taskId,
          status: status.toSM(),
          selectedSortKey: selectedSortKey,
          didUpdateStatus: didUpdateStatus,
        );
      } else {
        await _syncedDataSource.updateUserTaskPlacement(
          userId: userId,
          taskId: taskId,
          status: status.toSM(),
          selectedSortKey: selectedSortKey,
          didUpdateStatus: didUpdateStatus,
        );
      }

      return right(null);
    });
  }

  Future<Either<Failure, void>> createUserTask({
    required String title,
    required double selectedSortKey,
    required TaskStatus status,
  }) async {
    return _doWithUser((userId) async {
      await _syncedDataSource.createUserTask(
        userId: userId,
        title: title,
        status: status.toSM(),
        selectedSortKey: selectedSortKey,
      );

      return right(null);
    });
  }

  Future<Either<Failure, void>> createNote({
    required String taskId,
    required String content,
    required bool isSystemTask,
  }) =>
      _upsertNote(
        taskId: taskId,
        noteId: null,
        content: content,
        isSystemTask: isSystemTask,
      );

  Future<Either<Failure, void>> updateNote({
    required String taskId,
    required String noteId,
    required String content,
    required bool isSystemTask,
  }) =>
      _upsertNote(
        taskId: taskId,
        noteId: noteId,
        content: content,
        isSystemTask: isSystemTask,
      );

  Future<Either<Failure, void>> deleteNote({
    required String taskId,
    required String noteId,
    required bool isSystemTask,
  }) async {
    return _doWithUser((userId) async {
      if (isSystemTask) {
        await _syncedDataSource.deleteSystemTaskNote(
          userId: userId,
          taskId: taskId,
          noteId: noteId,
        );
      } else {
        await _syncedDataSource.deleteUserTaskNote(
          userId: userId,
          taskId: taskId,
          noteId: noteId,
        );
      }

      return right(null);
    });
  }

  Future<Either<Failure, void>> deleteUserTask({
    required String taskId,
  }) {
    return _doWithUser((userId) async {
      await _syncedDataSource.deleteUserTask(
        userId: userId,
        taskId: taskId,
      );
      return right(null);
    });
  }

  Future<Either<Failure, void>> updateUserTaskTitle({
    required String taskId,
    required String newTitle,
  }) {
    return _doWithUser((userId) async {
      await _syncedDataSource.updateUserTaskTitle(
        userId: userId,
        taskId: taskId,
        newTitle: newTitle,
      );
      return right(null);
    });
  }

  Future<Either<Failure, void>> updateUserTaskDescription({
    required String taskId,
    required String newContent,
  }) {
    return _doWithUser((userId) async {
      await _syncedDataSource.updateUserTaskDescription(
        userId: userId,
        taskId: taskId,
        newContent: newContent,
      );
      return right(null);
    });
  }

  Stream<Either<Failure, Lesson>> watchLesson(String lessonId) {
    return _authDataSource.watchUserId().switchMap((userId) {
      return Rx.combineLatest2<Either<Failure, LessonSM>,
          Either<Failure, LessonUserDataSM?>, Either<Failure, Lesson>>(
        _syncedDataSource.watchLesson(lessonId),
        userId != null
            ? _syncedDataSource.watchLessonUserData(
                userId: userId,
                lessonId: lessonId,
              )
            : Stream.value(
                right(null),
              ),
        (lessonEither, lessonUserDataEither) {
          return lessonEither.bind((lesson) {
            return lessonUserDataEither.map((lessonUserData) {
              return lesson.toDM(
                lessonUserData,
              );
            });
          });
        },
      );
    });
  }

  Future<Either<Failure, void>> _upsertNote({
    required String taskId,
    required String? noteId,
    required String content,
    required bool isSystemTask,
  }) {
    return _doWithUser((userId) async {
      if (isSystemTask) {
        await _syncedDataSource.upsertSystemTaskNote(
          userId: userId,
          taskId: taskId,
          noteId: noteId,
          content: content,
        );
      } else {
        await _syncedDataSource.upsertUserTaskNote(
          userId: userId,
          taskId: taskId,
          noteId: noteId,
          content: content,
        );
      }

      return right(null);
    });
  }

  Future<Either<Failure, T>> _doWithUser<T>(
    Future<Either<Failure, T>> Function(String userId) action,
  ) async {
    final userId = await _authDataSource.getUserId();
    if (userId == null) {
      return left(
        UnauthenticatedUserFailure(),
      );
    }
    return action(userId);
  }

  Stream<Either<Failure, T>> _watchWithUser<T>(
    Stream<Either<Failure, T>> Function(String userId) action,
  ) {
    return _authDataSource.watchUserId().switchMap((userId) {
      if (userId == null) {
        return Stream.value(
          left(
            UnauthenticatedUserFailure(),
          ),
        );
      }
      return action(userId);
    });
  }
}
