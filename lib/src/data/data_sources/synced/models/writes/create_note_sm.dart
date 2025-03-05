import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'generated/create_note_sm.mapper.dart';

@MappableClass()
class CreateNoteSM with CreateNoteSMMappable {
  CreateNoteSM({
    required this.content,
  }) : creationDateTime = FieldValue.serverTimestamp();

  @MappableConstructor()
  const CreateNoteSM.fromMappable({
    required this.content,
    required this.creationDateTime,
  });

  final String? content;
  final FieldValue creationDateTime;
}
