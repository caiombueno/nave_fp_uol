import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/user_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/create_note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/firestore_client.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/create_user_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/update_user_task_description_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/update_user_task_title_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/update_note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/upsert_task_selected_sort_key_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/writes/upsert_task_status_sm.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

class SyncedDataSource {
  const SyncedDataSource(
    this._firestoreClient,
  );

  final FirestoreClient _firestoreClient;

  Stream<Either<Failure, List<SystemTaskSM>>> watchSystemTaskList() {
    return _firestoreClient.watchCollection(
      collection: _Collections.systemTasks,
      itemFromMap: SystemTaskSMMapper.fromMap,
      assumeCollectionExists: true,
    );
  }

  Stream<Either<Failure, SystemTaskSM>> watchSystemTask(String taskId) {
    return _firestoreClient.watchDocument(
      collection: _Collections.systemTasks,
      documentId: taskId,
      itemFromMap: SystemTaskSMMapper.fromMap,
    );
  }

  Stream<Either<Failure, List<UserTaskSM>>> watchUserTaskList(String userId) {
    return _firestoreClient.watchCollection(
      collection: _Collections.userTasks(userId),
      itemFromMap: UserTaskSMMapper.fromMap,
      assumeCollectionExists: false,
    );
  }

  Stream<Either<Failure, UserTaskSM>> watchUserTask({
    required String userId,
    required String taskId,
  }) {
    return _firestoreClient.watchDocument(
      collection: _Collections.userTasks(userId),
      documentId: taskId,
      itemFromMap: UserTaskSMMapper.fromMap,
    );
  }

  Stream<Either<Failure, List<SystemTaskUserDataSM>>>
      watchSystemTaskUserDataList(
    String userId,
  ) {
    return _firestoreClient.watchCollection(
      collection: _Collections.systemTaskUserData(userId),
      itemFromMap: SystemTaskUserDataSMMapper.fromMap,
      assumeCollectionExists: false,
    );
  }

  Stream<Either<Failure, SystemTaskUserDataSM?>> watchSystemTaskUserData({
    required String userId,
    required String taskId,
  }) {
    return _firestoreClient.watchDocument(
      collection: _Collections.systemTaskUserData(userId),
      documentId: taskId,
      itemFromMap: SystemTaskUserDataSMMapper.fromMap,
    );
  }

  Stream<Either<Failure, List<NoteSM>>> watchSystemTaskNotes({
    required String userId,
    required String taskId,
  }) {
    return _firestoreClient.watchCollection(
      collection: _Collections.systemTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      itemFromMap: NoteSMMapper.fromMap,
      assumeCollectionExists: false,
    );
  }

  Stream<Either<Failure, List<NoteSM>>> watchUserTaskNotes({
    required String userId,
    required String taskId,
  }) {
    return _firestoreClient.watchCollection(
      collection: _Collections.userTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      itemFromMap: NoteSMMapper.fromMap,
      assumeCollectionExists: false,
    );
  }

  Stream<Either<Failure, List<LessonSM>>> watchLessonList() {
    return _firestoreClient.watchCollection(
      collection: _Collections.lessons,
      itemFromMap: LessonSMMapper.fromMap,
      assumeCollectionExists: true,
    );
  }

  Stream<Either<Failure, LessonSM>> watchLesson(
    String lessonId,
  ) {
    return _firestoreClient.watchDocument(
      collection: _Collections.lessons,
      documentId: lessonId,
      itemFromMap: LessonSMMapper.fromMap,
    );
  }

  Stream<Either<Failure, LessonUserDataSM>> watchLessonUserData({
    required String userId,
    required String lessonId,
  }) {
    return _firestoreClient.watchDocument(
      collection: _Collections.lessonUserData(userId),
      documentId: lessonId,
      itemFromMap: LessonUserDataSMMapper.fromMap,
    );
  }

  Stream<Either<Failure, List<LessonUserDataSM>>> watchLessonUserDataList(
    String userId,
  ) {
    return _firestoreClient.watchCollection(
      collection: _Collections.lessonUserData(userId),
      itemFromMap: LessonUserDataSMMapper.fromMap,
      assumeCollectionExists: false,
    );
  }

