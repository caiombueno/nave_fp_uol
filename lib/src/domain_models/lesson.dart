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
    required String id,
    required this.title,
    required this.content,
    required bool? isCompleted,
  }) : super(id: id, isCompleted: isCompleted);

  final String? title;
  final String? content;
}

@MappableClass(discriminatorValue: 'video')
class VideoLesson extends Lesson with VideoLessonMappable {
  const VideoLesson({
    required String id,
    required this.title,
    required this.filePath,
    required this.isHorizontal,
    required bool? isCompleted,
  }) : super(
          id: id,
          isCompleted: isCompleted,
        );

  final String? title;
  final String? filePath;
  final bool? isHorizontal;
}
