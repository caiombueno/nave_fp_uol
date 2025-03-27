import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/state_management/text_lesson_state.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/text_lesson_screen.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/text_lesson/widgets/text_lesson_loaded_view.dart';

import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';

class MockTextLessonCubit extends Mock implements TextLessonCubit {}

void main() {
  late MockTextLessonCubit mockCubit;

  setUp(() {
    mockCubit = MockTextLessonCubit();

    // Register fallback values if needed for mocktail
    registerFallbackValue(const RouteSettings());
  });

  Widget createSubject({required TextLessonState state}) {
    when(() => mockCubit.state).thenReturn(state);
    when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));

    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<TextLessonCubit>.value(
        value: mockCubit,
        child: const TextLessonScreen(lessonId: 'lesson-123'),
      ),
    );
  }

  group('TextLessonScreen', () {
    testWidgets('renders loading state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const TextLessonLoading());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KnotProgressIndicator), findsOneWidget);
      expect(find.byType(TextLessonLoadedView), findsNothing);

      // AppBar should not have a title in loading state
      final appBarTitle = find.descendant(
        of: find.byType(SliverAppBar),
        matching: find.byType(Text),
      );
      expect(appBarTitle, findsNothing);
    });

    testWidgets('renders failed state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const TextLessonFailed());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert - looking for the error message from localization
      expect(
        find.text(
          'An error occurred while loading the lesson. Please try again later.',
        ),
        findsOneWidget,
      );
      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(find.byType(TextLessonLoadedView), findsNothing);
    });

    testWidgets('renders loaded state correctly', (tester) async {
      // Arrange - create a mock loaded state with lesson data
      final mockLesson = TextLessonVM(
        title: 'Test Lesson Title',
        lessonContent: Delta(),
      );

      final loadedState = TextLessonLoaded(
        lesson: mockLesson,
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      // Verify the lesson title is displayed in the AppBar
      expect(find.text('Test Lesson Title'), findsOneWidget);

      // Verify TextLessonLoadedView is rendered
      expect(find.byType(TextLessonLoadedView), findsOneWidget);

      // Verify loading indicator and error message are not shown
      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(
        find.text(
          'An error occurred while loading the lesson. Please try again later.',
        ),
        findsNothing,
      );
    });

    testWidgets('title has correct styling and properties', (tester) async {
      // Arrange - create a long title to test multiple lines
      final mockLesson = TextLessonVM(
        title:
            'This is a very long title that should wrap to multiple lines to test text styling',
        lessonContent: Delta(),
      );

      final loadedState = TextLessonLoaded(
        lesson: mockLesson,
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      // Find the title Text widget
      final titleWidget = tester.widget<Text>(find.text(
        'This is a very long title that should wrap to multiple lines to test text styling',
      ));

      // Verify the title has the correct properties
      expect(titleWidget.textAlign, TextAlign.center);
      expect(titleWidget.maxLines, 2);
      expect(titleWidget.softWrap, true);
      expect(titleWidget.textWidthBasis, TextWidthBasis.longestLine);
    });

    testWidgets('CustomScrollView contains the correct slivers',
        (tester) async {
      // Arrange
      final mockLesson = TextLessonVM(
        title: 'Test Lesson Title',
        lessonContent: Delta(),
      );

      final loadedState = TextLessonLoaded(
        lesson: mockLesson,
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.byType(SliverAppBar), findsOneWidget);
      expect(find.byType(SliverToBoxAdapter), findsOneWidget);
    });
  });
}
