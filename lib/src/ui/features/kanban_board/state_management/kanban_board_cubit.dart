import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/domain_models/task_summary.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:rxdart/rxdart.dart';

part 'kanban_board_mappers.dart';

class KanbanBoardCubit extends Cubit<KanbanBoardState> {
  KanbanBoardCubit()
      : super(
          const KanbanBoardLoading(),
        ) {
    _setUpSystemTasksSubject();
    _setUpUserTasksSubject();
    _listenSubjects();
  }

  final TaskRepository _taskRepository = sl<TaskRepository>();
  final UserRepository _userRepository = sl<UserRepository>();
  final ErrorReporter _errorReporter = sl<ErrorReporter>();

  late StreamSubscription _subjectsSubscription;
  final BehaviorSubject<List<SystemTaskSummary>> _systemTasksSubject =
      BehaviorSubject();
  late StreamSubscription _systemTasksSubscription;
  final BehaviorSubject<List<UserTaskSummary>?> _userTasksSubject =
      BehaviorSubject();
  late StreamSubscription _userTasksSubscription;

  void _setUpSystemTasksSubject() {
    _systemTasksSubscription =
        _taskRepository.watchSystemTaskSummaryList().listen(
      (systemTasksEither) {
        systemTasksEither.fold(
          (failure) => _handleSubjectFailure(
            _systemTasksSubject,
            failure,
          ),
          _systemTasksSubject.add,
        );
      },
      onError: (exception, stackTrace) {
        _errorReporter.reportException(
          exception,
          stackTrace,
        );
      },
    );
  }

  void _setUpUserTasksSubject() {
    _userTasksSubscription = _taskRepository.watchUserTaskSummaryList().listen(
      (userTasksEither) {
        userTasksEither.fold(
          (failure) => _handleSubjectFailure(
            _userTasksSubject,
            failure,
            treatUnauthenticatedAsNull: true,
          ),
          _userTasksSubject.add,
        );
      },
      onError: (exception, stackTrace) {
        _errorReporter.reportException(
          exception,
          stackTrace,
        );
      },
    );
  }

  void _handleSubjectFailure(
    BehaviorSubject subject,
    Failure failure, {
    bool treatUnauthenticatedAsNull = false,
  }) {
    _errorReporter.reportFailure(failure);
    if (treatUnauthenticatedAsNull && failure is UnauthenticatedUserFailure) {
      subject.add(null);
    } else if (!subject.hasValue) {
      subject.addError(failure);
    }
  }

  void _listenSubjects() {
    _subjectsSubscription = Rx.combineLatest3<List<SystemTaskSummary>,
        List<UserTaskSummary>?, bool, KanbanBoardState>(
      _systemTasksSubject,
      _userTasksSubject,
      _userRepository.watchUser().map((user) => user != null),
      (systemTaskList, userTaskList, isUserAuthenticated) {
        final List<TaskSummary> allTasks = [
          ...systemTaskList,
          ...(userTaskList ?? []),
        ];

        final toDoTasks = allTasks
            .where((task) => task.status == TaskStatus.toDo)
            .toList()
            .toVM(
              systemTaskList,
              isUserAuthenticated,
            )
            .sortedBySortKeys();

        final inProgressTasks = allTasks
            .where((task) => task.status == TaskStatus.inProgress)
            .toList()
            .toVM(
              systemTaskList,
              isUserAuthenticated,
            )
            .sortedBySortKeys();

        final doneTasks = allTasks
            .where((task) => task.status == TaskStatus.done)
            .toList()
            .toVM(
              systemTaskList,
              isUserAuthenticated,
            )
            .sortedBySortKeys();

        return KanbanBoardLoaded(
          toDoTaskSummaryList: toDoTasks,
          inProgressTaskSummaryList: inProgressTasks,
          doneTaskSummaryList: doneTasks,
        );
      },
    ).listen(
      emit,
      onError: (failure) {
        emit(
          KanbanBoardError(),
        );
      },
    );
  }

  Future<void> updateTaskPlacement({
    required String taskId,
    required TaskStatus status,
    required int index,
  }) async {
    final currentState = state;
    if (currentState is KanbanBoardLoaded) {
      final domainTaskList = [
        ..._systemTasksSubject.value,
        ..._userTasksSubject.value ?? []
      ];
      final task = domainTaskList.firstWhereOrNull((task) => task.id == taskId);
      final List<TaskSummaryVM> targetList;
      switch (status) {
        case TaskStatus.toDo:
          targetList = currentState.toDoTaskSummaryList;
          break;
        case TaskStatus.inProgress:
          targetList = currentState.inProgressTaskSummaryList;
          break;
        case TaskStatus.done:
          targetList = currentState.doneTaskSummaryList;
          break;
      }

      final newSelectedSortKey =
          targetList.computeSelectedSortKey(index, taskId);

      final result = await _taskRepository.updateTaskPlacement(
        taskId: taskId,
        status: status,
        didUpdateStatus: task?.status != status,
        isSystemTask: task is SystemTaskSummary,
        selectedSortKey: newSelectedSortKey,
      );

      result.fold((failure) {
        emit(
          currentState.copyWith(
            updateTaskPlacementFailure: failure,
          ),
        );

        if (failure is! UnauthenticatedUserFailure) {
          _errorReporter.reportFailure(failure);
        }
      }, (_) {});
    }
  }

  void resetTaskStatusFailure() {
    final currentState = state;
    if (currentState is KanbanBoardLoaded) {
      emit(
        currentState.copyWith(
          updateTaskPlacementFailure: null,
        ),
      );
    }
  }

  // TODO: Delete this.
  Future<void> signOut() async {
    final userRepository = sl<UserRepository>();
    await userRepository.signOut();
  }

  @override
  Future<void> close() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _systemTasksSubscription.cancel(),
      _userTasksSubscription.cancel(),
      _systemTasksSubject.close(),
      _userTasksSubject.close(),
    ]);

    await super.close();
  }
}
