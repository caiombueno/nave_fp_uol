import 'package:dart_mappable/dart_mappable.dart';

part 'generated/lesson_sm.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class LessonSM with LessonSMMappable {
  const LessonSM({
    required this.id,
  });

  final String id;
}

@MappableClass(discriminatorValue: 'text')
class TextLessonSM extends LessonSM with TextLessonSMMappable {
  const TextLessonSM({
    required String id,
    required this.title,
    required this.content,
  }): super(id: id);

  final String? title;
  final String? content;
}

@MappableClass(discriminatorValue: 'video')
class VideoLessonSM extends LessonSM with VideoLessonSMMappable {
  const VideoLessonSM({
    required String id,
    required this.title,
    required this.filePath,
    required this.isHorizontal,
  }): super(id: id);

  final String? title;
  final String? filePath;
  final bool? isHorizontal;
}
