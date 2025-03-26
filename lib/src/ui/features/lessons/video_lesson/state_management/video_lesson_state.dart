import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'generated/video_lesson_state.mapper.dart';

@MappableClass()
sealed class VideoLessonState with VideoLessonStateMappable {
  const VideoLessonState();
}

@MappableClass()
final class VideoLessonLoading extends VideoLessonState
    with VideoLessonLoadingMappable {
  const VideoLessonLoading();
}

@MappableClass()
final class VideoLessonLoaded extends VideoLessonState
    with VideoLessonLoadedMappable {
  const VideoLessonLoaded({
    required this.lessonUrl,
    required this.videoOrientation,
  });
  final String lessonUrl;
  final Orientation videoOrientation;
}

@MappableClass()
final class VideoLessonFailed extends VideoLessonState
    with VideoLessonFailedMappable {
  const VideoLessonFailed();
}
