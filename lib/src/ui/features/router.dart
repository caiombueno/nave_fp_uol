import 'package:auto_route/auto_route.dart';
import 'package:nave_fp_uol/src/ui/features/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Modal,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/tasks',
          page: KanbanBoardRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/tasks/:taskId',
          page: TaskDetailsRoute.page,
        ),
        AutoRoute(
          path: '/tasks/:taskId/video-lesson/:lessonId',
          page: VideoLessonRoute.page,
        ),
        AutoRoute(
          path: '/tasks/:taskId/text-lesson/:lessonId',
          page: TextLessonRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
          fullscreenDialog: false,
          initial: false,
        ),
      ];
}
