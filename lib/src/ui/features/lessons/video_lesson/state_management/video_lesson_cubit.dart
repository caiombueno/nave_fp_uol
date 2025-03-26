import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/file_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_state.dart';

class VideoLessonCubit extends Cubit<VideoLessonState> {
  VideoLessonCubit({
    required String lessonId,
  }) : super(const VideoLessonLoading()) {
    _lessonSubscription = _taskRepository.watchLesson(lessonId).listen(
      (lessonEither) async {
        emit(
          await lessonEither.fold(
            (failure) => const VideoLessonFailed(),
            (lesson) async {
              if (lesson is! VideoLesson) {
                return const VideoLessonFailed();
              }

              final filePath = lesson.filePath;

              if (filePath == null) {
                return const VideoLessonFailed();
              }

              final urlEither =
                  await _fileRepository.getVideoUrl(path: filePath);

              return urlEither.fold(
                (failure) => const VideoLessonFailed(),
                (url) => VideoLessonLoaded(
                  lessonUrl: url,
                  videoOrientation: (lesson.isHorizontal == true)
                      ? Orientation.landscape
                      : Orientation.portrait,
                ),
              );
            },
          ),
        );
      },
    );
  }

  final _fileRepository = sl<FileRepository>();

  final _taskRepository = sl<TaskRepository>();

  late final StreamSubscription _lessonSubscription;

  @override
  Future<void> close() {
    _lessonSubscription.cancel();
    return super.close();
  }
}
