import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_sm.dart';

void main() {
  group('SystemTaskSM', () {
    const testId = 'task-1';
    const testTitle = 'Setup Account';
    const testDescription = 'Complete your account setup';
    const testBlockingTaskIds = ['task-0'];
    const testLessonIds = ['lesson-1', 'lesson-2'];

    test('initializes with required parameters', () {
      // Arrange & Act
      final task = SystemTaskSM(
        id: testId,
        title: testTitle,
        descriptionContent: testDescription,
        isFree: true,
        blockingTaskIds: testBlockingTaskIds,
        defaultSortKey: 1,
        lessonIds: testLessonIds,
      );

      // Assert
      expect(task.id, testId);
      expect(task.title, testTitle);
      expect(task.descriptionContent, testDescription);
      expect(task.isFree, true);
      expect(task.blockingTaskIds, testBlockingTaskIds);
      expect(task.defaultSortKey, 1);
      expect(task.lessonIds, testLessonIds);
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      final task = SystemTaskSM(
        id: testId,
        title: null,
        descriptionContent: null,
        isFree: null,
        blockingTaskIds: null,
        defaultSortKey: null,
        lessonIds: null,
      );

      // Assert
      expect(task.id, testId);
      expect(task.title, null);
      expect(task.descriptionContent, null);
      expect(task.isFree, null);
      expect(task.blockingTaskIds, null);
      expect(task.defaultSortKey, null);
      expect(task.lessonIds, null);
    });

    test('initializes with empty lists', () {
      // Arrange & Act
      final task = SystemTaskSM(
        id: testId,
        title: testTitle,
        descriptionContent: testDescription,
        isFree: true,
        blockingTaskIds: [],
        defaultSortKey: 1,
        lessonIds: [],
      );

      // Assert
      expect(task.blockingTaskIds, isEmpty);
      expect(task.lessonIds, isEmpty);
    });

    test('serialization preserves all fields', () {
      // Arrange
      final task = SystemTaskSM(
        id: testId,
        title: testTitle,
        descriptionContent: testDescription,
        isFree: true,
        blockingTaskIds: testBlockingTaskIds,
        defaultSortKey: 1,
        lessonIds: testLessonIds,
      );

      // Act
      final map = task.toMap();

      // Assert
      expect(map['id'], testId);
      expect(map['title'], testTitle);
      expect(map['descriptionContent'], testDescription);
      expect(map['isFree'], true);
      expect(map['blockingTaskIds'], testBlockingTaskIds);
      expect(map['defaultSortKey'], 1);
      expect(map['lessonIds'], testLessonIds);
    });

    test('deserialization creates correct object', () {
      // Arrange
      final map = {
        'id': testId,
        'title': testTitle,
        'descriptionContent': testDescription,
        'isFree': true,
        'blockingTaskIds': testBlockingTaskIds,
        'defaultSortKey': 1,
        'lessonIds': testLessonIds,
      };

      // Act
      final task = SystemTaskSMMapper.fromMap(map);

      // Assert
      expect(task.id, testId);
      expect(task.title, testTitle);
      expect(task.descriptionContent, testDescription);
      expect(task.isFree, true);
      expect(task.blockingTaskIds, testBlockingTaskIds);
      expect(task.defaultSortKey, 1);
      expect(task.lessonIds, testLessonIds);
    });

    test('serialization handles null fields correctly', () {
      // Arrange
      final task = SystemTaskSM(
        id: testId,
        title: null,
        descriptionContent: null,
        isFree: null,
        blockingTaskIds: null,
        defaultSortKey: null,
        lessonIds: null,
      );

      // Act
      final map = task.toMap();
      final deserializedTask = SystemTaskSMMapper.fromMap(map);

      // Assert
      expect(deserializedTask.id, testId);
      expect(deserializedTask.title, null);
      expect(deserializedTask.descriptionContent, null);
      expect(deserializedTask.isFree, null);
      expect(deserializedTask.blockingTaskIds, null);
      expect(deserializedTask.defaultSortKey, null);
      expect(deserializedTask.lessonIds, null);
    });

    test('serialization roundtrip preserves list data', () {
      // Arrange
      final task = SystemTaskSM(
        id: testId,
        title: testTitle,
        descriptionContent: testDescription,
        isFree: true,
        blockingTaskIds: ['task-0', 'task-2', 'task-3'],
        defaultSortKey: 5,
        lessonIds: ['lesson-1', 'lesson-3', 'lesson-5'],
      );

      // Act
      final map = task.toMap();
      final deserializedTask = SystemTaskSMMapper.fromMap(map);

      // Assert
      expect(deserializedTask.blockingTaskIds, ['task-0', 'task-2', 'task-3']);
      expect(deserializedTask.lessonIds, ['lesson-1', 'lesson-3', 'lesson-5']);
      expect(deserializedTask.blockingTaskIds?.length, 3);
      expect(deserializedTask.lessonIds?.length, 3);
    });
  });
}
