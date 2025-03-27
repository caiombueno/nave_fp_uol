import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../mocks.dart';

void main() {
  late TextLessonCubit textLessonCubit;
  late MockTaskRepository mockTaskRepository;
  const testLessonId = 'test-lesson-id';
  late BehaviorSubject<Either<Failure, Lesson>> lessonSubject;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    lessonSubject = BehaviorSubject();

    when(() => mockTaskRepository.watchLesson(any())).thenAnswer(
      (_) => lessonSubject.stream,
    );

    sl.registerSingleton<TaskRepository>(mockTaskRepository);

    textLessonCubit = TextLessonCubit(lessonId: testLessonId);
  });

  tearDown(() {
    lessonSubject.close();
    textLessonCubit.close();
    sl.reset();
  });

  group('TextLessonCubit', () {
    test('initial state is TextLessonLoading', () {
      // Assert
      expect(textLessonCubit.state, const TextLessonLoading());
    });

    blocTest<TextLessonCubit, TextLessonState>(
      'emits [TextLessonFailed] when repository returns failure',
      build: () => textLessonCubit,
      act: (_) {
        lessonSubject.add(Left(const NoInternetFailure()));
      },
      expect: () => [
        const TextLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(any())).called(1);
      },
    );

    blocTest<TextLessonCubit, TextLessonState>(
      'emits [TextLessonFailed] when lesson is not a TextLesson',
      act: (_) {
        final videoLesson = VideoLesson(
          id: testLessonId,
          title: null,
          filePath: null,
          isHorizontal: null,
          isCompleted: null,
        );

        lessonSubject.add(Right(videoLesson));
      },
      build: () => textLessonCubit,
      expect: () => [
        const TextLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(any())).called(1);
      },
    );

    blocTest<TextLessonCubit, TextLessonState>(
      'emits [TextLessonFailed] when content format is incorrect',
      act: (_) {
        const textLesson = TextLesson(
          id: 'text-lesson-id',
          title: 'Text Lesson',
          content: 'Text Lesson Content',
          isCompleted: null,
        );

        lessonSubject.add(Right(textLesson));
      },
      build: () => textLessonCubit,
      expect: () => [
        const TextLessonFailed(),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
      },
    );

    blocTest<TextLessonCubit, TextLessonState>(
      'emits [TextLessonLoaded] with correct TextLessonVM',
      act: (_) {
        const textLesson = TextLesson(
          id: 'text-lesson-id',
          title: 'Text Lesson',
          content:
              r'[     { "insert": "Agora é a hora de espalhar a notícia!\n", "attributes": { "bold": true } },     { "insert": "Com o Save The Date definido, nós vamos garantir que ele chegue direitinho para os convidados, de um jeito prático e sem estresse. Assim, todo mundo já marca a data na agenda e entra no clima do casamento com antecedência.\n" }   ]',
          isCompleted: null,
        );

        lessonSubject.add(Right(textLesson));
      },
      build: () => textLessonCubit,
      expect: () => [
        isA<TextLessonLoaded>().having(
          (state) => state.lesson.title,
          'lesson title',
          'Text Lesson',
        ),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
      },
    );

    blocTest<TextLessonCubit, TextLessonState>(
      'emits [TextLessonLoaded] with null title when lesson title is null',
      build: () => textLessonCubit,
      act: (_) {
        const textLesson = TextLesson(
          id: 'text-lesson-id',
          title: null,
          content:
              r'[     { "insert": "Agora é a hora de espalhar a notícia!\n", "attributes": { "bold": true } },     { "insert": "Com o Save The Date definido, nós vamos garantir que ele chegue direitinho para os convidados, de um jeito prático e sem estresse. Assim, todo mundo já marca a data na agenda e entra no clima do casamento com antecedência.\n" }   ]',
          isCompleted: null,
        );

        lessonSubject.add(Right(textLesson));
      },
      expect: () => [
        isA<TextLessonLoaded>().having(
          (state) => state.lesson.title,
          'lesson title',
          null,
        ),
      ],
      verify: (_) {
        verify(() => mockTaskRepository.watchLesson(testLessonId)).called(1);
      },
    );

    test('cancels stream subscription when closed', () async {
      // Act
      await textLessonCubit.close();

      // Assert
      expect(textLessonCubit.isClosed, true);
      expect(textLessonCubit.stream, emitsDone);
    });
  });
}
