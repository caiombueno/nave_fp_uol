import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/domain_models/lesson.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_state.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

part 'text_lesson_mappers.dart';

class TextLessonCubit extends Cubit<TextLessonState> {
  TextLessonCubit({
    required String lessonId,
  }) : super(const TextLessonLoading()) {
    _lessonSubscription = _taskRepository.watchLesson(lessonId).listen(
      (lessonEither) {
        emit(
          lessonEither.fold(
            (failure) => const TextLessonFailed(),
            (lesson) {
              if (lesson is! TextLesson) return const TextLessonFailed();

              final lessonVM = lesson.toTextLessonVMOrNull();

              if (lessonVM == null) return const TextLessonFailed();

              return TextLessonLoaded(lesson: lessonVM);
            },
          ),
        );
      },
    );
  }

  late final StreamSubscription _lessonSubscription;

  final _taskRepository = sl<TaskRepository>();

  @override
  Future<void> close() {
    _lessonSubscription.cancel();
    return super.close();
  }
}
