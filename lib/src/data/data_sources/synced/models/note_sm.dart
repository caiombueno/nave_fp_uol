import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'generated/note_sm.mapper.dart';

@MappableClass()
class NoteSM with NoteSMMappable {
  const NoteSM({
    required this.id,
    required this.content,
    required this.lastUpdateDateTime,
    required this.creationDateTime,
  });

  final String id;
  final String? content;
  final Timestamp? lastUpdateDateTime;
  final Timestamp? creationDateTime;
}
