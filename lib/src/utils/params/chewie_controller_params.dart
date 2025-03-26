import 'package:chewie/chewie.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
part 'generated/chewie_controller_params.mapper.dart';

@MappableClass()
class ChewieControllerParams with ChewieControllerParamsMappable {
  final double? aspectRatio;
  final double maxScale;
  final bool allowedScreenSleep;
  final VideoPlayerController videoPlayerController;
  final bool autoInitialize;
  final List<DeviceOrientation>? deviceOrientationsOnEnterFullScreen;
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen;
  final ChewieProgressColors? materialProgressColors;

  ChewieControllerParams({
    this.aspectRatio,
    this.maxScale = 2.5,
    this.allowedScreenSleep = true,
    required this.videoPlayerController,
    this.autoInitialize = false,
    this.deviceOrientationsOnEnterFullScreen,
    this.deviceOrientationsAfterFullScreen = DeviceOrientation.values,
    this.materialProgressColors,
  });
}
