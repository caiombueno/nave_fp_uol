import 'package:dart_mappable/dart_mappable.dart';

part 'generated/lesson_user_data_sm.mapper.dart';

@MappableClass()
class LessonUserDataSM with LessonUserDataSMMappable {
  const LessonUserDataSM({
    required this.lessonId,
    required this.isCompleted,
  });

  @MappableField(key: 'id')
  final String lessonId;
  final bool? isCompleted;
}
