import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_state.dart';

void main() {
  late quill.Delta testDelta;

  setUp(() {
    testDelta = quill.Delta()
      ..insert('Test content')
      ..insert('\n', {'header': 1})
      ..insert('This is a paragraph');
  });

  group('TextLessonState', () {
    group('TextLessonLoading', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = TextLessonLoading();

        // Assert
        expect(state, isA<TextLessonState>());
      });
    });

    group('TextLessonFailed', () {
      test('initializes correctly', () {
        // Arrange & Act
        const state = TextLessonFailed();

        // Assert
        expect(state, isA<TextLessonState>());
      });
    });

    group('TextLessonLoaded', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        final lesson = TextLessonVM(
          title: 'Test Lesson',
          lessonContent: testDelta,
        );
        final state = TextLessonLoaded(
          lesson: lesson,
        );

        // Assert
        expect(state, isA<TextLessonState>());
        expect(state.lesson, equals(lesson));
        expect(state.lesson.title, equals('Test Lesson'));
        expect(state.lesson.lessonContent, equals(testDelta));
      });

      test('initializes with null title', () {
        // Arrange & Act
        final lesson = TextLessonVM(
          title: null,
          lessonContent: testDelta,
        );
        final state = TextLessonLoaded(
          lesson: lesson,
        );

        // Assert
        expect(state.lesson.title, isNull);
        expect(state.lesson.lessonContent, equals(testDelta));
      });
    });

    group('TextLessonVM', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        final lessonVM = TextLessonVM(
          title: 'Test Lesson',
          lessonContent: testDelta,
        );

        // Assert
        expect(lessonVM.title, equals('Test Lesson'));
        expect(lessonVM.lessonContent, equals(testDelta));
      });

      test('initializes with null title', () {
        // Arrange & Act
        final lessonVM = TextLessonVM(
          title: null,
          lessonContent: testDelta,
        );

        // Assert
        expect(lessonVM.title, isNull);
        expect(lessonVM.lessonContent, equals(testDelta));
      });
    });
  });
}
