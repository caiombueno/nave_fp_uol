import 'package:dart_mappable/dart_mappable.dart';
import 'package:timezone/timezone.dart';

part 'generated/note.mapper.dart';

@MappableClass()
class Note with NoteMappable {
  const Note({
    required this.id,
    required this.content,
    this.lastUpdateDateTime,
    this.creationDateTime,
  });

  final String id;
  final String? content;
  final TZDateTime? lastUpdateDateTime;
  final TZDateTime? creationDateTime;
}
