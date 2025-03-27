import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/sign_in_screen.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_state.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_expanded_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../mocks.dart';

void main() {
  late MockSignInCubit mockCubit;

  setUp(() {
    mockCubit = MockSignInCubit();

    // Register fallback values for mocktail
    registerFallbackValue(const RouteSettings());

    // Default state
    when(() => mockCubit.state).thenReturn(const SignInState());
    when(() => mockCubit.stream)
        .thenAnswer((_) => Stream.value(const SignInState()));
  });

  Widget createSubject({required SignInState state}) {
    when(() => mockCubit.state).thenReturn(state);
    when(() => mockCubit.stream).thenAnswer((_) => Stream.value(state));

    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<SignInCubit>.value(
        value: mockCubit,
        child: const SignInScreen(),
      ),
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
    );
  }

  group('SignInScreen', () {
    testWidgets('renders initial form correctly', (tester) async {
      // Arrange
      final widget = createSubject(state: const SignInState());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(TextButton), findsNWidgets(2));
      expect(find.byType(KnotExpandedElevatedButton), findsOneWidget);

      // Check for email and password fields
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);

      // Check for "Forgot my password" button
      expect(find.text('Forgot my password'), findsOneWidget);

      // Check for "Sign In" button
      expect(find.text('Sign In'), findsWidgets);
    });

    testWidgets('shows email validation errors', (tester) async {
      // Arrange - state with email error
      final stateWithEmailError = const SignInState().copyWith(
        emailField: EmailFieldState.validated('asfasf'),
      );

      final widget = createSubject(state: stateWithEmailError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(find.text('This email is not valid.'), findsOneWidget);
    });

    testWidgets('shows password validation errors', (tester) async {
      // Arrange - state with password error
      final stateWithPasswordError = const SignInState().copyWith(
        passwordField: PasswordFieldState.validated('a'),
      );

      final widget = createSubject(state: stateWithPasswordError);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      expect(
        find.text('Your password must have at least five characters.'),
        findsOneWidget,
      );
    });

    testWidgets('calls onEmailChanged when email is typed', (tester) async {
      // Arrange
      final widget = createSubject(state: const SignInState());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Find the email field and enter text
      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'test@example.com');

      // Assert
      verify(() => mockCubit.onEmailChanged('test@example.com')).called(1);
    });

    testWidgets('calls onPasswordChanged when password is typed',
        (tester) async {
      // Arrange
      final widget = createSubject(state: const SignInState());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Find the password field and enter text
      final passwordField = find.byType(TextField).at(1);
      await tester.enterText(passwordField, 'password123');

      // Assert
      verify(() => mockCubit.onPasswordChanged('password123')).called(1);
    });

    testWidgets('calls onSubmit when sign in button is tapped', (tester) async {
      // Arrange
      final widget = createSubject(state: const SignInState());

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Find and tap the sign in button
      final signInButton = find.byType(KnotExpandedElevatedButton);
      await tester.tap(signInButton);

      // Assert
      verify(() => mockCubit.onSubmit()).called(1);
    });

    testWidgets('shows loading state during submission', (tester) async {
      // Arrange - state with submission in progress
      final submittingState = const SignInState().copyWith(
        submissionStatus: SubmissionStatus.inProgress,
      );

      final widget = createSubject(state: submittingState);

      // Act
      await tester.pumpWidget(widget);
      await tester.pump();

      // Assert
      // Fields should be disabled
      final emailField = tester.widget<TextField>(find.byType(TextField).first);
      expect(emailField.decoration?.enabled, isFalse);

      final passwordField =
          tester.widget<TextField>(find.byType(TextField).at(1));
      expect(passwordField.decoration?.enabled, isFalse);

      // Button should be in progress state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
