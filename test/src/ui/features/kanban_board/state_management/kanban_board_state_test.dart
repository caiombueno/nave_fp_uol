import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';

void main() {
  group('KanbanBoardState', () {
    group('KanbanBoardLoading', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = KanbanBoardLoading();

        // Assert
        expect(state, isA<KanbanBoardState>());
      });
    });

    group('KanbanBoardFailed', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = KanbanBoardFailed();

        // Assert
        expect(state, isA<KanbanBoardState>());
      });
    });

    group('KanbanBoardLoaded', () {
      test('initializes with required parameters', () {
        // Arrange
        final toDoTasks = [
          const UserTaskSummaryVM(
            id: 'task1',
            title: 'Task 1',
            selectedSortKey: 1.0,
            index: 0,
          )
        ];

        final inProgressTasks = [
          const SystemTaskSummaryVM(
            id: 'task2',
            title: 'Task 2',
            isLockedByPayment: false,
            blockingTaskTitles: [],
            selectedSortKey: 2.0,
            defaultSortKey: 1,
            index: 0,
          )
        ];

        final doneTasks = <TaskSummaryVM>[];

        // Act
        final state = KanbanBoardLoaded(
          toDoTaskSummaryList: toDoTasks,
          inProgressTaskSummaryList: inProgressTasks,
          doneTaskSummaryList: doneTasks,
        );

        // Assert
        expect(state, isA<KanbanBoardState>());
        expect(state.toDoTaskSummaryList, equals(toDoTasks));
        expect(state.inProgressTaskSummaryList, equals(inProgressTasks));
        expect(state.doneTaskSummaryList, equals(doneTasks));
        expect(state.updateTaskPlacementFailure, isNull);
        expect(state.createUserTaskFailure, isNull);
      });

      test('initializes with all parameters including failures', () {
        // Arrange
        const toDoTasks = <TaskSummaryVM>[];
        const inProgressTasks = <TaskSummaryVM>[];
        const doneTasks = <TaskSummaryVM>[];
        const updateFailure = NoInternetFailure();
        const createFailure = NoInternetFailure();

        // Act
        final state = KanbanBoardLoaded(
          toDoTaskSummaryList: toDoTasks,
          inProgressTaskSummaryList: inProgressTasks,
          doneTaskSummaryList: doneTasks,
          updateTaskPlacementFailure: updateFailure,
          createUserTaskFailure: createFailure,
        );

        // Assert
        expect(state.updateTaskPlacementFailure, equals(updateFailure));
        expect(state.createUserTaskFailure, equals(createFailure));
      });
    });
  });

  group('TaskSummaryVM', () {
    group('accessStatus', () {
      test('returns lockedByPayment when task is locked by payment', () {
        // Arrange
        const task = SystemTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          isLockedByPayment: true,
          blockingTaskTitles: [],
          selectedSortKey: 1.0,
          defaultSortKey: 1,
          index: 0,
        );

        // Act
        final accessStatus = task.accessStatus;

        // Assert
        expect(accessStatus, equals(TaskAccessStatus.lockedByPayment));
      });

      test('returns lockedByDependency when task has blocking tasks', () {
        // Arrange
        const task = SystemTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          isLockedByPayment: false,
          blockingTaskTitles: ['Blocking Task'],
          selectedSortKey: 1.0,
          defaultSortKey: 1,
          index: 0,
        );

        // Act
        final accessStatus = task.accessStatus;

        // Assert
        expect(accessStatus, equals(TaskAccessStatus.lockedByDependency));
      });

      test('returns unlocked when task is not locked by payment or dependency',
          () {
        // Arrange
        const task = SystemTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          isLockedByPayment: false,
          blockingTaskTitles: [],
          selectedSortKey: 1.0,
          defaultSortKey: 1,
          index: 0,
        );

        // Act
        final accessStatus = task.accessStatus;

        // Assert
        expect(accessStatus, equals(TaskAccessStatus.unlocked));
      });
    });

    group('isBlockedByDependency', () {
      test('returns true when blockingTaskTitles is not empty', () {
        // Arrange
        const task = SystemTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          isLockedByPayment: false,
          blockingTaskTitles: ['Blocking Task'],
          selectedSortKey: 1.0,
          defaultSortKey: 1,
          index: 0,
        );

        // Act & Assert
        expect(task.isBlockedByDependency, isTrue);
      });

      test('returns false when blockingTaskTitles is empty', () {
        // Arrange
        const task = SystemTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          isLockedByPayment: false,
          blockingTaskTitles: [],
          selectedSortKey: 1.0,
          defaultSortKey: 1,
          index: 0,
        );

        // Act & Assert
        expect(task.isBlockedByDependency, isFalse);
      });

      test('returns false when blockingTaskTitles is null', () {
        // Arrange
        const task = UserTaskSummaryVM(
          id: 'task1',
          title: 'Task 1',
          selectedSortKey: 1.0,
          index: 0,
        );

        // Act & Assert
        expect(task.isBlockedByDependency, isFalse);
      });
    });
  });

  group('SystemTaskSummaryVM', () {
    test('initializes with all properties', () {
      // Arrange & Act
      const task = SystemTaskSummaryVM(
        id: 'task1',
        title: 'Task 1',
        isLockedByPayment: true,
        blockingTaskTitles: ['Blocking Task'],
        selectedSortKey: 1.0,
        defaultSortKey: 2,
        index: 0,
      );

      // Assert
      expect(task.id, equals('task1'));
      expect(task.title, equals('Task 1'));
      expect(task.isLockedByPayment, isTrue);
      expect(task.blockingTaskTitles, equals(['Blocking Task']));
      expect(task.selectedSortKey, equals(1.0));
      expect(task.defaultSortKey, equals(2));
      expect(task.index, equals(0));
      expect(task, isA<TaskSummaryVM>());
    });
  });

  group('UserTaskSummaryVM', () {
    test('initializes with required properties and sets others to null', () {
      // Arrange & Act
      const task = UserTaskSummaryVM(
        id: 'task1',
        title: 'User Task',
        selectedSortKey: 3.0,
        index: 2,
      );

      // Assert
      expect(task.id, equals('task1'));
      expect(task.title, equals('User Task'));
      expect(task.isLockedByPayment, isNull);
      expect(task.blockingTaskTitles, isNull);
      expect(task.selectedSortKey, equals(3.0));
      expect(task.index, equals(2));
      expect(task, isA<TaskSummaryVM>());
      expect(task.accessStatus, equals(TaskAccessStatus.unlocked));
    });
  });
}
