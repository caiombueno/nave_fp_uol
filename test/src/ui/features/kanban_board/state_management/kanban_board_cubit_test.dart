import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/domain_models/task_summary.dart';
import 'package:nave_fp_uol/src/domain_models/user.dart';

import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../mocks.dart';

void main() {
  late KanbanBoardCubit kanbanBoardCubit;
  late MockTaskRepository mockTaskRepository;
  late MockUserRepository mockUserRepository;
  late MockErrorReporter mockErrorReporter;

  late BehaviorSubject<Either<Failure, List<SystemTaskSummary>>>
      systemTasksStream;
  late BehaviorSubject<Either<Failure, List<UserTaskSummary>>> userTasksStream;
  late BehaviorSubject<User?> userStream;

  setUpAll(() {
    registerFallbackValue(UnknownFailure(underlyingException: Exception()));
    registerFallbackValue(TaskStatus.toDo);
  });

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    mockUserRepository = MockUserRepository();
    mockErrorReporter = MockErrorReporter();

    systemTasksStream =
        BehaviorSubject<Either<Failure, List<SystemTaskSummary>>>();
    userTasksStream = BehaviorSubject<Either<Failure, List<UserTaskSummary>>>();
    userStream = BehaviorSubject<User?>();

    when(() => mockTaskRepository.watchSystemTaskSummaryList())
        .thenAnswer((_) => systemTasksStream.stream);
    when(() => mockTaskRepository.watchUserTaskSummaryList())
        .thenAnswer((_) => userTasksStream.stream);
    when(() => mockUserRepository.watchUser())
        .thenAnswer((_) => userStream.stream);

    when(() => mockErrorReporter.reportFailure(any()))
        .thenAnswer((_) => Future.value());
    when(() => mockErrorReporter.reportException(any(), any()))
        .thenAnswer((_) => Future.value());

    sl.registerSingleton<TaskRepository>(mockTaskRepository);
    sl.registerSingleton<UserRepository>(mockUserRepository);
    sl.registerSingleton<ErrorReporter>(mockErrorReporter);

    kanbanBoardCubit = KanbanBoardCubit();
  });

  tearDown(() async {
    await Future.wait([
      systemTasksStream.close(),
      userTasksStream.close(),
      userStream.close(),
      kanbanBoardCubit.close(),
    ]);

    sl.reset();
  });

  group('KanbanBoardCubit', () {
    test('initial state is KanbanBoardLoading', () {
      expect(kanbanBoardCubit.state, isA<KanbanBoardLoading>());
    });

    group('Stream handling', () {
      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'emits KanbanBoardLoaded when streams emit valid data',
        build: () => kanbanBoardCubit,
        act: (cubit) {
          const systemTask1 = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          const systemTask2 = SystemTaskSummary(
            id: 'system2',
            title: 'System Task 2',
            status: TaskStatus.inProgress,
            selectedSortKey: 2.0,
            defaultSortKey: 2,
            blockingTaskIds: [],
            isFree: true,
          );

          const userTask = UserTaskSummary(
            id: 'user1',
            title: 'User Task 1',
            status: TaskStatus.done,
            selectedSortKey: 10000000.0,
          );

          systemTasksStream.add(Right([systemTask1, systemTask2]));
          userTasksStream.add(Right([userTask]));
          userStream.add(User(id: 'user1'));
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
        ],
        verify: (cubit) {
          final state = cubit.state as KanbanBoardLoaded;

          expect(state.toDoTaskSummaryList.length, 1);
          expect(state.inProgressTaskSummaryList.length, 1);
          expect(state.doneTaskSummaryList.length, 1);

          expect(state.toDoTaskSummaryList.first.id, 'system1');
          expect(state.inProgressTaskSummaryList.first.id, 'system2');
          expect(state.doneTaskSummaryList.first.id, 'user1');
        },
      );

      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'handles unauthenticated users correctly',
        build: () => kanbanBoardCubit,
        act: (cubit) {
          const systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: false,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Left(UnauthenticatedUserFailure()));
          userStream.add(null);
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
        ],
        verify: (cubit) {
          verify(() => mockErrorReporter.reportFailure(any())).called(1);

          final state = cubit.state as KanbanBoardLoaded;

          expect(state.toDoTaskSummaryList.length, 1);

          expect(state.toDoTaskSummaryList.first.isLockedByPayment, true);
          expect(state.toDoTaskSummaryList.first.accessStatus,
              TaskAccessStatus.lockedByPayment);
        },
      );

      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'handles task dependencies correctly',
        build: () => kanbanBoardCubit,
        act: (cubit) {
          final systemTask1 = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          final systemTask2 = SystemTaskSummary(
            id: 'system2',
            title: 'System Task 2',
            status: TaskStatus.toDo,
            selectedSortKey: 2.0,
            defaultSortKey: 2,
            blockingTaskIds: ['system1'],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask1, systemTask2]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
        ],
        verify: (cubit) {
          final state = cubit.state as KanbanBoardLoaded;

          expect(state.toDoTaskSummaryList[1].blockingTaskTitles,
              ['System Task 1']);
          expect(state.toDoTaskSummaryList[1].isBlockedByDependency, true);
          expect(state.toDoTaskSummaryList[1].accessStatus,
              TaskAccessStatus.lockedByDependency);
        },
      );

      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'emits KanbanBoardFailed when streams emit error',
        build: () => kanbanBoardCubit,
        act: (cubit) {
          systemTasksStream.add(left(NoInternetFailure()));
        },
        expect: () => [
          isA<KanbanBoardFailed>(),
        ],
      );
    });

    group('createUserTask', () {
      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'creates task successfully',
        setUp: () {
          when(() => mockTaskRepository.createUserTask(
                title: any(named: 'title'),
                selectedSortKey: any(named: 'selectedSortKey'),
                status: any(named: 'status'),
              )).thenAnswer((_) async => const Right(unit));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.createUserTask(
            title: 'New Task',
            status: TaskStatus.toDo,
          );
        },
        verify: (_) {
          verify(() => mockTaskRepository.createUserTask(
                title: 'New Task',
                selectedSortKey: any(named: 'selectedSortKey'),
                status: TaskStatus.toDo,
              )).called(1);
        },
      );

      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'handles task creation failure',
        setUp: () {
          when(() => mockTaskRepository.createUserTask(
                title: any(named: 'title'),
                selectedSortKey: any(named: 'selectedSortKey'),
                status: any(named: 'status'),
              )).thenAnswer((_) async => Left(NoInternetFailure()));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.createUserTask(
            title: 'New Task',
            status: TaskStatus.toDo,
          );
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).createUserTaskFailure,
              'createUserTaskFailure',
              isA<NoInternetFailure>()),
        ],
        verify: (_) {
          verify(() => mockErrorReporter.reportFailure(any()))
              .called(greaterThan(0));
        },
      );
    });

    group('updateTaskPlacement', () {
      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'updates task placement successfully',
        setUp: () {
          when(() => mockTaskRepository.updateTaskPlacement(
                taskId: any(named: 'taskId'),
                status: any(named: 'status'),
                didUpdateStatus: any(named: 'didUpdateStatus'),
                isSystemTask: any(named: 'isSystemTask'),
                selectedSortKey: any(named: 'selectedSortKey'),
              )).thenAnswer((_) async => const Right(unit));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.updateTaskPlacement(
            taskId: 'system1',
            status: TaskStatus.inProgress,
            index: 0,
          );
        },
        verify: (_) {
          verify(() => mockTaskRepository.updateTaskPlacement(
                taskId: 'system1',
                status: TaskStatus.inProgress,
                didUpdateStatus: true,
                isSystemTask: true,
                selectedSortKey: any(named: 'selectedSortKey'),
              )).called(1);
        },
      );

      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'handles task placement update failure',
        setUp: () {
          when(() => mockTaskRepository.updateTaskPlacement(
                taskId: any(named: 'taskId'),
                status: any(named: 'status'),
                didUpdateStatus: any(named: 'didUpdateStatus'),
                isSystemTask: any(named: 'isSystemTask'),
                selectedSortKey: any(named: 'selectedSortKey'),
              )).thenAnswer((_) async => Left(NoInternetFailure()));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.updateTaskPlacement(
            taskId: 'system1',
            status: TaskStatus.inProgress,
            index: 0,
          );
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).updateTaskPlacementFailure,
              'updateTaskPlacementFailure',
              isA<Failure>()),
        ],
        verify: (_) {
          verify(() => mockErrorReporter.reportFailure(any()))
              .called(greaterThan(0));
        },
      );
    });

    group('resetTaskStatusFailure', () {
      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'resets updateTaskPlacementFailure',
        setUp: () {
          when(() => mockTaskRepository.updateTaskPlacement(
                taskId: any(named: 'taskId'),
                status: any(named: 'status'),
                didUpdateStatus: any(named: 'didUpdateStatus'),
                isSystemTask: any(named: 'isSystemTask'),
                selectedSortKey: any(named: 'selectedSortKey'),
              )).thenAnswer((_) async => Left(NoInternetFailure()));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.updateTaskPlacement(
            taskId: 'system1',
            status: TaskStatus.inProgress,
            index: 0,
          );

          await Future.delayed(const Duration(milliseconds: 100));

          cubit.resetTaskStatusFailure();
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).updateTaskPlacementFailure,
              'updateTaskPlacementFailure',
              isA<Failure>()),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).updateTaskPlacementFailure,
              'updateTaskPlacementFailure',
              isNull),
        ],
      );
    });

    group('resetTaskCreationFailure', () {
      blocTest<KanbanBoardCubit, KanbanBoardState>(
        'resets createUserTaskFailure',
        setUp: () {
          when(() => mockTaskRepository.createUserTask(
                title: any(named: 'title'),
                selectedSortKey: any(named: 'selectedSortKey'),
                status: any(named: 'status'),
              )).thenAnswer((_) async => Left(NoInternetFailure()));

          final systemTask = SystemTaskSummary(
            id: 'system1',
            title: 'System Task 1',
            status: TaskStatus.toDo,
            selectedSortKey: 1.0,
            defaultSortKey: 1,
            blockingTaskIds: [],
            isFree: true,
          );

          systemTasksStream.add(Right([systemTask]));
          userTasksStream.add(const Right([]));
          userStream.add(User(id: 'user1'));
        },
        build: () => kanbanBoardCubit,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));

          await cubit.createUserTask(
            title: 'New Task',
            status: TaskStatus.toDo,
          );

          await Future.delayed(const Duration(milliseconds: 100));

          cubit.resetTaskCreationFailure();
        },
        expect: () => [
          isA<KanbanBoardLoaded>(),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).createUserTaskFailure,
              'createUserTaskFailure',
              isA<Failure>()),
          isA<KanbanBoardLoaded>().having(
              (state) => (state).createUserTaskFailure,
              'createUserTaskFailure',
              isNull),
        ],
      );
    });

    test('close cancels subscriptions and closes subjects', () async {
      final cubit = KanbanBoardCubit();

      await cubit.close();

      expect(cubit.isClosed, true);
    });
  });
}
