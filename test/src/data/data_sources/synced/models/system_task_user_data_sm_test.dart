import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  group('SystemTaskUserDataSM', () {
    const testTaskId = 'task-1';
    const testStatus = TaskStatusSM.inProgress;
    final testTimestamp = Timestamp.fromDate(DateTime(2023, 1, 1, 12, 0));
    const testSortKey = 2.5;

    test('initializes with required parameters', () {
      // Arrange & Act
      final taskData = SystemTaskUserDataSM(
        taskId: testTaskId,
        status: testStatus,
        lastStatusUpdateDateTime: testTimestamp,
        selectedSortKey: testSortKey,
      );

      // Assert
      expect(taskData.taskId, testTaskId);
      expect(taskData.status, testStatus);
      expect(taskData.lastStatusUpdateDateTime, testTimestamp);
      expect(taskData.selectedSortKey, testSortKey);
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      final taskData = SystemTaskUserDataSM(
        taskId: testTaskId,
        status: null,
        lastStatusUpdateDateTime: null,
        selectedSortKey: null,
      );

      // Assert
      expect(taskData.taskId, testTaskId);
      expect(taskData.status, null);
      expect(taskData.lastStatusUpdateDateTime, null);
      expect(taskData.selectedSortKey, null);
    });

    test('deserialization respects field mapping', () {
      // Arrange
      final map = {
        'id': testTaskId, // Note: using 'id' instead of 'taskId'
        'status': testStatus.toValue(),
        'lastStatusUpdateDateTime': testTimestamp,
        'selectedSortKey': testSortKey,
      };

      // Act
      final taskData = SystemTaskUserDataSMMapper.fromMap(map);

      // Assert
      expect(taskData.taskId, testTaskId);
      expect(taskData.status, testStatus);
      expect(taskData.lastStatusUpdateDateTime, testTimestamp);
      expect(taskData.selectedSortKey, testSortKey);
    });

    test('serialization handles null fields correctly', () {
      // Arrange
      final taskData = SystemTaskUserDataSM(
        taskId: testTaskId,
        status: null,
        lastStatusUpdateDateTime: null,
        selectedSortKey: null,
      );

      // Act
      final map = taskData.toMap();

      // Assert
      expect(map['id'], testTaskId);
      expect(map['status'], null);
      expect(map['lastStatusUpdateDateTime'], null);
      expect(map['selectedSortKey'], null);
    });
  });
}
