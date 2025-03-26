// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/sign_in_screen.dart'
    as _i2;
import 'package:nave_fp_uol/src/ui/features/kanban_board/kanban_board_screen.dart'
    as _i1;
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/text_lesson_screen.dart'
    as _i4;
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/video_lesson_screen.dart'
    as _i5;
import 'package:nave_fp_uol/src/ui/features/task_details/task_details_screen.dart'
    as _i3;

/// generated route for
/// [_i1.KanbanBoardScreen]
class KanbanBoardRoute extends _i6.PageRouteInfo<void> {
  const KanbanBoardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          KanbanBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'KanbanBoardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i1.KanbanBoardScreen());
    },
  );
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.WrappedRoute(child: const _i2.SignInScreen());
    },
  );
}

/// generated route for
/// [_i3.TaskDetailsScreen]
class TaskDetailsRoute extends _i6.PageRouteInfo<TaskDetailsRouteArgs> {
  TaskDetailsRoute({
    _i7.Key? key,
    required String taskId,
    bool isUserTask = false,
    List<_i6.PageRouteInfo>? children,
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

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TaskDetailsRouteArgs>(
          orElse: () =>
              TaskDetailsRouteArgs(taskId: pathParams.getString('taskId')));
      return _i6.WrappedRoute(
          child: _i3.TaskDetailsScreen(
        key: args.key,
        taskId: args.taskId,
        isUserTask: args.isUserTask,
      ));
    },
  );
}

class TaskDetailsRouteArgs {
  const TaskDetailsRouteArgs({
    this.key,
    required this.taskId,
    this.isUserTask = false,
  });

  final _i7.Key? key;

  final String taskId;

  final bool isUserTask;

  @override
  String toString() {
    return 'TaskDetailsRouteArgs{key: $key, taskId: $taskId, isUserTask: $isUserTask}';
  }
}

/// generated route for
/// [_i4.TextLessonScreen]
class TextLessonRoute extends _i6.PageRouteInfo<TextLessonRouteArgs> {
  TextLessonRoute({
    _i7.Key? key,
    required String lessonId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TextLessonRoute.name,
          args: TextLessonRouteArgs(
            key: key,
            lessonId: lessonId,
          ),
          initialChildren: children,
        );

  static const String name = 'TextLessonRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TextLessonRouteArgs>();
      return _i6.WrappedRoute(
          child: _i4.TextLessonScreen(
        key: args.key,
        lessonId: args.lessonId,
      ));
    },
  );
}

class TextLessonRouteArgs {
  const TextLessonRouteArgs({
    this.key,
    required this.lessonId,
  });

  final _i7.Key? key;

  final String lessonId;

  @override
  String toString() {
    return 'TextLessonRouteArgs{key: $key, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i5.VideoLessonScreen]
class VideoLessonRoute extends _i6.PageRouteInfo<VideoLessonRouteArgs> {
  VideoLessonRoute({
    _i7.Key? key,
    required String lessonId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          VideoLessonRoute.name,
          args: VideoLessonRouteArgs(
            key: key,
            lessonId: lessonId,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoLessonRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoLessonRouteArgs>();
      return _i6.WrappedRoute(
          child: _i5.VideoLessonScreen(
        key: args.key,
        lessonId: args.lessonId,
      ));
    },
  );
}

class VideoLessonRouteArgs {
  const VideoLessonRouteArgs({
    this.key,
    required this.lessonId,
  });

  final _i7.Key? key;

  final String lessonId;

  @override
  String toString() {
    return 'VideoLessonRouteArgs{key: $key, lessonId: $lessonId}';
  }
}
