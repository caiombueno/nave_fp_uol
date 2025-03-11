import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

part 'generated/kanban_board_state.mapper.dart';

@MappableClass()
sealed class KanbanBoardState with KanbanBoardStateMappable {
  const KanbanBoardState();
}

@MappableClass()
class KanbanBoardLoading extends KanbanBoardState
    with KanbanBoardLoadingMappable {
  const KanbanBoardLoading();
}

@MappableClass()
class KanbanBoardError extends KanbanBoardState with KanbanBoardErrorMappable {
  const KanbanBoardError();
}

@MappableClass()
class KanbanBoardLoaded extends KanbanBoardState
    with KanbanBoardLoadedMappable {
  const KanbanBoardLoaded({
    required this.toDoTaskSummaryList,
    required this.inProgressTaskSummaryList,
    required this.doneTaskSummaryList,
    this.updateTaskPlacementFailure = null,
  });

  final List<TaskSummaryVM> toDoTaskSummaryList;
  final List<TaskSummaryVM> inProgressTaskSummaryList;
  final List<TaskSummaryVM> doneTaskSummaryList;

  final Failure? updateTaskPlacementFailure;
}

enum TaskAccessStatus { lockedByPayment, lockedByDependency, unlocked }

@MappableClass()
sealed class TaskSummaryVM with TaskSummaryVMMappable {
  const TaskSummaryVM({
    required this.id,
    required this.title,
    required this.isLockedByPayment,
    required this.blockingTaskTitles,
    required this.selectedSortKey,
    required this.index,
  });

  final String? id;
  final String? title;

  final bool? isLockedByPayment;
  final List<String>? blockingTaskTitles;

  final double? selectedSortKey;
  final int index;

  bool get isBlockedByDependency => blockingTaskTitles?.isNotEmpty == true;

  TaskAccessStatus get accessStatus {
    if (isLockedByPayment == true) {
      return TaskAccessStatus.lockedByPayment;
    }

    if (isBlockedByDependency) {
      return TaskAccessStatus.lockedByDependency;
    }

    return TaskAccessStatus.unlocked;
  }
}

@MappableClass()
class SystemTaskSummaryVM extends TaskSummaryVM
    with SystemTaskSummaryVMMappable {
  const SystemTaskSummaryVM({
    required String? id,
    required String? title,
    required bool? isLockedByPayment,
    required List<String>? blockingTaskTitles,
    required double? selectedSortKey,
    required int index,
    required this.defaultSortKey,
  }) : super(
          id: id,
          title: title,
          isLockedByPayment: isLockedByPayment,
          blockingTaskTitles: blockingTaskTitles,
          selectedSortKey: selectedSortKey,
          index: index,
        );
  final int? defaultSortKey;
}

@MappableClass()
class UserTaskSummaryVM extends TaskSummaryVM with UserTaskSummaryVMMappable {
  const UserTaskSummaryVM({
    required String? id,
    required String? title,
    required double? selectedSortKey,
    required int index,
  }) : super(
          id: id,
          title: title,
          isLockedByPayment: null,
          blockingTaskTitles: null,
          selectedSortKey: selectedSortKey,
          index: index,
        );
}