  Future<void> updateSystemTaskPlacement({
    required String userId,
    required String taskId,
    required TaskStatusSM status,
    required double selectedSortKey,
    required bool didUpdateStatus,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.systemTaskUserData(
        userId,
      ),
      data: didUpdateStatus
          ? UpsertTaskStatusSM(
              taskId: taskId,
              status: status,
              selectedSortKey: selectedSortKey,
            ).toMap()
          : UpsertTaskSelectedSortKeySM(
              taskId: taskId,
              selectedSortKey: selectedSortKey,
            ).toMap(),
      replaceEntireDocument: false,
    );
  }

  Future<void> updateUserTaskPlacement({
    required String userId,
    required String taskId,
    required TaskStatusSM status,
    required double selectedSortKey,
    required bool didUpdateStatus,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.userTasks(userId),
      data: didUpdateStatus
          ? UpsertTaskStatusSM(
              taskId: taskId,
              status: status,
              selectedSortKey: selectedSortKey,
            ).toMap()
          : UpsertTaskSelectedSortKeySM(
              taskId: taskId,
              selectedSortKey: selectedSortKey,
            ).toMap(),
      replaceEntireDocument: false,
    );
  }

  Future<void> createUserTask({
    required String userId,
    required String title,
    required double selectedSortKey,
    required TaskStatusSM status,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.userTasks(userId),
      data: CreateUserTaskSM(
        title: title,
        selectedSortKey: selectedSortKey,
        status: status,
      ).toMap(),
      replaceEntireDocument: true,
    );
  }

  Future<void> updateUserTaskTitle({
    required String userId,
    required String taskId,
    required String newTitle,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.userTasks(userId),
      data: UpdateUserTaskTitleSM(
        taskId: taskId,
        newTitle: newTitle,
      ).toMap(),
      replaceEntireDocument: false,
    );
  }

  Future<void> updateUserTaskDescription({
    required String userId,
    required String taskId,
    required String newContent,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.userTasks(userId),
      data: UpdateUserTaskDescriptionSM(
        taskId: taskId,
        newContent: newContent,
      ).toMap(),
      replaceEntireDocument: false,
    );
  }

  Future<void> upsertSystemTaskNote({
    required String userId,
    required String taskId,
    required String? noteId,
    required String content,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.systemTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      data: noteId != null
          ? UpdateNoteSM(
              noteId: noteId,
              content: content,
            ).toMap()
          : CreateNoteSM(
              content: content,
            ).toMap(),
      replaceEntireDocument: false,
    );
  }

  Future<void> deleteSystemTaskNote({
    required String userId,
    required String taskId,
    required String noteId,
  }) async {
    await _firestoreClient.deleteDocument(
      collection: _Collections.systemTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      documentId: noteId,
    );
  }

  Future<void> deleteUserTaskNote({
    required String userId,
    required String taskId,
    required String noteId,
  }) async {
    await _firestoreClient.deleteDocument(
      collection: _Collections.userTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      documentId: noteId,
    );
  }

  Future<void> deleteUserTask({
    required String userId,
    required String taskId,
  }) async {
    await _firestoreClient.deleteDocument(
      collection: _Collections.userTasks(
        userId,
      ),
      documentId: taskId,
    );
  }

  Future<void> upsertUserTaskNote({
    required String userId,
    required String taskId,
    required String? noteId,
    required String content,
  }) async {
    await _firestoreClient.upsertDocument(
      collection: _Collections.userTaskNotes(
        userId: userId,
        taskId: taskId,
      ),
      data: noteId != null
          ? UpdateNoteSM(
              noteId: noteId,
              content: content,
            ).toMap()
          : CreateNoteSM(
              content: content,
            ).toMap(),
      replaceEntireDocument: false,
    );
  }
}

abstract class _Collections {
  static String systemTasks = 'systemTasks';
  static String lessons = 'lessons';
  static String users = 'users';
  static String _systemTaskUserData = 'systemTaskUserData';
  static String _lessonUserData = 'lessonUserData';
  static String _userTasks = 'tasks';

  static String userTasks(String userId) {
    return '$users/$userId/$_userTasks';
  }

  static String systemTaskNotes({
    required String userId,
    required String taskId,
  }) {
    return '$users/$userId/$_systemTaskUserData/$taskId/notes';
  }

  static String userTaskNotes({
    required String userId,
    required String taskId,
  }) {
    return '$users/$userId/$_userTasks/$taskId/notes';
  }

  static String systemTaskUserData(String userId) {
    return '$users/$userId/$_systemTaskUserData';
  }

  static String lessonUserData(String userId) {
    return '$users/$userId/$_lessonUserData';
  }
}
