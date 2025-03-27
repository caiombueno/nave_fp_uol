import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/user_task_sm.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/domain_models/task_summary.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../../../../mocks.dart';

void main() {
  late TaskRepository taskRepository;
  late MockSyncedDataSource mockSyncedDataSource;
  late MockAuthDataSource mockAuthDataSource;

  late BehaviorSubject<String?> userIdSubject;

  const testUserId = 'test-user-id';
  const testTaskId = 'test-task-id';
  const testNoteId = 'test-note-id';
  const testLessonId = 'test-lesson-id';
  const testTaskTitle = 'Test Task Title';
  const testNoteContent = 'Test note content';

  setUpAll(() {
    tz.initializeTimeZones();
  });

  setUp(() {
    userIdSubject = BehaviorSubject<String?>();
    mockSyncedDataSource = MockSyncedDataSource();
    mockAuthDataSource = MockAuthDataSource();
    taskRepository = TaskRepository(
      syncedDataSource: mockSyncedDataSource,
      authDataSource: mockAuthDataSource,
    );

    when(() => mockAuthDataSource.watchUserId())
        .thenAnswer((_) => userIdSubject.stream);
  });

  tearDown(() {
    userIdSubject.close();
  });

  group('watchSystemTaskSummaryList', () {
    late BehaviorSubject<Either<Failure, List<SystemTaskSM>>>
        systemTasksSubject;
    late BehaviorSubject<Either<Failure, List<SystemTaskUserDataSM>>>
        systemTaskUserDataSubject;

    setUp(() {
      systemTasksSubject = BehaviorSubject();
      systemTaskUserDataSubject = BehaviorSubject();

      when(() => mockSyncedDataSource.watchSystemTaskList())
          .thenAnswer((_) => systemTasksSubject.stream);

      when(() => mockSyncedDataSource.watchSystemTaskUserDataList(testUserId))
          .thenAnswer((_) => systemTaskUserDataSubject.stream);
    });

    tearDown(() {
      systemTasksSubject.close();
      systemTaskUserDataSubject.close();
    });

    test('returns list of system task summaries when user is logged in',
        () async {
      // Arrange
      final systemTasks = [
        SystemTaskSM(
          id: testTaskId,
          title: testTaskTitle,
          descriptionContent: 'Description',
          isFree: true,
          blockingTaskIds: const [],
          defaultSortKey: 1,
          lessonIds: const [testLessonId],
        ),
      ];

      final systemTaskUserData = [
        SystemTaskUserDataSM(
          taskId: testTaskId,
          status: TaskStatusSM.toDo,
          lastStatusUpdateDateTime: Timestamp.now(),
          selectedSortKey: 1.0,
        ),
      ];

      userIdSubject.add(testUserId);
      systemTasksSubject.add(right(systemTasks));
      systemTaskUserDataSubject.add(right(systemTaskUserData));

      // Act
      final result = taskRepository.watchSystemTaskSummaryList();

      // Assert
      expect(
        result,
        emits(
          isA<Right<Failure, List<SystemTaskSummary>>>(),
        ),
      );
    });

    test('propagates errors from system task list stream', () {
      // Arrange
      final failure = NoInternetFailure();

      userIdSubject.add(testUserId);
      systemTasksSubject.add(left(failure));
      systemTaskUserDataSubject.add(right([]));

      // Act
      final result = taskRepository.watchSystemTaskSummaryList();

      // Assert
      expect(
        result,
        emits(left(failure)),
      );
    });
  });

  group('watchUserTaskSummaryList', () {
    late BehaviorSubject<Either<Failure, List<UserTaskSM>>> userTasksSubject;

    setUp(() {
      userTasksSubject = BehaviorSubject();

      when(() => mockSyncedDataSource.watchUserTaskList(testUserId))
          .thenAnswer((_) => userTasksSubject.stream);
    });

    tearDown(() {
      userTasksSubject.close();
    });

    test('returns UnauthenticatedUserFailure when user is not logged in', () {
      // Arrange
      userIdSubject.add(null);

      // Act
      final result = taskRepository.watchUserTaskSummaryList();

      // Assert
      expect(
        result,
        emits(left(UnauthenticatedUserFailure())),
      );
    });

    test('returns list of user task summaries when user is logged in', () {
      // Arrange
      final userTasks = [
        UserTaskSM(
          id: testTaskId,
          title: testTaskTitle,
          descriptionContent: 'Description',
          status: TaskStatusSM.toDo,
          lastStatusUpdateDateTime: Timestamp.now(),
          selectedSortKey: 1.0,
        ),
      ];

      userIdSubject.add(testUserId);
      userTasksSubject.add(right(userTasks));

      // Act
      final result = taskRepository.watchUserTaskSummaryList();

      // Assert
      expect(
        result,
        emits(
          isA<Right<Failure, List<UserTaskSummary>>>(),
        ),
      );
    });
  });

  group('watchSystemTask', () {
    late BehaviorSubject<Either<Failure, SystemTaskSM>> systemTaskSubject;
    late BehaviorSubject<Either<Failure, SystemTaskUserDataSM?>>
        systemTaskUserDataSubject;
    late BehaviorSubject<Either<Failure, List<NoteSM>>> systemTaskNotesSubject;
    late BehaviorSubject<Either<Failure, List<LessonSM>>> lessonsSubject;
    late BehaviorSubject<Either<Failure, List<LessonUserDataSM>>>
        lessonUserDataSubject;

    setUp(() {
      systemTaskSubject = BehaviorSubject();
      systemTaskUserDataSubject = BehaviorSubject();
      systemTaskNotesSubject = BehaviorSubject();
      lessonsSubject = BehaviorSubject();
      lessonUserDataSubject = BehaviorSubject();

      when(() => mockSyncedDataSource.watchSystemTask(testTaskId))
          .thenAnswer((_) => systemTaskSubject.stream);

      when(() => mockSyncedDataSource.watchSystemTaskUserData(
            userId: testUserId,
            taskId: testTaskId,
          )).thenAnswer((_) => systemTaskUserDataSubject.stream);

      when(() => mockSyncedDataSource.watchSystemTaskNotes(
            userId: testUserId,
            taskId: testTaskId,
          )).thenAnswer((_) => systemTaskNotesSubject.stream);

      when(() => mockSyncedDataSource.watchLessonList())
          .thenAnswer((_) => lessonsSubject.stream);

      when(() => mockSyncedDataSource.watchLessonUserDataList(testUserId))
          .thenAnswer((_) => lessonUserDataSubject.stream);
    });

    tearDown(() {
      systemTaskSubject.close();
      systemTaskUserDataSubject.close();
      systemTaskNotesSubject.close();
      lessonsSubject.close();
      lessonUserDataSubject.close();
    });

    test('returns complete system task with user data and notes', () {
      // Arrange
      const systemTask = SystemTaskSM(
        id: testTaskId,
        title: testTaskTitle,
        descriptionContent: 'Description',
        isFree: true,
        blockingTaskIds: const [],
        defaultSortKey: 1,
        lessonIds: const [testLessonId],
      );

      final systemTaskUserData = SystemTaskUserDataSM(
        taskId: testTaskId,
        status: TaskStatusSM.inProgress,
        lastStatusUpdateDateTime: Timestamp.now(),
        selectedSortKey: 1.0,
      );

      final notes = [
        NoteSM(
          id: testNoteId,
          content: testNoteContent,
          creationDateTime: null,
          lastUpdateDateTime: Timestamp.fromDate(DateTime.now().toUtc()),
        ),
      ];

      const lessons = [
        TextLessonSM(
          id: testLessonId,
          title: 'Test Lesson',
          content: 'Test lesson description',
        ),
      ];

      const lessonUserData = [
        LessonUserDataSM(
          lessonId: testLessonId,
          isCompleted: false,
        ),
      ];

      userIdSubject.add(testUserId);
      systemTaskSubject.add(right(systemTask));
      systemTaskUserDataSubject.add(right(systemTaskUserData));
      systemTaskNotesSubject.add(right(notes));
      lessonsSubject.add(right(lessons));
      lessonUserDataSubject.add(right(lessonUserData));

      // Act
      final result = taskRepository.watchSystemTask(testTaskId);

      // Assert
      expect(
        result,
        emits(
          isA<Right<Failure, SystemTask>>(),
        ),
      );
    });
  });

  group('watchUserTask', () {
    late BehaviorSubject<Either<Failure, UserTaskSM>> userTaskSubject;
    late BehaviorSubject<Either<Failure, List<NoteSM>>> userTaskNotesSubject;

    setUp(() {
      userTaskSubject = BehaviorSubject();
      userTaskNotesSubject = BehaviorSubject();

      when(() => mockSyncedDataSource.watchUserTask(
            userId: testUserId,
            taskId: testTaskId,
          )).thenAnswer((_) => userTaskSubject.stream);

      when(() => mockSyncedDataSource.watchUserTaskNotes(
            userId: testUserId,
            taskId: testTaskId,
          )).thenAnswer((_) => userTaskNotesSubject.stream);
    });

    tearDown(() {
      userTaskSubject.close();
      userTaskNotesSubject.close();
    });

    test('returns UnauthenticatedUserFailure when user is not logged in', () {
      // Arrange
      userIdSubject.add(null);

      // Act
      final result = taskRepository.watchUserTask(testTaskId);

      // Assert
      expect(
        result,
        emits(left(UnauthenticatedUserFailure())),
      );
    });

    test('returns user task with notes when user is logged in', () {
      // Arrange
      final userTask = UserTaskSM(
        id: testTaskId,
        title: testTaskTitle,
        descriptionContent: 'Description',
        status: TaskStatusSM.toDo,
        lastStatusUpdateDateTime: Timestamp.now(),
        selectedSortKey: 1.0,
      );

      final notes = [
        NoteSM(
          id: testNoteId,
          content: testNoteContent,
          lastUpdateDateTime: null,
          creationDateTime: null,
        ),
      ];

      userIdSubject.add(testUserId);
      userTaskSubject.add(right(userTask));
      userTaskNotesSubject.add(right(notes));

      // Act
      final result = taskRepository.watchUserTask(testTaskId);

      // Assert
      expect(
        result,
        emits(
          isA<Right<Failure, UserTask>>(),
        ),
      );
    });
  });

  group('updateTaskPlacement', () {
    test('returns UnauthenticatedUserFailure when user is not logged in',
        () async {
      // Arrange
      when(() => mockAuthDataSource.getUserId()).thenAnswer((_) async => null);

      // Act
      final result = await taskRepository.updateTaskPlacement(
        taskId: testTaskId,
        status: TaskStatus.done,
        isSystemTask: true,
        selectedSortKey: 2.0,
        didUpdateStatus: true,
      );

      // Assert
      expect(result, left(UnauthenticatedUserFailure()));
    });

    test('updates system task placement when user is logged in', () async {
      // Arrange
      when(() => mockAuthDataSource.getUserId())
          .thenAnswer((_) async => testUserId);

      when(() => mockSyncedDataSource.updateSystemTaskPlacement(
            userId: testUserId,
            taskId: testTaskId,
            status: TaskStatusSM.done,
            selectedSortKey: 2.0,
            didUpdateStatus: true,
          )).thenAnswer((_) async {});

      // Act
      final result = await taskRepository.updateTaskPlacement(
        taskId: testTaskId,
        status: TaskStatus.done,
        isSystemTask: true,
        selectedSortKey: 2.0,
        didUpdateStatus: true,
      );

      // Assert
      expect(result, right(null));
    });

    group('createUserTask', () {
      test('returns UnauthenticatedUserFailure when user is not logged in',
          () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => null);

        // Act
        final result = await taskRepository.createUserTask(
          title: testTaskTitle,
          selectedSortKey: 1.0,
          status: TaskStatus.toDo,
        );

        // Assert
        expect(result, left(UnauthenticatedUserFailure()));
      });

      test('creates user task when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.createUserTask(
              userId: testUserId,
              title: testTaskTitle,
              status: TaskStatusSM.toDo,
              selectedSortKey: 1.0,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.createUserTask(
          title: testTaskTitle,
          selectedSortKey: 1.0,
          status: TaskStatus.toDo,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.createUserTask(
              userId: testUserId,
              title: testTaskTitle,
              status: TaskStatusSM.toDo,
              selectedSortKey: 1.0,
            )).called(1);
      });
    });

    group('createNote', () {
      test('returns UnauthenticatedUserFailure when user is not logged in',
          () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => null);

        // Act
        final result = await taskRepository.createNote(
          taskId: testTaskId,
          content: testNoteContent,
          isSystemTask: true,
        );

        // Assert
        expect(result, left(UnauthenticatedUserFailure()));
      });

      test('creates system task note when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.upsertSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: null,
              content: testNoteContent,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.createNote(
          taskId: testTaskId,
          content: testNoteContent,
          isSystemTask: true,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.upsertSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: null,
              content: testNoteContent,
            )).called(1);
      });

      test('creates user task note when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.upsertUserTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: null,
              content: testNoteContent,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.createNote(
          taskId: testTaskId,
          content: testNoteContent,
          isSystemTask: false,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.upsertUserTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: null,
              content: testNoteContent,
            )).called(1);
      });
    });

    group('updateNote', () {
      test('updates note by calling _upsertNote with noteId', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.upsertSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
              content: testNoteContent,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.updateNote(
          taskId: testTaskId,
          noteId: testNoteId,
          content: testNoteContent,
          isSystemTask: true,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.upsertSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
              content: testNoteContent,
            )).called(1);
      });
    });

    group('deleteNote', () {
      test('deletes system task note when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.deleteSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.deleteNote(
          taskId: testTaskId,
          noteId: testNoteId,
          isSystemTask: true,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.deleteSystemTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
            )).called(1);
      });

      test('deletes user task note when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.deleteUserTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.deleteNote(
          taskId: testTaskId,
          noteId: testNoteId,
          isSystemTask: false,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.deleteUserTaskNote(
              userId: testUserId,
              taskId: testTaskId,
              noteId: testNoteId,
            )).called(1);
      });
    });

    group('deleteUserTask', () {
      test('deletes user task when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.deleteUserTask(
              userId: testUserId,
              taskId: testTaskId,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.deleteUserTask(
          taskId: testTaskId,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.deleteUserTask(
              userId: testUserId,
              taskId: testTaskId,
            )).called(1);
      });
    });

    group('updateUserTaskTitle', () {
      test('updates user task title when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.updateUserTaskTitle(
              userId: testUserId,
              taskId: testTaskId,
              newTitle: testTaskTitle,
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.updateUserTaskTitle(
          taskId: testTaskId,
          newTitle: testTaskTitle,
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.updateUserTaskTitle(
              userId: testUserId,
              taskId: testTaskId,
              newTitle: testTaskTitle,
            )).called(1);
      });
    });

    group('updateUserTaskDescription', () {
      test('updates user task description when user is logged in', () async {
        // Arrange
        when(() => mockAuthDataSource.getUserId())
            .thenAnswer((_) async => testUserId);

        when(() => mockSyncedDataSource.updateUserTaskDescription(
              userId: testUserId,
              taskId: testTaskId,
              newContent: 'New description',
            )).thenAnswer((_) async {});

        // Act
        final result = await taskRepository.updateUserTaskDescription(
          taskId: testTaskId,
          newContent: 'New description',
        );

        // Assert
        expect(result, right(null));
        verify(() => mockSyncedDataSource.updateUserTaskDescription(
              userId: testUserId,
              taskId: testTaskId,
              newContent: 'New description',
            )).called(1);
      });
    });

    group('watchLesson', () {
      test('returns lesson with user data when user is logged in', () {
        // Arrange
        final lesson = TextLessonSM(
          id: testLessonId,
          title: 'Test Lesson',
          content: 'Test lesson description',
        );

        final lessonUserData = LessonUserDataSM(
          lessonId: testLessonId,
          isCompleted: false,
        );

        when(() => mockAuthDataSource.watchUserId())
            .thenAnswer((_) => Stream.value(testUserId));

        when(() => mockSyncedDataSource.watchLesson(testLessonId))
            .thenAnswer((_) => Stream.value(right(lesson)));

        when(() => mockSyncedDataSource.watchLessonUserData(
              userId: testUserId,
              lessonId: testLessonId,
            )).thenAnswer((_) => Stream.value(right(lessonUserData)));

        // Act
        final result = taskRepository.watchLesson(testLessonId);

        // Assert
        expect(
          result,
          emits(
            isA<Right<Failure, Lesson>>(),
          ),
        );
      });
    });
  });
}
