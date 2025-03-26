import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;

part 'generated/text_lesson_state.mapper.dart';

@MappableClass()
sealed class TextLessonState with TextLessonStateMappable {
  const TextLessonState();
}

@MappableClass()
final class TextLessonLoading extends TextLessonState
    with TextLessonLoadingMappable {
  const TextLessonLoading();
}

@MappableClass()
final class TextLessonLoaded extends TextLessonState
    with TextLessonLoadedMappable {
  const TextLessonLoaded({
    required this.lesson,
  });
  final TextLessonVM lesson;
}

@MappableClass()
final class TextLessonFailed extends TextLessonState
    with TextLessonFailedMappable {
  const TextLessonFailed();
}

@MappableClass()
final class TextLessonVM with TextLessonVMMappable {
  const TextLessonVM({
    required this.title,
    required this.lessonContent,
  });
  final String? title;
  final quill.Delta lessonContent;
}
