import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_state.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';

import '../../../../../../mocks.dart';

void main() {
  late ForgotMyPasswordCubit forgotPasswordCubit;
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

    forgotPasswordCubit = ForgotMyPasswordCubit();
  });

  tearDown(() {
    forgotPasswordCubit.close();
    sl.reset();
  });

  group('ForgotMyPasswordCubit', () {
    test('initial state is correct', () {
      expect(forgotPasswordCubit.state, const ForgotMyPasswordState());
    });

    group('onEmailChanged', () {
      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'emits state with unvalidated email when field is pure',
        build: () => forgotPasswordCubit,
        act: (cubit) => cubit.onEmailChanged('test@example.com'),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.unvalidated('test@example.com'),
          ),
        ],
      );

      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'emits state with validated email when field is already dirty',
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.validated('old@example.com'),
        ),
        act: (cubit) => cubit.onEmailChanged('test@example.com'),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
          ),
        ],
      );
    });

    group('onEmailUnfocused', () {
      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'emits state with validated email when unfocused',
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.unvalidated('test@example.com'),
        ),
        act: (cubit) => cubit.onEmailUnfocused(),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
          ),
        ],
      );
    });

    group('onSubmit', () {
      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'validates email and does not proceed with invalid email',
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.unvalidated('invalid-email'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('invalid-email'),
            // No change to submission status since email is invalid
          ),
        ],
        verify: (_) {
          verifyNever(() => mockUserRepository.sendPasswordResetEmail(any()));
          verifyNever(() => mockErrorReporter.reportFailure(any()));
        },
      );

      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'submits valid email and handles success',
        setUp: () {
          when(() => mockUserRepository.sendPasswordResetEmail(any()))
              .thenAnswer((_) async => const Right(unit));
        },
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.unvalidated('test@example.com'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.success,
          ),
        ],
        verify: (_) {
          verify(() =>
                  mockUserRepository.sendPasswordResetEmail('test@example.com'))
              .called(1);
          verifyNever(() => mockErrorReporter.reportFailure(any()));
        },
      );

      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'handles NoInternetFailure correctly',
        setUp: () {
          const failure = NoInternetFailure();
          when(() =>
                  mockUserRepository.sendPasswordResetEmail('test@example.com'))
              .thenAnswer((_) async => Left(failure));
          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.validated('test@example.com'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.noInternetError,
          ),
        ],
        verify: (_) {
          verify(() =>
                  mockUserRepository.sendPasswordResetEmail('test@example.com'))
              .called(1);
          verify(() => mockErrorReporter.reportFailure(any())).called(1);
        },
      );

      blocTest<ForgotMyPasswordCubit, ForgotMyPasswordState>(
        'handles unknown failures correctly',
        setUp: () {
          final failure =
              UnknownFailure(underlyingException: Exception('Some error'));
          when(() =>
                  mockUserRepository.sendPasswordResetEmail('test@example.com'))
              .thenAnswer((_) async => Left(failure));
          when(() => mockErrorReporter.reportFailure(any()))
              .thenAnswer((_) => Future.value());
        },
        build: () => forgotPasswordCubit,
        seed: () => const ForgotMyPasswordState(
          email: EmailFieldState.validated('test@example.com'),
        ),
        act: (cubit) => cubit.onSubmit(),
        expect: () => [
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.inProgress,
          ),
          const ForgotMyPasswordState(
            email: EmailFieldState.validated('test@example.com'),
            submissionStatus: SubmissionStatus.unknownError,
          ),
        ],
        verify: (_) {
          verify(() =>
                  mockUserRepository.sendPasswordResetEmail('test@example.com'))
              .called(1);
          verify(() => mockErrorReporter.reportFailure(any())).called(1);
        },
      );
    });
  });
}
