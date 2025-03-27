import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';

import 'package:nave_fp_uol/src/ui/features/kanban_board/kanban_board_screen.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MockKanbanBoardCubit extends Mock implements KanbanBoardCubit {}

void main() {
  late MockKanbanBoardCubit mockCubit;

  setUp(() {
    mockCubit = MockKanbanBoardCubit();

    registerFallbackValue(TaskStatus.toDo);

    // Default state and behaviors
    when(() => mockCubit.state).thenReturn(const KanbanBoardLoading());
    when(() => mockCubit.stream)
        .thenAnswer((_) => Stream.value(const KanbanBoardLoading()));
  });

  Widget createSubject({required KanbanBoardState state}) {
    when(() => mockCubit.state).thenReturn(state);
    when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));

    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<KanbanBoardCubit>.value(
        value: mockCubit,
        child: const KanbanBoardScreen(),
      ),
    );
  }

  group('KanbanBoardScreen', () {
    testWidgets('renders loading state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const KanbanBoardLoading());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KnotProgressIndicator), findsOneWidget);
      expect(find.byType(KanbanBoard), findsNothing);
    });

    testWidgets('renders error state correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const KanbanBoardFailed());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
          find.text(
              'An error occurred while loading the board. Please try again later.'),
          findsOneWidget);
      expect(find.byType(KnotProgressIndicator), findsNothing);
      expect(find.byType(KanbanBoard), findsNothing);
    });

    testWidgets('renders loaded state with empty lists correctly',
        (tester) async {
      // Arrange
      final loadedState = KanbanBoardLoaded(
        toDoTaskSummaryList: [],
        inProgressTaskSummaryList: [],
        doneTaskSummaryList: [],
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KanbanBoard), findsOneWidget);
      expect(find.text('To Do'), findsOneWidget);
      expect(find.text('In Progress'), findsOneWidget);
    });

    testWidgets('renders loaded state with tasks correctly', (tester) async {
      // Arrange
      final loadedState = KanbanBoardLoaded(
        toDoTaskSummaryList: [
          SystemTaskSummaryVM(
            id: '1',
            title: 'Task 1',
            index: 0,
            defaultSortKey: null,
            selectedSortKey: null,
            blockingTaskTitles: null,
            isLockedByPayment: null,
          ),
        ],
        inProgressTaskSummaryList: [
          SystemTaskSummaryVM(
            id: '2',
            title: 'Task 2',
            index: 0,
            defaultSortKey: null,
            selectedSortKey: null,
            blockingTaskTitles: null,
            isLockedByPayment: null,
          ),
        ],
        doneTaskSummaryList: [
          SystemTaskSummaryVM(
            id: '3',
            title: 'Task 3',
            index: 0,
            defaultSortKey: null,
            selectedSortKey: null,
            blockingTaskTitles: null,
            isLockedByPayment: null,
          ),
        ],
      );

      final widget = createSubject(state: loadedState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(KanbanBoard), findsOneWidget);
      expect(find.text('Task 1'), findsOneWidget);
      expect(find.text('Task 2'), findsOneWidget);
    });
  });
}
