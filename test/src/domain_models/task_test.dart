import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(() {
    tz.TZDateTime.now(tz.UTC);
  });

  group('Task Models', () {
    const String testId = 'task-1';
    const String testTitle = 'Test Task';
    const String testDescription = 'Task description';
    const TaskStatus testStatus = TaskStatus.inProgress;
    final tz.TZDateTime testDateTime = tz.TZDateTime.utc(2023, 1, 1, 12, 0);

    const List<Note> testNotes = [];

    const List<Lesson> testLessons = [];
    const List<String> testBlockingTaskIds = [];

    group('SystemTask', () {
      test('initialization with required parameters', () {
        // Arrange & Act
        final systemTask = SystemTask(
          id: testId,
          title: testTitle,
          descriptionContent: testDescription,
          status: testStatus,
          lastStatusUpdateDateTime: testDateTime,
          notes: testNotes,
          isFree: true,
          blockingTaskIds: testBlockingTaskIds,
          lessons: testLessons,
        );

        // Assert
        expect(systemTask.id, testId);
        expect(systemTask.title, testTitle);
        expect(systemTask.descriptionContent, testDescription);
        expect(systemTask.status, testStatus);
        expect(systemTask.lastStatusUpdateDateTime, testDateTime);
        expect(systemTask.notes, testNotes);
        expect(systemTask.isFree, true);
        expect(systemTask.blockingTaskIds, testBlockingTaskIds);
        expect(systemTask.lessons, testLessons);
        expect(systemTask, isA<Task>());
      });

      test('initialization with null optional parameters', () {
        // Arrange & Act
        final systemTask = SystemTask(
          id: null,
          title: null,
          descriptionContent: null,
          status: testStatus,
          lastStatusUpdateDateTime: null,
          notes: null,
          isFree: null,
          blockingTaskIds: null,
          lessons: null,
        );

        // Assert
        expect(systemTask.id, null);
        expect(systemTask.title, null);
        expect(systemTask.descriptionContent, null);
        expect(systemTask.status, testStatus);
        expect(systemTask.lastStatusUpdateDateTime, null);
        expect(systemTask.notes, null);
        expect(systemTask.isFree, null);
        expect(systemTask.blockingTaskIds, null);
        expect(systemTask.lessons, null);
      });
    });

    group('UserTask', () {
      test('initialization with required parameters', () {
        // Arrange & Act
        final userTask = UserTask(
          id: testId,
          title: testTitle,
          descriptionContent: testDescription,
          status: testStatus,
          lastStatusUpdateDateTime: testDateTime,
          notes: testNotes,
        );

        // Assert
        expect(userTask.id, testId);
        expect(userTask.title, testTitle);
        expect(userTask.descriptionContent, testDescription);
        expect(userTask.status, testStatus);
        expect(userTask.lastStatusUpdateDateTime, testDateTime);
        expect(userTask.notes, testNotes);
        expect(userTask, isA<Task>());
      });

      test('initialization with null optional parameters', () {
        // Arrange & Act
        final userTask = UserTask(
          id: null,
          title: null,
          descriptionContent: null,
          status: testStatus,
          lastStatusUpdateDateTime: null,
          notes: null,
        );

        // Assert
        expect(userTask.id, null);
        expect(userTask.title, null);
        expect(userTask.descriptionContent, null);
        expect(userTask.status, testStatus);
        expect(userTask.lastStatusUpdateDateTime, null);
        expect(userTask.notes, null);
      });
    });
  });
}
