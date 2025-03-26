import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_state.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/widgets/video_lesson_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';
import 'package:nave_fp_uol/src/utils/extensions/orientation_extensions.dart';

@RoutePage()
class VideoLessonScreen extends StatelessWidget implements AutoRouteWrapper {
  const VideoLessonScreen({super.key, required this.lessonId});
  final String lessonId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoLessonCubit(lessonId: lessonId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoLessonCubit, VideoLessonState>(
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (didPop, __) {
            if (!didPop) return;
            SystemChrome.setPreferredOrientations(
              Orientation.portrait.deviceOrientations,
            );
          },
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: KnotSemanticColors.videoLessonScreenBackButton,
              ),
              backgroundColor: KnotSemanticColors.videoLessonScreenBackground,
            ),
            backgroundColor: KnotSemanticColors.videoLessonScreenBackground,
            body: SafeArea(
              child: switch (state) {
                VideoLessonLoading _ => const KnotProgressIndicator(
                    color:
                        KnotSemanticColors.videoLessonScreenProgressIndicator,
                  ),
                VideoLessonFailed _ => Center(
                    child: Text(
                      context.l10n.videoLessonScreenFailedMessage,
                      style: KnotSemanticTextStyles.videoLessonErrorMessage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                VideoLessonLoaded loaded => VideoLessonLoadedView(
                    lessonUrl: loaded.lessonUrl,
                    orientation: loaded.videoOrientation,
                  ),
              },
            ),
          ),
        );
      },
    );
  }
}
