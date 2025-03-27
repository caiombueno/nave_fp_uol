import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/note_sm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  group('NoteSM', () {
    const testId = 'note-1';
    const testContent = 'Test note content';
    final testLastUpdateTime = Timestamp.fromDate(DateTime(2023, 1, 2, 10, 30));
    final testCreationTime = Timestamp.fromDate(DateTime(2023, 1, 1, 8, 0));

    test('initializes with all required parameters', () {
      // Arrange & Act
      final note = NoteSM(
        id: testId,
        content: testContent,
        lastUpdateDateTime: testLastUpdateTime,
        creationDateTime: testCreationTime,
      );

      // Assert
      expect(note.id, testId);
      expect(note.content, testContent);
      expect(note.lastUpdateDateTime, testLastUpdateTime);
      expect(note.creationDateTime, testCreationTime);
    });

    test('initializes with null optional parameters', () {
      // Arrange & Act
      final note = NoteSM(
        id: testId,
        content: null,
        lastUpdateDateTime: null,
        creationDateTime: null,
      );

      // Assert
      expect(note.id, testId);
      expect(note.content, null);
      expect(note.lastUpdateDateTime, null);
      expect(note.creationDateTime, null);
    });

    test('deserialization creates correct object', () {
      // Arrange
      final map = {
        'id': testId,
        'content': testContent,
        'lastUpdateDateTime': testLastUpdateTime,
        'creationDateTime': testCreationTime,
      };

      // Act
      final note = NoteSMMapper.fromMap(map);

      // Assert
      expect(note.id, testId);
      expect(note.content, testContent);
      expect(note.lastUpdateDateTime, testLastUpdateTime);
      expect(note.creationDateTime, testCreationTime);
    });

    test('serialization handles null fields correctly', () {
      // Arrange
      final note = NoteSM(
        id: testId,
        content: null,
        lastUpdateDateTime: null,
        creationDateTime: null,
      );

      // Act
      final map = note.toMap();
      final deserializedNote = NoteSMMapper.fromMap(map);

      // Assert
      expect(deserializedNote.id, testId);
      expect(deserializedNote.content, null);
      expect(deserializedNote.lastUpdateDateTime, null);
      expect(deserializedNote.creationDateTime, null);
    });
  });
}
