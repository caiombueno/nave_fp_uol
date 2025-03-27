import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:rxdart/rxdart.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/task.dart';

import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';

import '../../../../../mocks.dart';

void main() {
  late TaskDetailsCubit taskDetailsCubit;
  late MockTaskRepository mockTaskRepository;
  late BehaviorSubject<Either<Failure, UserTask>> userTaskStream;
  late BehaviorSubject<Either<Failure, SystemTask>> systemTaskStream;
  const String taskId = 'task-123';

  setUpAll(() {
    registerFallbackValue(UnknownFailure(underlyingException: Exception()));
  });

  setUp(() {
    mockTaskRepository = MockTaskRepository();

    // Setup streams for repository responses
    userTaskStream = BehaviorSubject<Either<Failure, UserTask>>();
    systemTaskStream = BehaviorSubject<Either<Failure, SystemTask>>();

    // Register mocks with service locator
    sl.registerSingleton<TaskRepository>(mockTaskRepository);

    // Configure mock responses
    when(() => mockTaskRepository.watchUserTask(any()))
        .thenAnswer((_) => userTaskStream.stream);
    when(() => mockTaskRepository.watchSystemTask(any()))
        .thenAnswer((_) => systemTaskStream.stream);

    // Configure repository note methods
    when(() => mockTaskRepository.createNote(
          taskId: any(named: 'taskId'),
          content: any(named: 'content'),
          isSystemTask: any(named: 'isSystemTask'),
        )).thenAnswer((_) async => Future.value(Right(null)));

    when(() => mockTaskRepository.deleteNote(
          taskId: any(named: 'taskId'),
          noteId: any(named: 'noteId'),
          isSystemTask: any(named: 'isSystemTask'),
        )).thenAnswer((_) async => Future.value(Right(null)));

    when(() => mockTaskRepository.updateNote(
          taskId: any(named: 'taskId'),
          noteId: any(named: 'noteId'),
          content: any(named: 'content'),
          isSystemTask: any(named: 'isSystemTask'),
        )).thenAnswer((_) async => Future.value(Right(null)));
  });

  tearDown(() {
    userTaskStream.close();
    systemTaskStream.close();
    sl.reset();
  });

  group('TaskDetailsCubit', () {
    test('initial state is TaskDetailsLoading', () {
      // Arrange & Act
      taskDetailsCubit = TaskDetailsCubit(
        taskId: taskId,
        isUserTask: true,
      );

      // Assert
      expect(taskDetailsCubit.state, isA<TaskDetailsLoading>());

      // Clean up
      taskDetailsCubit.close();
    });

    group('initialization', () {
      test('subscribes to user task stream when isUserTask is true', () {
        // Arrange & Act
        taskDetailsCubit = TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        );

        // Assert
        verify(() => mockTaskRepository.watchUserTask(taskId)).called(1);
        verifyNever(() => mockTaskRepository.watchSystemTask(any()));

        // Clean up
        taskDetailsCubit.close();
      });

      test('subscribes to system task stream when isUserTask is false', () {
        // Arrange & Act
        taskDetailsCubit = TaskDetailsCubit(
          taskId: taskId,
          isUserTask: false,
        );

        // Assert
        verify(() => mockTaskRepository.watchSystemTask(taskId)).called(1);
        verifyNever(() => mockTaskRepository.watchUserTask(any()));

        // Clean up
        taskDetailsCubit.close();
      });
    });

    group('state transitions', () {
      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'emits [TaskDetailsLoaded] with correct view model when user task stream emits success',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        act: (cubit) => userTaskStream.add(
          const Right(
            UserTask(
              id: 'id',
              title: null,
              descriptionContent: null,
              status: TaskStatus.done,
              lastStatusUpdateDateTime: null,
              notes: null,
            ),
          ),
        ),
        expect: () => [
          const TaskDetailsLoaded(
            task: TaskDetailsTaskVM(
              title: null,
              isUserTask: true,
              descriptionContent: null,
              lessons: null,
              notes: null,
            ),
          ),
        ],
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'emits [TaskDetailsFailed] when user task stream emits failure',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        act: (cubit) => userTaskStream
            .add(Left(UnknownFailure(underlyingException: Exception()))),
        expect: () => [
          TaskDetailsFailed(),
        ],
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'emits [TaskDetailsLoaded] with correct view model when system task stream emits success',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: false,
        ),
        act: (cubit) => systemTaskStream.add(
          Right(
            SystemTask(
              id: 'id',
              title: null,
              descriptionContent: null,
              status: TaskStatus.done,
              lastStatusUpdateDateTime: null,
              notes: null,
              isFree: null,
              blockingTaskIds: null,
              lessons: null,
            ),
          ),
        ),
        expect: () => [
          const TaskDetailsLoaded(
            task: TaskDetailsTaskVM(
              title: null,
              isUserTask: false,
              descriptionContent: null,
              lessons: null,
              notes: null,
            ),
          ),
        ],
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'emits [TaskDetailsFailed] when system task stream emits failure',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: false,
        ),
        act: (cubit) => systemTaskStream
            .add(Left(UnknownFailure(underlyingException: Exception()))),
        expect: () => [
          TaskDetailsFailed(),
        ],
      );
    });

    group('createNote', () {
      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'does nothing when state is not TaskDetailsLoaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        act: (cubit) => cubit.createNote(content: [
          {'insert': 'Test note content'}
        ]),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockTaskRepository.createNote(
                taskId: any(named: 'taskId'),
                content: any(named: 'content'),
                isSystemTask: any(named: 'isSystemTask'),
              ));
        },
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'calls repository createNote when state is loaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        seed: () => TaskDetailsLoaded(
          task: TaskDetailsTaskVM(
            title: null,
            descriptionContent: null,
            isUserTask: true,
            lessons: null,
            notes: null,
          ),
        ),
        act: (cubit) {
          cubit.createNote(
            content: [
              {'insert': 'Test note content\n'}
            ],
          );
        },
        expect: () => [],
        verify: (_) {
          verify(() => mockTaskRepository.createNote(
                taskId: any(named: 'taskId'),
                content: any(named: 'content'),
                isSystemTask: any(named: 'isSystemTask'),
              )).called(1);
        },
      );
    });

    group('deleteNote', () {
      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'does nothing when state is not TaskDetailsLoaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        act: (cubit) => cubit.deleteNote(noteId: 'note-1'),
        expect: () => [],
        verify: (_) {
          verifyNever(() => mockTaskRepository.deleteNote(
                taskId: any(named: 'taskId'),
                noteId: any(named: 'noteId'),
                isSystemTask: any(named: 'isSystemTask'),
              ));
        },
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'calls repository deleteNote when state is loaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        seed: () => TaskDetailsLoaded(
          task: TaskDetailsTaskVM(
            title: null,
            descriptionContent: null,
            isUserTask: true,
            lessons: null,
            notes: null,
          ),
        ),
        act: (cubit) {
          cubit.deleteNote(noteId: 'note-1');
        },
        expect: () => [],
        verify: (_) {
          verify(() => mockTaskRepository.deleteNote(
                taskId: taskId,
                noteId: 'note-1',
                isSystemTask: false,
              )).called(1);
        },
      );
    });

    group('editNote', () {
      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'does nothing when state is not TaskDetailsLoaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        act: (cubit) => cubit.editNote(noteId: 'note-1', content: [
          {'insert': 'Updated content'}
        ]),
        expect: () => [], // No state changes
        verify: (_) {
          verifyNever(() => mockTaskRepository.updateNote(
                taskId: any(named: 'taskId'),
                noteId: any(named: 'noteId'),
                content: any(named: 'content'),
                isSystemTask: any(named: 'isSystemTask'),
              ));
        },
      );

      blocTest<TaskDetailsCubit, TaskDetailsState>(
        'calls repository updateNote when state is loaded',
        build: () => TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        ),
        seed: () => TaskDetailsLoaded(
          task: TaskDetailsTaskVM(
            title: null,
            descriptionContent: null,
            isUserTask: true,
            lessons: null,
            notes: null,
          ),
        ),
        act: (cubit) {
          cubit.editNote(noteId: 'note-1', content: [
            {'insert': 'Updated content'}
          ]);
        },
        expect: () => [],
        verify: (_) {
          verify(
            () => mockTaskRepository.updateNote(
              taskId: any(named: 'taskId'),
              noteId: any(named: 'noteId'),
              content: any(named: 'content'),
              isSystemTask: any(named: 'isSystemTask'),
            ),
          ).called(1);
        },
      );
    });

    group('close', () {
      test('cancels subscription when closed', () async {
        // Arrange
        taskDetailsCubit = TaskDetailsCubit(
          taskId: taskId,
          isUserTask: true,
        );

        // Act
        await taskDetailsCubit.close();

        // Assert - state shouldn't change after close
        userTaskStream.add(
          Right(
            UserTask(
              id: 'id',
              title: null,
              descriptionContent: null,
              status: TaskStatus.done,
              lastStatusUpdateDateTime: null,
              notes: null,
            ),
          ),
        );
        expect(taskDetailsCubit.state, isA<TaskDetailsLoading>());
        expect(taskDetailsCubit.stream, emitsDone);
      });
    });
  });
}
