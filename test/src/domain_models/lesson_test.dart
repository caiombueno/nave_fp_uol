import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';

void main() {
  group('Lesson classes', () {
    group('TextLesson', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        const lesson = TextLesson(
          id: 'text-1',
          title: 'Test Lesson',
          content: 'Test content',
          isCompleted: true,
        );

        // Assert
        expect(lesson.id, equals('text-1'));
        expect(lesson.title, equals('Test Lesson'));
        expect(lesson.content, equals('Test content'));
        expect(lesson.isCompleted, isTrue);
        expect(lesson, isA<Lesson>());
      });

      test('initializes with null title and content', () {
        // Arrange & Act
        const lesson = TextLesson(
          id: 'text-2',
          title: null,
          content: null,
          isCompleted: null,
        );

        // Assert
        expect(lesson.id, equals('text-2'));
        expect(lesson.title, isNull);
        expect(lesson.content, isNull);
        expect(lesson.isCompleted, isNull);
      });
    });

    group('VideoLesson', () {
      test('initializes with required parameters', () {
        // Arrange & Act
        const lesson = VideoLesson(
          id: 'video-1',
          title: 'Video Lesson',
          filePath: 'path/to/video.mp4',
          isHorizontal: true,
          isCompleted: false,
        );

        // Assert
        expect(lesson.id, equals('video-1'));
        expect(lesson.title, equals('Video Lesson'));
        expect(lesson.filePath, equals('path/to/video.mp4'));
        expect(lesson.isHorizontal, isTrue);
        expect(lesson.isCompleted, isFalse);
        expect(lesson, isA<Lesson>());
      });

      test('initializes with null optional parameters', () {
        // Arrange & Act
        const lesson = VideoLesson(
          id: 'video-2',
          title: null,
          filePath: null,
          isHorizontal: null,
          isCompleted: null,
        );

        // Assert
        expect(lesson.id, equals('video-2'));
        expect(lesson.title, isNull);
        expect(lesson.filePath, isNull);
        expect(lesson.isHorizontal, isNull);
        expect(lesson.isCompleted, isNull);
      });
    });

    group('Pattern matching', () {
      test('correctly identifies lesson types in switch statements', () {
        // Arrange
        const textLesson = TextLesson(
          id: 'text-3',
          title: 'Text',
          content: 'Content',
          isCompleted: null,
        );

        const videoLesson = VideoLesson(
          id: 'video-3',
          title: 'Video',
          filePath: 'video.mp4',
          isHorizontal: true,
          isCompleted: null,
        );

        // Act & Assert
        String lessonType(Lesson lesson) {
          return switch (lesson) {
            TextLesson() => 'text',
            VideoLesson() => 'video',
          };
        }

        expect(lessonType(textLesson), equals('text'));
        expect(lessonType(videoLesson), equals('video'));
      });
    });

    group('Mapping functionality', () {
      test('TextLesson serializes and deserializes correctly', () {
        // Arrange
        const lesson = TextLesson(
          id: 'text-4',
          title: 'Serialization Test',
          content: 'Content for serialization',
          isCompleted: true,
        );

        // Act
        final map = lesson.toMap();
        final restored = LessonMapper.fromMap(map);

        // Assert
        expect(restored, isA<TextLesson>());
        expect(restored.id, equals('text-4'));
        expect((restored as TextLesson).title, equals('Serialization Test'));
        expect(restored.content, equals('Content for serialization'));
        expect(restored.isCompleted, isTrue);
        expect(map['type'], equals('text')); // Check discriminator
      });

      test('VideoLesson serializes and deserializes correctly', () {
        // Arrange
        const lesson = VideoLesson(
          id: 'video-4',
          title: 'Video Test',
          filePath: 'test.mp4',
          isHorizontal: true,
          isCompleted: false,
        );

        // Act
        final map = lesson.toMap();
        final restored = LessonMapper.fromMap(map);

        // Assert
        expect(restored, isA<VideoLesson>());
        expect(restored.id, equals('video-4'));
        expect((restored as VideoLesson).title, equals('Video Test'));
        expect(restored.filePath, equals('test.mp4'));
        expect(restored.isHorizontal, isTrue);
        expect(restored.isCompleted, isFalse);
        expect(map['type'], equals('video')); // Check discriminator
      });
    });
  });
}
