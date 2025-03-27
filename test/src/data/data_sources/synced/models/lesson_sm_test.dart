import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_sm.dart';

void main() {
  group('TextLessonSM', () {
    test('initializes correctly with required parameters', () {
      // Arrange & Act
      const lesson = TextLessonSM(
        id: 'lesson-1',
        title: 'Introduction',
        content: 'This is the lesson content',
      );

      // Assert
      expect(lesson.id, 'lesson-1');
      expect(lesson.title, 'Introduction');
      expect(lesson.content, 'This is the lesson content');
      expect(lesson, isA<LessonSM>());
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      const lesson = TextLessonSM(
        id: 'lesson-1',
        title: null,
        content: null,
      );

      // Assert
      expect(lesson.id, 'lesson-1');
      expect(lesson.title, null);
      expect(lesson.content, null);
    });

    test('serialization to map includes type discriminator', () {
      // Arrange
      const lesson = TextLessonSM(
        id: 'lesson-1',
        title: 'Introduction',
        content: 'Content here',
      );

      // Act
      final map = lesson.toMap();

      // Assert
      expect(map['id'], 'lesson-1');
      expect(map['title'], 'Introduction');
      expect(map['content'], 'Content here');
      expect(map['type'], 'text');
    });

    test('deserialization from map works correctly', () {
      // Arrange
      final map = {
        'id': 'lesson-1',
        'title': 'Introduction',
        'content': 'Content here',
        'type': 'text',
      };

      // Act
      final lesson = LessonSMMapper.fromMap(map) as TextLessonSM;

      // Assert
      expect(lesson.id, 'lesson-1');
      expect(lesson.title, 'Introduction');
      expect(lesson.content, 'Content here');
    });
  });

  group('VideoLessonSM', () {
    test('initializes correctly with required parameters', () {
      // Arrange & Act
      const lesson = VideoLessonSM(
        id: 'lesson-2',
        title: 'Video Tutorial',
        filePath: '/videos/tutorial.mp4',
        isHorizontal: true,
      );

      // Assert
      expect(lesson.id, 'lesson-2');
      expect(lesson.title, 'Video Tutorial');
      expect(lesson.filePath, '/videos/tutorial.mp4');
      expect(lesson.isHorizontal, true);
      expect(lesson, isA<LessonSM>());
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      const lesson = VideoLessonSM(
        id: 'lesson-2',
        title: null,
        filePath: null,
        isHorizontal: null,
      );

      // Assert
      expect(lesson.id, 'lesson-2');
      expect(lesson.title, null);
      expect(lesson.filePath, null);
      expect(lesson.isHorizontal, null);
    });

    test('serialization to map includes type discriminator', () {
      // Arrange
      const lesson = VideoLessonSM(
        id: 'lesson-2',
        title: 'Video Tutorial',
        filePath: '/videos/tutorial.mp4',
        isHorizontal: true,
      );

      // Act
      final map = lesson.toMap();

      // Assert
      expect(map['id'], 'lesson-2');
      expect(map['title'], 'Video Tutorial');
      expect(map['filePath'], '/videos/tutorial.mp4');
      expect(map['isHorizontal'], true);
      expect(map['type'], 'video');
    });

    test('deserialization from map works correctly', () {
      // Arrange
      final map = {
        'id': 'lesson-2',
        'title': 'Video Tutorial',
        'filePath': '/videos/tutorial.mp4',
        'isHorizontal': true,
        'type': 'video',
      };

      // Act
      final lesson = LessonSMMapper.fromMap(map) as VideoLessonSM;

      // Assert
      expect(lesson.id, 'lesson-2');
      expect(lesson.title, 'Video Tutorial');
      expect(lesson.filePath, '/videos/tutorial.mp4');
      expect(lesson.isHorizontal, true);
    });
  });

  group('LessonSM polymorphic serialization', () {
    test('fromMap creates correct subtype based on type discriminator', () {
      // Arrange
      final textMap = {
        'id': 'lesson-1',
        'title': 'Text Lesson',
        'content': 'Content',
        'type': 'text'
      };
      final videoMap = {
        'id': 'lesson-2',
        'title': 'Video Lesson',
        'filePath': '/path',
        'isHorizontal': false,
        'type': 'video'
      };

      // Act
      final textLesson = LessonSMMapper.fromMap(textMap);
      final videoLesson = LessonSMMapper.fromMap(videoMap);

      // Assert
      expect(textLesson, isA<TextLessonSM>());
      expect(videoLesson, isA<VideoLessonSM>());
    });

    test('serialization roundtrip preserves type and data', () {
      // Arrange
      const lessons = [
        TextLessonSM(id: 'text-1', title: 'Text Lesson', content: 'Content'),
        VideoLessonSM(
            id: 'video-1',
            title: 'Video Lesson',
            filePath: '/videos/lesson.mp4',
            isHorizontal: true),
      ];

      // Act
      final maps = lessons.map((lesson) => lesson.toMap()).toList();
      final deserializedLessons =
          maps.map((map) => LessonSMMapper.fromMap(map)).toList();

      // Assert - verify type
      expect(deserializedLessons[0], isA<TextLessonSM>());
      expect(deserializedLessons[1], isA<VideoLessonSM>());

      // Assert - verify data
      final textLesson = deserializedLessons[0] as TextLessonSM;
      expect(textLesson.id, 'text-1');
      expect(textLesson.title, 'Text Lesson');
      expect(textLesson.content, 'Content');

      final videoLesson = deserializedLessons[1] as VideoLessonSM;
      expect(videoLesson.id, 'video-1');
      expect(videoLesson.title, 'Video Lesson');
      expect(videoLesson.filePath, '/videos/lesson.mp4');
      expect(videoLesson.isHorizontal, true);
    });

    test('pattern matching works correctly on deserialized objects', () {
      // Arrange
      final textMap = {
        'id': 'lesson-1',
        'title': 'Text Lesson',
        'content': 'Content',
        'type': 'text'
      };
      final videoMap = {
        'id': 'lesson-2',
        'title': 'Video Lesson',
        'filePath': '/path',
        'isHorizontal': false,
        'type': 'video'
      };

      // Act
      final textLesson = LessonSMMapper.fromMap(textMap);
      final videoLesson = LessonSMMapper.fromMap(videoMap);

      // Assert with pattern matching
      String getLessonType(LessonSM lesson) => switch (lesson) {
            TextLessonSM _ => 'Text',
            VideoLessonSM _ => 'Video',
          };

      expect(getLessonType(textLesson), 'Text');
      expect(getLessonType(videoLesson), 'Video');
    });
  });
}
