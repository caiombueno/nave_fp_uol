import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';

void main() {
  group('TaskDetailsState', () {
    // Define some test data that we'll reuse
    late quill.Delta testDelta;
    late TaskDetailsTaskVM taskVM;
    late TaskDetailsTextLessonVM textLesson;
    late TaskDetailsVideoLessonVM videoLesson;
    late TaskDetailsNoteVM note;

    setUp(() {
      // Initialize test data
      testDelta = quill.Delta()..insert('Test content');

      textLesson = const TaskDetailsTextLessonVM(
        id: 'text-lesson-1',
        title: 'Text Lesson',
        isCompleted: true,
      );

      videoLesson = const TaskDetailsVideoLessonVM(
        id: 'video-lesson-1',
        title: 'Video Lesson',
        isCompleted: false,
      );

      note = TaskDetailsNoteVM(
        id: 'note-1',
        content: testDelta,
      );

      taskVM = TaskDetailsTaskVM(
        title: 'Test Task',
        isUserTask: true,
        descriptionContent: testDelta,
        lessons: [textLesson, videoLesson],
        notes: [note],
      );
    });

    group('TaskDetailsLoading', () {
      test('should be instantiatable', () {
        // Arrange & Act
        const state = TaskDetailsLoading();

        // Assert
        expect(state, isA<TaskDetailsState>());
        expect(state, isA<TaskDetailsLoading>());
      });

      test('should equal another instance with same properties', () {
        // Arrange
        const state1 = TaskDetailsLoading();
        const state2 = TaskDetailsLoading();

        // Assert
        expect(state1, equals(state2));
      });
    });

    group('TaskDetailsFailed', () {
      test('should be instantiatable', () {
        // Arrange & Act
        const state = TaskDetailsFailed();

        // Assert
        expect(state, isA<TaskDetailsState>());
        expect(state, isA<TaskDetailsFailed>());
      });

      test('should equal another instance with same properties', () {
        // Arrange
        const state1 = TaskDetailsFailed();
        const state2 = TaskDetailsFailed();

        // Assert
        expect(state1, equals(state2));
      });
    });

    group('TaskDetailsLoaded', () {
      test('should be instantiatable with required parameters', () {
        // Arrange & Act
        final state = TaskDetailsLoaded(task: taskVM);

        // Assert
        expect(state, isA<TaskDetailsState>());
        expect(state, isA<TaskDetailsLoaded>());
        expect(state.task, equals(taskVM));
      });

      test('should equal another instance with same properties', () {
        // Arrange
        final state1 = TaskDetailsLoaded(task: taskVM);
        final state2 = TaskDetailsLoaded(task: taskVM);

        // Assert
        expect(state1, equals(state2));
      });

      test('should not equal instance with different task', () {
        // Arrange
        final state1 = TaskDetailsLoaded(task: taskVM);

        final differentTaskVM = TaskDetailsTaskVM(
          title: 'Different Task',
          isUserTask: false,
          descriptionContent: testDelta,
          lessons: [textLesson],
          notes: [],
        );

        final state2 = TaskDetailsLoaded(task: differentTaskVM);

        // Assert
        expect(state1, isNot(equals(state2)));
      });
    });

    group('TaskDetailsTaskVM', () {
      test('should be instantiatable with required parameters', () {
        // Arrange & Act
        final vm = TaskDetailsTaskVM(
          title: 'Test Task',
          isUserTask: true,
          descriptionContent: testDelta,
          lessons: [textLesson, videoLesson],
          notes: [note],
        );

        // Assert
        expect(vm, isA<TaskDetailsTaskVM>());
        expect(vm.title, equals('Test Task'));
        expect(vm.isUserTask, isTrue);
        expect(vm.descriptionContent, equals(testDelta));
        expect(vm.lessons, hasLength(2));
        expect(vm.notes, hasLength(1));
      });

      test('should be instantiatable with null optional parameters', () {
        // Arrange & Act
        const vm = TaskDetailsTaskVM(
          title: null,
          isUserTask: true,
          descriptionContent: null,
          lessons: null,
          notes: null,
        );

        // Assert
        expect(vm, isA<TaskDetailsTaskVM>());
        expect(vm.title, isNull);
        expect(vm.isUserTask, isTrue);
        expect(vm.descriptionContent, isNull);
        expect(vm.lessons, isNull);
        expect(vm.notes, isNull);
      });

      test('should equal another instance with same properties', () {
        // Arrange
        final vm1 = TaskDetailsTaskVM(
          title: 'Test Task',
          isUserTask: true,
          descriptionContent: testDelta,
          lessons: [textLesson, videoLesson],
          notes: [note],
        );

        final vm2 = TaskDetailsTaskVM(
          title: 'Test Task',
          isUserTask: true,
          descriptionContent: testDelta,
          lessons: [textLesson, videoLesson],
          notes: [note],
        );

        // Assert
        expect(vm1, equals(vm2));
      });

      test('should not equal instance with different properties', () {
        // Arrange
        final vm1 = TaskDetailsTaskVM(
          title: 'Test Task',
          isUserTask: true,
          descriptionContent: testDelta,
          lessons: [textLesson, videoLesson],
          notes: [note],
        );

        final vm2 = TaskDetailsTaskVM(
          title: 'Different Task',
          isUserTask: true,
          descriptionContent: testDelta,
          lessons: [textLesson, videoLesson],
          notes: [note],
        );

        // Assert
        expect(vm1, isNot(equals(vm2)));
      });
    });

    group('TaskDetailsLessonVM', () {
      test('text lesson should be instantiatable with required parameters', () {
        // Arrange & Act
        const lesson = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Text Lesson',
          isCompleted: true,
        );

        // Assert
        expect(lesson, isA<TaskDetailsLessonVM>());
        expect(lesson, isA<TaskDetailsTextLessonVM>());
        expect(lesson.id, equals('lesson-1'));
        expect(lesson.title, equals('Text Lesson'));
        expect(lesson.isCompleted, isTrue);
      });

      test('video lesson should be instantiatable with required parameters',
          () {
        // Arrange & Act
        const lesson = TaskDetailsVideoLessonVM(
          id: 'lesson-1',
          title: 'Video Lesson',
          isCompleted: false,
        );

        // Assert
        expect(lesson, isA<TaskDetailsLessonVM>());
        expect(lesson, isA<TaskDetailsVideoLessonVM>());
        expect(lesson.id, equals('lesson-1'));
        expect(lesson.title, equals('Video Lesson'));
        expect(lesson.isCompleted, isFalse);
      });

      test('lessons should be instantiatable with null optional parameters',
          () {
        // Arrange & Act
        const textLesson = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: null,
          isCompleted: null,
        );

        const videoLesson = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: null,
          isCompleted: null,
        );

        // Assert
        expect(textLesson.title, isNull);
        expect(textLesson.isCompleted, isNull);
        expect(videoLesson.title, isNull);
        expect(videoLesson.isCompleted, isNull);
      });

      test('should equal another instance with same properties', () {
        // Arrange
        const textLesson1 = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Text Lesson',
          isCompleted: true,
        );

        const textLesson2 = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Text Lesson',
          isCompleted: true,
        );

        const videoLesson1 = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: 'Video Lesson',
          isCompleted: false,
        );

        const videoLesson2 = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: 'Video Lesson',
          isCompleted: false,
        );

        // Assert
        expect(textLesson1, equals(textLesson2));
        expect(videoLesson1, equals(videoLesson2));
      });

      test('should not equal instance with different properties', () {
        // Arrange
        const textLesson1 = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Text Lesson',
          isCompleted: true,
        );

        const textLesson2 = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Different Text Lesson',
          isCompleted: true,
        );

        const videoLesson1 = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: 'Video Lesson',
          isCompleted: false,
        );

        const videoLesson2 = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: 'Video Lesson',
          isCompleted: true, // Different completion status
        );

        // Assert
        expect(textLesson1, isNot(equals(textLesson2)));
        expect(videoLesson1, isNot(equals(videoLesson2)));
      });

      test('should handle pattern matching on sealed class type', () {
        // Arrange
        const TaskDetailsLessonVM lesson1 = TaskDetailsTextLessonVM(
          id: 'lesson-1',
          title: 'Text Lesson',
          isCompleted: true,
        );

        const TaskDetailsLessonVM lesson2 = TaskDetailsVideoLessonVM(
          id: 'lesson-2',
          title: 'Video Lesson',
          isCompleted: false,
        );

        // Act & Assert
        switch (lesson1) {
          case TaskDetailsTextLessonVM():
            expect(true, isTrue); // Test passes if we reach here
          case TaskDetailsVideoLessonVM():
            fail('Wrong lesson type detected');
        }

        switch (lesson2) {
          case TaskDetailsTextLessonVM():
            fail('Wrong lesson type detected');
          case TaskDetailsVideoLessonVM():
            expect(true, isTrue); // Test passes if we reach here
        }
      });
    });

    group('TaskDetailsNoteVM', () {
      test('should be instantiatable with required parameters', () {
        // Arrange & Act
        final note = TaskDetailsNoteVM(
          id: 'note-1',
          content: testDelta,
        );

        // Assert
        expect(note, isA<TaskDetailsNoteVM>());
        expect(note.id, equals('note-1'));
        expect(note.content, equals(testDelta));
      });

      test('should be instantiatable with null content', () {
        // Arrange & Act
        const note = TaskDetailsNoteVM(
          id: 'note-1',
          content: null,
        );

        // Assert
        expect(note.content, isNull);
      });

      test('should equal another instance with same properties', () {
        // Arrange
        final note1 = TaskDetailsNoteVM(
          id: 'note-1',
          content: testDelta,
        );

        final note2 = TaskDetailsNoteVM(
          id: 'note-1',
          content: testDelta,
        );

        // Assert
        expect(note1, equals(note2));
      });

      test('should not equal instance with different properties', () {
        // Arrange
        final note1 = TaskDetailsNoteVM(
          id: 'note-1',
          content: testDelta,
        );

        final note2 = TaskDetailsNoteVM(
          id: 'note-2', // Different ID
          content: testDelta,
        );

        final differentDelta = quill.Delta()..insert('Different content');

        final note3 = TaskDetailsNoteVM(
          id: 'note-1',
          content: differentDelta, // Different content
        );

        // Assert
        expect(note1, isNot(equals(note2)));
        expect(note1, isNot(equals(note3)));
      });
    });

    group('Integration of state classes', () {
      test('state hierarchy should be correctly recognized', () {
        // Arrange
        const loading = TaskDetailsLoading();
        const failed = TaskDetailsFailed();
        final loaded = TaskDetailsLoaded(task: taskVM);

        // Act & Assert
        final TaskDetailsState state1 = loading;
        final TaskDetailsState state2 = failed;
        final TaskDetailsState state3 = loaded;

        expect(state1, isA<TaskDetailsLoading>());
        expect(state2, isA<TaskDetailsFailed>());
        expect(state3, isA<TaskDetailsLoaded>());
      });

      test('pattern matching on sealed state class works correctly', () {
        // Arrange
        const TaskDetailsState loading = TaskDetailsLoading();
        const TaskDetailsState failed = TaskDetailsFailed();
        final TaskDetailsState loaded = TaskDetailsLoaded(task: taskVM);

        // Act & Assert
        void testState(TaskDetailsState state) {
          switch (state) {
            case TaskDetailsLoading():
              expect(state, isA<TaskDetailsLoading>());
              break;
            case TaskDetailsFailed():
              expect(state, isA<TaskDetailsFailed>());
              break;
            case TaskDetailsLoaded():
              expect(state, isA<TaskDetailsLoaded>());
              expect((state).task, equals(taskVM));
              break;
          }
        }

        testState(loading);
        testState(failed);
        testState(loaded);
      });
    });
  });
}
