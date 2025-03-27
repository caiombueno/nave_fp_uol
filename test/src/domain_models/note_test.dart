import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/note.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

void main() {
  setUpAll(() {
    // Initialize timezone database
    tz_data.initializeTimeZones();
    // Set a default location for tests
    tz.setLocalLocation(tz.getLocation('UTC'));
  });
  group('Note', () {
    test('initializes with required parameters only', () {
      // Arrange & Act
      const note = Note(
        id: 'note-1',
        content: 'Test content',
      );

      // Assert
      expect(note.id, equals('note-1'));
      expect(note.content, equals('Test content'));
      expect(note.lastUpdateDateTime, isNull);
      expect(note.creationDateTime, isNull);
    });

    test('initializes with all parameters', () {
      // Arrange
      final now = tz.TZDateTime.now(tz.local);
      final yesterday = now.subtract(const Duration(days: 1));

      // Act
      final note = Note(
        id: 'note-2',
        content: 'Full note',
        lastUpdateDateTime: now,
        creationDateTime: yesterday,
      );

      // Assert
      expect(note.id, equals('note-2'));
      expect(note.content, equals('Full note'));
      expect(note.lastUpdateDateTime, equals(now));
      expect(note.creationDateTime, equals(yesterday));
    });

    test('initializes with null content', () {
      // Arrange & Act
      const note = Note(
        id: 'note-3',
        content: null,
      );

      // Assert
      expect(note.id, equals('note-3'));
      expect(note.content, isNull);
    });
  });
}
