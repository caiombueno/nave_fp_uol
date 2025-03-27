import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/user_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  group('UserTaskSM', () {
    const testId = 'user-task-1';
    const testTitle = 'Complete profile';
    const testDescription = 'Fill out all profile fields';
    const testStatus = TaskStatusSM.inProgress;
    final testTimestamp = Timestamp.fromDate(DateTime(2023, 5, 15, 14, 30));
    const testSortKey = 3.0;

    test('initializes with all required parameters', () {
      // Arrange & Act
      final task = UserTaskSM(
        id: testId,
        title: testTitle,
        descriptionContent: testDescription,
        status: testStatus,
        lastStatusUpdateDateTime: testTimestamp,
        selectedSortKey: testSortKey,
      );

      // Assert
      expect(task.id, testId);
      expect(task.title, testTitle);
      expect(task.descriptionContent, testDescription);
      expect(task.status, testStatus);
      expect(task.lastStatusUpdateDateTime, testTimestamp);
      expect(task.selectedSortKey, testSortKey);
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      final task = UserTaskSM(
        id: testId,
        title: null,
        descriptionContent: null,
        status: null,
        lastStatusUpdateDateTime: null,
        selectedSortKey: null,
      );

      // Assert
      expect(task.id, testId);
      expect(task.title, null);
      expect(task.descriptionContent, null);
      expect(task.status, null);
      expect(task.lastStatusUpdateDateTime, null);
      expect(task.selectedSortKey, null);
    });

    test('deserialization creates correct object', () {
      // Arrange
      final map = {
        'id': testId,
        'title': testTitle,
        'descriptionContent': testDescription,
        'status': testStatus.toValue(),
        'lastStatusUpdateDateTime': testTimestamp,
        'selectedSortKey': testSortKey,
      };

      // Act
      final task = UserTaskSMMapper.fromMap(map);

      // Assert
      expect(task.id, testId);
      expect(task.title, testTitle);
      expect(task.descriptionContent, testDescription);
      expect(task.status, testStatus);
      expect(task.lastStatusUpdateDateTime, testTimestamp);
      expect(task.selectedSortKey, testSortKey);
    });

    test('handles null fields during serialization', () {
      // Arrange
      final task = UserTaskSM(
        id: testId,
        title: null,
        descriptionContent: null,
        status: null,
        lastStatusUpdateDateTime: null,
        selectedSortKey: null,
      );

      // Act
      final map = task.toMap();
      final deserializedTask = UserTaskSMMapper.fromMap(map);

      // Assert
      expect(deserializedTask.id, testId);
      expect(deserializedTask.title, null);
      expect(deserializedTask.descriptionContent, null);
      expect(deserializedTask.status, null);
      expect(deserializedTask.lastStatusUpdateDateTime, null);
      expect(deserializedTask.selectedSortKey, null);
    });
  });
}
