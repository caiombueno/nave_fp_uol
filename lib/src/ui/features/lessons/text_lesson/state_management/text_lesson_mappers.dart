part of 'text_lesson_cubit.dart';

extension on TextLesson {
  TextLessonVM? toTextLessonVMOrNull() {
    final parsedContent = content?.toQuillDocumentOrNull();

    if (parsedContent == null) {
      return null;
    }

    return TextLessonVM(
      title: title,
      lessonContent: parsedContent,
    );
  }
}
