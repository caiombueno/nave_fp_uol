import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/user.dart';

void main() {
  group('User', () {
    test('initialization with required parameters', () {
      // Arrange & Act
      const testId = 'user-123';
      const user = User(id: testId);

      // Assert
      expect(user.id, testId);
    });

    test('equality comparison', () {
      // Arrange
      const user1 = User(id: 'user-123');
      const user2 = User(id: 'user-123');
      const user3 = User(id: 'user-456');

      // Act & Assert
      expect(user1 == user2, true);
      expect(user1 == user3, false);
    });
  });
}
