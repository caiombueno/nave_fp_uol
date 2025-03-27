import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_state.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/video_lesson_screen.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/widgets/video_lesson_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../mocks.dart';

void main() {
  late MockVideoLessonCubit mockCubit;

  setUp(() async {
    mockCubit = MockVideoLessonCubit();

    // Default expectations
    when(() => mockCubit.state).thenReturn(const VideoLessonLoading());
    when(() => mockCubit.stream)
        .thenAnswer((_) => Stream.fromIterable([const VideoLessonLoading()]));
  });

  Widget createSubject({required VideoLessonState state}) {
    when(() => mockCubit.state).thenReturn(state);

    when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));

    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<VideoLessonCubit>.value(
        value: mockCubit,
        child: const VideoLessonScreen(lessonId: 'test-video-lesson'),
      ),
    );
  }

  group('VideoLessonScreen', () {
    testWidgets('renders loading state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const VideoLessonLoading());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KnotProgressIndicator), findsOneWidget);
      expect(find.byType(VideoLessonLoadedView), findsNothing);
      expect(
          find.text(
              'An error occurred while loading the video lesson. Please try again later.'),
          findsNothing);
    });

    testWidgets('renders failed state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const VideoLessonFailed());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
          find.text(
              'An error occurred while loading the lesson. Please try again later.'),
          findsOneWidget);

      // Verify text style and alignment
      final textWidget = tester.widget<Text>(find.text(
          'An error occurred while loading the lesson. Please try again later.'));
      expect(textWidget.textAlign, TextAlign.center);

      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(find.byType(VideoLessonLoadedView), findsNothing);
    });

    testWidgets('has an AppBar with a back button', (tester) async {
      // Arrange
      final widget = createSubject(state: const VideoLessonLoading());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(BackButton), findsOneWidget);
    });
  });
}
