import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/models/user_am.dart';

void main() {
  group('UserAM Serialization', () {
    test('toMap() creates expected map structure', () {
      // Arrange
      const userId = 'user-123';
      const user = UserAM(id: userId);

      // Act
      final map = user.toMap();

      // Assert
      expect(map, {
        'id': userId,
      });
    });

    test('fromMap() correctly creates object from map', () {
      // Arrange
      const userId = 'user-123';
      final map = {'id': userId};

      // Act
      final user = UserAMMapper.fromMap(map);

      // Assert
      expect(user.id, userId);
    });

    test('serialization roundtrip preserves data', () {
      // Arrange
      const originalUser = UserAM(id: 'user-123');

      // Act
      final map = originalUser.toMap();
      final deserializedUser = UserAMMapper.fromMap(map);

      // Assert
      expect(deserializedUser.id, originalUser.id);
    });

    test('fromJson() correctly parses JSON string', () {
      // Arrange
      const jsonString = '{"id":"user-123"}';

      // Act
      final user = UserAMMapper.fromJson(jsonString);

      // Assert
      expect(user.id, 'user-123');
    });

    test('toJson() creates valid JSON string', () {
      // Arrange
      const user = UserAM(id: 'user-123');

      // Act
      final jsonString = user.toJson();

      // Assert
      expect(jsonString, '{"id":"user-123"}');
    });
  });
}
