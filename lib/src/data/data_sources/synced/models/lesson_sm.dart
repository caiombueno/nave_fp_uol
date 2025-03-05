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
    required super.id,
    required this.title,
    required this.content,
  });

  final String? title;
  final String? content;
}

@MappableClass(discriminatorValue: 'video')
class VideoLessonSM extends LessonSM with VideoLessonSMMappable {
  const VideoLessonSM({
    required super.id,
    required this.title,
    required this.url,
    required this.isHorizontal,
  });

  final String? title;
  final String? url;
  final bool? isHorizontal;
}
