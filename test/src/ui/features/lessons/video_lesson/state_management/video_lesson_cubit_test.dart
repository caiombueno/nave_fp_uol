import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/file_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../mocks.dart';

void main() {
  late VideoLessonCubit videoLessonCubit;
  late MockTaskRepository mockTaskRepository;
  late MockFileRepository mockFileRepository;
  const String testLessonId = 'test-lesson-id';

  late BehaviorSubject<Either<Failure, Lesson>> lessonSubject;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    mockFileRepository = MockFileRepository();

    lessonSubject = BehaviorSubject();

    when(() => mockTaskRepository.watchLesson(any())).thenAnswer(
      (_) => lessonSubject.stream,
    );

    sl.registerSingleton<TaskRepository>(mockTaskRepository);
    sl.registerSingleton<FileRepository>(mockFileRepository);

    videoLessonCubit = VideoLessonCubit(lessonId: testLessonId);
  });

  tearDown(() {
    lessonSubject.close();
    videoLessonCubit.close();
    sl.reset();
  });

  group('VideoLessonCubit', () {
    test('initial state is VideoLessonLoading', () {
      // Assert
      expect(videoLessonCubit.state, const VideoLessonLoading());
    });

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonFailed] when lesson is not a VideoLesson',
      setUp: () {
        const otherLesson = TextLesson(
          id: 'other-lesson-id',
          title: 'Other Lesson',
          content: 'Other Lesson Content',
          isCompleted: null,
        );
        lessonSubject.add(Right(otherLesson));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(any())).called(1);
      },
    );

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonFailed] when VideoLesson has no filePath',
      setUp: () {
        const videoLesson = VideoLesson(
          id: 'video-lesson-id',
          title: null,
          filePath: null,
          isHorizontal: null,
          isCompleted: null,
        );

        lessonSubject.add(Right(videoLesson));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
      },
    );

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonFailed] when getVideoUrl returns failure',
      setUp: () {
        const videoLesson = VideoLesson(
          id: 'video-lesson-id',
          title: null,
          filePath: 'test/path.mp4',
          isHorizontal: null,
          isCompleted: null,
        );

        lessonSubject.add(Right(videoLesson));

        when(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .thenAnswer((_) async => Left(const NoInternetFailure()));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(any())).called(1);
        verify(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .called(1);
      },
    );

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonLoaded] with landscape orientation when lesson is horizontal',
      setUp: () {
        const videoLesson = VideoLesson(
          id: 'video-lesson-id',
          title: null,
          filePath: 'test/path.mp4',
          isHorizontal: true,
          isCompleted: null,
        );
        const testUrl = 'https://example.com/video.mp4';

        lessonSubject.add(Right(videoLesson));

        when(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .thenAnswer((_) async => const Right(testUrl));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonLoaded(
          lessonUrl: 'https://example.com/video.mp4',
          videoOrientation: Orientation.landscape,
        ),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(any())).called(1);
        verify(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .called(1);
      },
    );

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonLoaded] with portrait orientation when lesson is not horizontal',
      setUp: () {
        const videoLesson = VideoLesson(
          id: 'video-lesson-id',
          title: null,
          filePath: 'test/path.mp4',
          isHorizontal: null,
          isCompleted: null,
        );
        const testUrl = 'https://example.com/video.mp4';

        lessonSubject.add(Right(videoLesson));

        when(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .thenAnswer((_) async => const Right(testUrl));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonLoaded(
          lessonUrl: 'https://example.com/video.mp4',
          videoOrientation: Orientation.portrait,
        ),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
        verify(() => mockFileRepository.getVideoUrl(path: any(named: 'path')))
            .called(1);
      },
    );

    blocTest<VideoLessonCubit, VideoLessonState>(
      'emits [VideoLessonFailed] when repository returns failure',
      setUp: () {
        lessonSubject.add(Left(const NoInternetFailure()));
      },
      build: () => videoLessonCubit,
      expect: () => [
        const VideoLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
      },
    );

    test('cancels stream subscription when closed', () async {
      // Act
      videoLessonCubit = VideoLessonCubit(lessonId: testLessonId);
      await videoLessonCubit.close();

      // Assert
      expect(videoLessonCubit.isClosed, true);
      expect(videoLessonCubit.stream, emitsDone);
    });
  });
}
