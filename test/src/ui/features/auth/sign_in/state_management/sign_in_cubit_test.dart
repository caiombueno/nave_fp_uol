import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_state.dart';

import 'package:nave_fp_uol/src/services/error_reporter.dart';

import '../../../../../../mocks.dart';

void main() {
  late SignInCubit signInCubit;
  late MockUserRepository mockUserRepository;
  late MockErrorReporter mockErrorReporter;

  setUpAll(() {
    registerFallbackValue(UnknownFailure(underlyingException: Exception()));
  });

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockErrorReporter = MockErrorReporter();

    sl.registerSingleton<UserRepository>(mockUserRepository);
    sl.registerSingleton<ErrorReporter>(mockErrorReporter);

    signInCubit = SignInCubit();
  });

  tearDown(() {
    signInCubit.close();
    sl.reset();
  });

  group('SignInCubit', () {
    test('initial state is correct', () {
      // Assert
      expect(signInCubit.state, const SignInState());
    });

    group('onEmailChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits state with unvalidated email when field is pure',
        build: () => signInCubit,
        act: (cubit) => cubit.onEmailChanged('test@example.com'),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.unvalidated('test@example.com'),
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits state with validated email when field is already dirty',
        build: () => signInCubit,
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('old@example.com'),
        ),
        act: (cubit) => cubit.onEmailChanged('test@example.com'),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
          ),
        ],
      );
    });

    group('onEmailUnfocused', () {
      blocTest<SignInCubit, SignInState>(
        'emits state with validated email when unfocused',
        build: () => signInCubit,
        seed: () => const SignInState(
          emailField: EmailFieldState.unvalidated('test@example.com'),
        ),
        act: (cubit) => cubit.onEmailUnfocused(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
          ),
        ],
      );
    });

    group('onPasswordChanged', () {
      blocTest<SignInCubit, SignInState>(
        'emits state with unvalidated password when field is pure',
        build: () => signInCubit,
        act: (cubit) => cubit.onPasswordChanged('password123'),
        expect: () => [
          const SignInState(
            passwordField: PasswordFieldState.unvalidated('password123'),
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'emits state with validated password when field is already dirty',
        build: () => signInCubit,
        seed: () => const SignInState(
          passwordField: PasswordFieldState.validated('oldpassword'),
        ),
        act: (cubit) => cubit.onPasswordChanged('password123'),
        expect: () => [
          const SignInState(
            passwordField: PasswordFieldState.validated('password123'),
          ),
        ],
      );
    });

    group('onPasswordUnfocused', () {
      blocTest<SignInCubit, SignInState>(
        'emits state with validated password when unfocused',
        build: () => signInCubit,
        seed: () => const SignInState(
          passwordField: PasswordFieldState.unvalidated('password123'),
        ),
        act: (cubit) => cubit.onPasswordUnfocused(),
        expect: () => [
          const SignInState(
            passwordField: PasswordFieldState.validated('password123'),
          ),
        ],
      );
    });

    group('onSubmit', () {
      blocTest<SignInCubit, SignInState>(
        'validates both fields and does not proceed with invalid form',
        build: () => signInCubit,
        seed: () => const SignInState(
          emailField: EmailFieldState.unvalidated('invalid-email'),
          passwordField: PasswordFieldState.unvalidated('pass'), // Too short
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('invalid-email'),
            passwordField: PasswordFieldState.validated('pass'),
            // No change to submission status since form is invalid
          ),
        ],
        verify: (_) {
          verifyNever(() => mockUserRepository.signInWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              ));
          verifyNever(() => mockErrorReporter.reportFailure(any()));
        },
      );

      blocTest<SignInCubit, SignInState>(
        'submits valid form and handles success',
        setUp: () {
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => const Right(unit));
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.unvalidated('test@example.com'),
          passwordField: PasswordFieldState.unvalidated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.success,
          ),
        ],
        verify: (_) {
          verify(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).called(1);
          verifyNever(() => mockErrorReporter.reportFailure(any()));
        },
      );

      blocTest<SignInCubit, SignInState>(
        'handles InvalidCredentialsFailure correctly',
        setUp: () {
          const failure = InvalidCredentialsFailure();
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).thenAnswer((_) async => Left(failure));

          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('test@example.com'),
          passwordField: PasswordFieldState.validated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.invalidCredentialsError,
          ),
        ],
        verify: (_) {
          verify(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).called(1);
          verify(() => mockErrorReporter.reportFailure(any())).called(1);
        },
      );

      blocTest<SignInCubit, SignInState>(
        'handles DisabledUserFailure correctly',
        setUp: () {
          const failure = DisabledUserFailure();
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).thenAnswer((_) async => Left(failure));
          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('test@example.com'),
          passwordField: PasswordFieldState.validated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.disabledUserError,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'handles TooManySignInAttemptsFailure correctly',
        setUp: () {
          const failure = TooManySignInAttemptsFailure();
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).thenAnswer((_) async => Left(failure));

          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('test@example.com'),
          passwordField: PasswordFieldState.validated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.tooManyAttemptsError,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'handles NoInternetFailure correctly',
        setUp: () {
          const failure = NoInternetFailure();
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).thenAnswer((_) async => Left(failure));

          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('test@example.com'),
          passwordField: PasswordFieldState.validated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.noInternetError,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'handles unknown failures correctly',
        setUp: () {
          final failure = UnknownFailure(
            underlyingException: Exception('Some error'),
          );
          when(() => mockUserRepository.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              )).thenAnswer((_) async => Left(failure));

          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () {
          return signInCubit;
        },
        seed: () => const SignInState(
          emailField: EmailFieldState.validated('test@example.com'),
          passwordField: PasswordFieldState.validated('password123'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const SignInState(
            emailField: EmailFieldState.validated('test@example.com'),
            passwordField: PasswordFieldState.validated('password123'),
            submissionStatus: SubmissionStatus.unknownError,
          ),
        ],
      );
    });
  });
}
