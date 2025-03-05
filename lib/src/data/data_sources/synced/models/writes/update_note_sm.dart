import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'generated/update_note_sm.mapper.dart';

@MappableClass()
class UpdateNoteSM with UpdateNoteSMMappable {
  UpdateNoteSM({
    required this.noteId,
    required this.content,
  }) : lastUpdateDateTime = FieldValue.serverTimestamp();

  @MappableConstructor()
  const UpdateNoteSM.fromMappable({
    required this.noteId,
    required this.content,
    required this.lastUpdateDateTime,
  });

  @MappableField(key: 'id')
  final String? noteId;
  final String? content;
  final FieldValue lastUpdateDateTime;
}
