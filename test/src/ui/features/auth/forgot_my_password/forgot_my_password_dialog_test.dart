import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/forgot_my_password_dialog.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_state.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_in_progress_text_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../mocks.dart';

void main() {
  late MockForgotMyPasswordCubit mockCubit;

  setUp(() {
    mockCubit = MockForgotMyPasswordCubit();

    // Default state
    when(() => mockCubit.state).thenReturn(const ForgotMyPasswordState());
    when(() => mockCubit.stream)
        .thenAnswer((_) => Stream.value(const ForgotMyPasswordState()));
  });

  Widget createSubject({ForgotMyPasswordState? state}) {
    if (state != null) {
      when(() => mockCubit.state).thenReturn(state);
      when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));
    }

    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: BlocProvider<ForgotMyPasswordCubit>.value(
          value: mockCubit,
          child: const ForgotMyPasswordView(),
        ),
      ),
    );
  }

  group('ForgotMyPasswordView', () {
    testWidgets('renders initial state correctly', (tester) async {
      // Arrange
      final widget = createSubject();

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.text('Forgot My Password'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);

      // No error messages initially
      expect(find.text('Please enter your email'), findsNothing);
      expect(find.text('Please enter a valid email'), findsNothing);
    });

    testWidgets('shows error for empty email', (tester) async {
      // Arrange
      final stateWithError = const ForgotMyPasswordState().copyWith(
        email: const EmailFieldState.validated(''),
      );

      final widget = createSubject(state: stateWithError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.text('Your email cannot be empty.'), findsOneWidget);
    });

    testWidgets('shows error for invalid email', (tester) async {
      // Arrange
      final stateWithError = const ForgotMyPasswordState().copyWith(
        email: const EmailFieldState.validated('asas'),
      );

      final widget = createSubject(state: stateWithError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.text('This email is not valid.'), findsOneWidget);
    });

    testWidgets('calls onEmailChanged when typing email', (tester) async {
      // Arrange
      final widget = createSubject();

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Type in the email field
      await tester.enterText(find.byType(TextField), 'test@example.com');

      // Assert
      verify(() => mockCubit.onEmailChanged('test@example.com')).called(1);
    });

    testWidgets('shows loading state during submission', (tester) async {
      // Arrange
      final submittingState = const ForgotMyPasswordState().copyWith(
        submissionStatus: SubmissionStatus.inProgress,
      );

      final widget = createSubject(state: submittingState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      // Confirm progress button is shown
      expect(find.byType(KnotInProgressTextButton), findsOneWidget);

      // Email field should be disabled
      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);

      // Cancel button should be disabled
      final cancelButton =
          tester.widget<TextButton>(find.widgetWithText(TextButton, 'Cancel'));
      expect(cancelButton.onPressed, isNull);
    });

    testWidgets('shows unknown error message', (tester) async {
      // Arrange
      final stateWithError = const ForgotMyPasswordState().copyWith(
        submissionStatus: SubmissionStatus.unknownError,
      );

      final widget = createSubject(state: stateWithError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
          find.text(
              'An error occurred. Please check your internet connection.'),
          findsOneWidget);
    });

    testWidgets('shows no internet error message', (tester) async {
      // Arrange
      final stateWithError = const ForgotMyPasswordState().copyWith(
        submissionStatus: SubmissionStatus.noInternetError,
      );

      final widget = createSubject(state: stateWithError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
          find.text(
              'An error occurred. Please check your internet connection.'),
          findsOneWidget);
    });
  });
}
