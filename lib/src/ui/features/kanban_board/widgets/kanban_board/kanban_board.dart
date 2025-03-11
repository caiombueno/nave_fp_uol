import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/page_view_kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/continuous_scroll_kanban_board.dart';

enum KanbanLayoutMode { continuous, pageView }

typedef OnTaskMove = void Function(
  String? taskId,
  TaskStatus targetStatus,
  int targetIndex,
);

typedef OnCreateTask = void Function(
  TaskStatus targetStatus,
  String title,
);

typedef OnTaskTapped = void Function(String? taskId);

class KanbanBoard extends StatelessWidget {
  const KanbanBoard({
    super.key,
    required this.toDoTaskSummaryList,
    required this.inProgressTaskSummaryList,
    required this.doneTaskSummaryList,
    required this.toDoColumnTitle,
    required this.inProgressColumnTitle,
    required this.doneColumnTitle,
    this.onCreateTask,
    this.onTaskMove,
    this.onTaskTapped,
    this.layoutMode = KanbanLayoutMode.pageView,
  });
  final List<TaskSummaryVM> toDoTaskSummaryList;
  final List<TaskSummaryVM> inProgressTaskSummaryList;
  final List<TaskSummaryVM> doneTaskSummaryList;
  final String toDoColumnTitle;
  final String inProgressColumnTitle;
  final String doneColumnTitle;
  final KanbanLayoutMode layoutMode;
  final OnCreateTask? onCreateTask;
  final OnTaskMove? onTaskMove;
  final OnTaskTapped? onTaskTapped;

  @override
  Widget build(BuildContext context) {
    return switch (layoutMode) {
      KanbanLayoutMode.pageView => PageViewKanbanBoard(
          toDoTaskSummaryList: toDoTaskSummaryList,
          inProgressTaskSummaryList: inProgressTaskSummaryList,
          doneTaskSummaryList: doneTaskSummaryList,
          toDoColumnTitle: toDoColumnTitle,
          inProgressColumnTitle: inProgressColumnTitle,
          doneColumnTitle: doneColumnTitle,
          onCreateTask: onCreateTask,
          onTaskMove: onTaskMove,
          onTaskTapped: onTaskTapped,
        ),
      KanbanLayoutMode.continuous => ContinuousScrollKanbanBoard(
          toDoTaskSummaryList: toDoTaskSummaryList,
          inProgressTaskSummaryList: inProgressTaskSummaryList,
          doneTaskSummaryList: doneTaskSummaryList,
          toDoColumnTitle: toDoColumnTitle,
          inProgressColumnTitle: inProgressColumnTitle,
          doneColumnTitle: doneColumnTitle,
          onCreateTask: onCreateTask,
          onTaskMove: onTaskMove,
          onTaskTapped: onTaskTapped,
        ),
    };
  }
}
