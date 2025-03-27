import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/task_details_screen.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';

import '../../../../mocks.dart';

void main() {
  late MockTaskDetailsCubit mockCubit;

  setUp(() {
    mockCubit = MockTaskDetailsCubit();

    // Register fallback values if needed for mocktail
    registerFallbackValue(const RouteSettings());
  });

  Widget createSubject({required TaskDetailsState state}) {
    when(() => mockCubit.state).thenReturn(state);
    when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));

    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      home: BlocProvider<TaskDetailsCubit>.value(
        value: mockCubit,
        child: const TaskDetailsScreen(taskId: 'task-123'),
      ),
    );
  }

  group('TaskDetailsScreen', () {
    testWidgets('renders loading state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const TaskDetailsLoading());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KnotProgressIndicator), findsOneWidget);
      expect(find.byType(TaskDetailsLoadedView), findsNothing);
      expect(find.text('Failed to load task details'), findsNothing);

      // AppBar should not have a title in loading state
      final appBarTitle = find.descendant(
        of: find.byType(AppBar),
        matching: find.byType(Text),
      );
      expect(appBarTitle, findsNothing);
    });

    testWidgets('renders failed state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const TaskDetailsFailed());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
          find.text(
              'An error occurred while loading the task details. Please try again later.'),
          findsOneWidget);
      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(find.byType(TaskDetailsLoadedView), findsNothing);
    });

    testWidgets('renders loaded state correctly', (tester) async {
      // Arrange - create a mock loaded state with task data
      final mockTask = TaskDetailsTaskVM(
        title: 'Test Task Title',
        descriptionContent: Delta(),
        isUserTask: false,
        lessons: [
          /* mock lesson data if needed */
        ],
        notes: [
          /* mock notes data if needed */
        ],
      );

      final loadedState = TaskDetailsLoaded(
        task: mockTask,
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      // Verify the task title is displayed in the AppBar
      expect(find.text('Test Task Title'), findsOneWidget);

      // Verify TaskDetailsLoadedView is rendered
      expect(find.byType(TaskDetailsLoadedView), findsOneWidget);

      // Verify loading indicator and error message are not shown
      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(find.text('Failed to load task details'), findsNothing);
    });
  });
}
