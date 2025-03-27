import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_user_data_sm.dart';

void main() {
  group('LessonUserDataSM', () {
    test('initializes correctly with required parameters', () {
      // Arrange & Act
      const data = LessonUserDataSM(
        lessonId: 'lesson-1',
        isCompleted: true,
      );

      // Assert
      expect(data.lessonId, 'lesson-1');
      expect(data.isCompleted, true);
    });

    test('initializes with null isCompleted parameter', () {
      // Arrange & Act
      const data = LessonUserDataSM(
        lessonId: 'lesson-1',
        isCompleted: null,
      );

      // Assert
      expect(data.lessonId, 'lesson-1');
      expect(data.isCompleted, null);
    });

    test('serialization uses correct field mapping', () {
      // Arrange
      const data = LessonUserDataSM(
        lessonId: 'lesson-1',
        isCompleted: true,
      );

      // Act
      final map = data.toMap();

      // Assert
      expect(map['id'], 'lesson-1'); // lessonId is mapped to 'id'
      expect(map['isCompleted'], true);
      expect(map.containsKey('lessonId'), false); // Field should not be present
    });

    test('deserialization respects field mapping', () {
      // Arrange
      final map = {
        'id': 'lesson-1', // Note: using 'id' instead of 'lessonId'
        'isCompleted': true,
      };

      // Act
      final data = LessonUserDataSMMapper.fromMap(map);

      // Assert
      expect(data.lessonId, 'lesson-1');
      expect(data.isCompleted, true);
    });

    test('serialization roundtrip preserves data', () {
      // Arrange
      const original = LessonUserDataSM(
        lessonId: 'lesson-1',
        isCompleted: true,
      );

      // Act
      final map = original.toMap();
      final deserialized = LessonUserDataSMMapper.fromMap(map);

      // Assert
      expect(deserialized.lessonId, original.lessonId);
      expect(deserialized.isCompleted, original.isCompleted);
    });

    test('JSON serialization works correctly', () {
      // Arrange
      const data = LessonUserDataSM(
        lessonId: 'lesson-1',
        isCompleted: false,
      );

      // Act
      final json = data.toJson();
      final fromJson = LessonUserDataSMMapper.fromJson(json);

      // Assert
      expect(fromJson.lessonId, 'lesson-1');
      expect(fromJson.isCompleted, false);
    });
  });
}
