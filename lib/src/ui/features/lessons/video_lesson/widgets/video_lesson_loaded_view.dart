import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/utils/extensions/orientation_extensions.dart';
import 'package:nave_fp_uol/src/utils/params/chewie_controller_params.dart';
import 'package:video_player/video_player.dart';

class VideoLessonLoadedView extends StatefulWidget {
  const VideoLessonLoadedView({
    super.key,
    required this.lessonUrl,
    required this.orientation,
  });
  final String lessonUrl;
  final Orientation orientation;

  @override
  State<VideoLessonLoadedView> createState() => _VideoLessonLoadedViewState();
}

class _VideoLessonLoadedViewState extends State<VideoLessonLoadedView> {
  late final VideoPlayerController _videoPlayerController;

  late final ChewieController _chewieController;

  @override
  void initState() {
    print(widget.lessonUrl);
    _videoPlayerController =
        sl<VideoPlayerController>(param1: widget.lessonUrl);

    final prefferedOrientations = widget.orientation.deviceOrientations;

    SystemChrome.setPreferredOrientations(prefferedOrientations);

    _chewieController = sl<ChewieController>(
      param1: ChewieControllerParams(
        aspectRatio: widget.orientation.toAspectRatio(),
        maxScale: 1,
        allowedScreenSleep: false,
        videoPlayerController: _videoPlayerController,
        autoInitialize: true,
        deviceOrientationsOnEnterFullScreen: prefferedOrientations,
        deviceOrientationsAfterFullScreen: prefferedOrientations,
        materialProgressColors: ChewieProgressColors(
          playedColor: KnotCoreColors.blue,
        ),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}

extension on Orientation {
  double toAspectRatio() {
    return (this == Orientation.landscape) ? 16 / 9 : 9 / 16;
  }
}
