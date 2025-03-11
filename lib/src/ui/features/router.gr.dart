// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/sign_in_screen.dart'
    as _i2;
import 'package:nave_fp_uol/src/ui/features/kanban_board/kanban_board_screen.dart'
    as _i1;
import 'package:nave_fp_uol/src/ui/features/task_details/task_details_screen.dart'
    as _i3;

/// generated route for
/// [_i1.KanbanBoardScreen]
class KanbanBoardRoute extends _i4.PageRouteInfo<void> {
  const KanbanBoardRoute({List<_i4.PageRouteInfo>? children})
    : super(KanbanBoardRoute.name, initialChildren: children);

  static const String name = 'KanbanBoardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i1.KanbanBoardScreen());
    },
  );
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute({List<_i4.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.WrappedRoute(child: const _i2.SignInScreen());
    },
  );
}

/// generated route for
/// [_i3.TaskDetailsScreen]
class TaskDetailsRoute extends _i4.PageRouteInfo<TaskDetailsRouteArgs> {
  TaskDetailsRoute({
    _i5.Key? key,
    required String taskId,
    bool isUserTask = false,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         TaskDetailsRoute.name,
         args: TaskDetailsRouteArgs(
           key: key,
           taskId: taskId,
           isUserTask: isUserTask,
         ),
         rawPathParams: {'taskId': taskId},
         initialChildren: children,
       );

  static const String name = 'TaskDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TaskDetailsRouteArgs>(
        orElse:
            () => TaskDetailsRouteArgs(taskId: pathParams.getString('taskId')),
      );
      return _i4.WrappedRoute(
        child: _i3.TaskDetailsScreen(
          key: args.key,
          taskId: args.taskId,
          isUserTask: args.isUserTask,
        ),
      );
    },
  );
}

class TaskDetailsRouteArgs {
  const TaskDetailsRouteArgs({
    this.key,
    required this.taskId,
    this.isUserTask = false,
  });

  final _i5.Key? key;

  final String taskId;

  final bool isUserTask;

  @override
  String toString() {
    return 'TaskDetailsRouteArgs{key: $key, taskId: $taskId, isUserTask: $isUserTask}';
  }
}
