import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/domain_models/task_summary.dart';

void main() {
  group('TaskSummary', () {
    group('SystemTaskSummary', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        final summary = SystemTaskSummary(
          id: 'task-1',
          title: 'System Task',
          status: TaskStatus.inProgress,
          selectedSortKey: 1.5,
          isFree: true,
          blockingTaskIds: ['task-2', 'task-3'],
          defaultSortKey: 2,
        );

        // Assert
        expect(summary, isA<TaskSummary>());
        expect(summary.id, equals('task-1'));
        expect(summary.title, equals('System Task'));
        expect(summary.status, equals(TaskStatus.inProgress));
        expect(summary.selectedSortKey, equals(1.5));
        expect(summary.isFree, isTrue);
        expect(summary.blockingTaskIds, equals(['task-2', 'task-3']));
        expect(summary.defaultSortKey, equals(2));
      });

      test('initializes with null optional parameters', () {
        // Arrange & Act
        final summary = SystemTaskSummary(
          id: 'task-2',
          title: null,
          status: TaskStatus.toDo,
          selectedSortKey: null,
          isFree: null,
          blockingTaskIds: null,
          defaultSortKey: null,
        );

        // Assert
        expect(summary.id, equals('task-2'));
        expect(summary.title, isNull);
        expect(summary.status, equals(TaskStatus.toDo));
        expect(summary.selectedSortKey, isNull);
        expect(summary.isFree, isNull);
        expect(summary.blockingTaskIds, isNull);
        expect(summary.defaultSortKey, isNull);
      });
    });

    group('UserTaskSummary', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        final summary = UserTaskSummary(
          id: 'user-task-1',
          title: 'User Task',
          status: TaskStatus.done,
          selectedSortKey: 3.0,
        );

        // Assert
        expect(summary, isA<TaskSummary>());
        expect(summary.id, equals('user-task-1'));
        expect(summary.title, equals('User Task'));
        expect(summary.status, equals(TaskStatus.done));
        expect(summary.selectedSortKey, equals(3.0));
      });

      test('initializes with null optional parameters', () {
        // Arrange & Act
        final summary = UserTaskSummary(
          id: 'user-task-2',
          title: null,
          status: TaskStatus.toDo,
          selectedSortKey: null,
        );

        // Assert
        expect(summary.id, equals('user-task-2'));
        expect(summary.title, isNull);
        expect(summary.status, equals(TaskStatus.toDo));
        expect(summary.selectedSortKey, isNull);
      });
    });

    group('Pattern matching', () {
      test('correctly identifies task types in switch statements', () {
        // Arrange
        final systemTask = SystemTaskSummary(
          id: 'system-1',
          title: 'System',
          status: TaskStatus.toDo,
          selectedSortKey: 1.0,
          isFree: true,
          blockingTaskIds: [],
          defaultSortKey: 1,
        );

        final userTask = UserTaskSummary(
          id: 'user-1',
          title: 'User',
          status: TaskStatus.inProgress,
          selectedSortKey: 2.0,
        );

        // Act & Assert
        String taskType(TaskSummary task) {
          return switch (task) {
            SystemTaskSummary() => 'system',
            UserTaskSummary() => 'user',
          };
        }

        expect(taskType(systemTask), equals('system'));
        expect(taskType(userTask), equals('user'));
      });
    });

    group('Mapping functionality', () {
      test('SystemTaskSummary serializes and deserializes correctly', () {
        // Arrange
        final task = SystemTaskSummary(
          id: 'system-2',
          title: 'System Task',
          status: TaskStatus.inProgress,
          selectedSortKey: 2.5,
          isFree: false,
          blockingTaskIds: ['blocking-1'],
          defaultSortKey: 3,
        );

        // Act
        final map = task.toMap();
        final restored = TaskSummaryMapper.fromMap(map);

        // Assert
        expect(restored, isA<SystemTaskSummary>());
        expect(restored.id, equals('system-2'));
        expect(restored.title, equals('System Task'));
        expect(restored.status, equals(TaskStatus.inProgress));
        expect(restored.selectedSortKey, equals(2.5));

        final systemTask = restored as SystemTaskSummary;
        expect(systemTask.isFree, isFalse);
        expect(systemTask.blockingTaskIds, equals(['blocking-1']));
        expect(systemTask.defaultSortKey, equals(3));
      });

      test('UserTaskSummary serializes and deserializes correctly', () {
        // Arrange
        final task = UserTaskSummary(
          id: 'user-2',
          title: 'User Task',
          status: TaskStatus.done,
          selectedSortKey: 4.0,
        );

        // Act
        final map = task.toMap();
        final restored = TaskSummaryMapper.fromMap(map);

        // Assert
        expect(restored, isA<UserTaskSummary>());
        expect(restored.id, equals('user-2'));
        expect(restored.title, equals('User Task'));
        expect(restored.status, equals(TaskStatus.done));
        expect(restored.selectedSortKey, equals(4.0));
      });
    });
  });
}
