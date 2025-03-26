import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_state.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/widgets/text_lesson_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

@RoutePage()
class TextLessonScreen extends StatelessWidget implements AutoRouteWrapper {
  const TextLessonScreen({
    super.key,
    required this.lessonId,
  });
  final String lessonId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => TextLessonCubit(
        lessonId: lessonId,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextLessonCubit, TextLessonState>(
      builder: (context, state) {
        final appBarTitle =
            (state is TextLessonLoaded) ? state.lesson.title : null;
        return Scaffold(
          backgroundColor: KnotSemanticColors.textLessonScreenBackground,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: KnotSemanticColors.textLessonScreenBackground,
                leading: BackButton(
                  color: KnotCoreColors.darkGrey,
                ),
                centerTitle: true,
                title: (appBarTitle != null)
                    ? Text(
                        appBarTitle,
                        textWidthBasis: TextWidthBasis.longestLine,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )
                    : null,
                titleTextStyle: KnotSemanticTextStyles.textLessonTitle,
                actions: [
                  SizedBox(
                    width: 48,
                    height: 48,
                  ),
                ],
              ),
              switch (state) {
                TextLessonLoading _ => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: KnotProgressIndicator(),
                  ),
                TextLessonFailed _ => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        context.l10n.textLessonScreenFailedMessage,
                      ),
                    ),
                  ),
                TextLessonLoaded state => SliverToBoxAdapter(
                    child: TextLessonLoadedView(
                      lessonContent: state.lesson.lessonContent,
                    ),
                  ),
              },
            ],
          ),
        );
      },
    );
  }
}
