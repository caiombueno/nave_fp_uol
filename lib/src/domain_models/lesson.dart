import 'package:dart_mappable/dart_mappable.dart';

part 'generated/lesson.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class Lesson with LessonMappable {
  const Lesson({
    required this.id,
    required this.isCompleted,
  });

  final String id;
  final bool? isCompleted;
}

@MappableClass(discriminatorValue: 'text')
class TextLesson extends Lesson with TextLessonMappable {
  const TextLesson({
    required super.id,
    required this.title,
    required this.content,
    required super.isCompleted,
  });

  final String? title;
  final String? content;
}

@MappableClass(discriminatorValue: 'video')
class VideoLesson extends Lesson with VideoLessonMappable {
  const VideoLesson({
    required super.id,
    required this.title,
    required this.url,
    required this.isHorizontal,
    required super.isCompleted,
  });

  final String? title;
  final String? url;
  final bool? isHorizontal;
}
