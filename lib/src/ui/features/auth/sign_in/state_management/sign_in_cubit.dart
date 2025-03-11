import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nave_fp_uol/src/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit()
      : super(
          const SignInState(),
        );

  final UserRepository _userRepository = sl<UserRepository>();
  final ErrorReporter _errorReporter = sl<ErrorReporter>();

  void onEmailChanged(String newValue) {
    final previousScreenState = state;
    final previousEmailFieldState = previousScreenState.emailField;
    final shouldValidate = !previousEmailFieldState.isPure;
    final newEmailFieldState = shouldValidate
        ? EmailFieldState.validated(
            newValue,
          )
        : EmailFieldState.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      emailField: newEmailFieldState,
    );

    emit(newScreenState);
  }

  void onEmailUnfocused() {
    final previousScreenState = state;
    final previousEmailFieldState = previousScreenState.emailField;
    final previousEmailFieldValue = previousEmailFieldState.value;

    final newEmailFieldState = EmailFieldState.validated(
      previousEmailFieldValue,
    );

    final newScreenState = previousScreenState.copyWith(
      emailField: newEmailFieldState,
    );

    emit(newScreenState);
  }

  void onPasswordChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordFieldState = previousScreenState.passwordField;
    final shouldValidate = !previousPasswordFieldState.isPure;
    final newPasswordFieldState = shouldValidate
        ? PasswordFieldState.validated(
            newValue,
          )
        : PasswordFieldState.unvalidated(
            newValue,
          );

    final newScreenState = state.copyWith(
      passwordField: newPasswordFieldState,
    );

    emit(newScreenState);
  }

  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordFieldState = previousScreenState.passwordField;
    final previousPasswordFieldValue = previousPasswordFieldState.value;

    final newPasswordFieldState = PasswordFieldState.validated(
      previousPasswordFieldValue,
    );

    final newScreenState = previousScreenState.copyWith(
      passwordField: newPasswordFieldState,
    );
    emit(newScreenState);
  }

  void onSubmit() async {
    final emailField = EmailFieldState.validated(state.emailField.value);
    final passwordField =
        PasswordFieldState.validated(state.passwordField.value);

    final isFormValid = Formz.validate([
      emailField,
      passwordField,
    ]);

    final newState = state.copyWith(
      emailField: emailField,
      passwordField: passwordField,
      submissionStatus: isFormValid ? SubmissionStatus.inProgress : null,
    );

    emit(newState);

    if (isFormValid) {
      final signInEither = await _userRepository.signInWithEmailAndPassword(
        email: emailField.value,
        password: passwordField.value,
      );

      signInEither.fold((failure) {
        _errorReporter.reportFailure(failure);

        final newState = state.copyWith(
            submissionStatus: switch (failure) {
          InvalidCredentialsFailure() =>
            SubmissionStatus.invalidCredentialsError,
          DisabledUserFailure() => SubmissionStatus.disabledUserError,
          TooManySignInAttemptsFailure() =>
            SubmissionStatus.tooManyAttemptsError,
          NoInternetFailure() => SubmissionStatus.noInternetError,
          _ => SubmissionStatus.unknownError,
        });

        emit(newState);
      }, (_) {
        final newState = state.copyWith(
          submissionStatus: SubmissionStatus.success,
        );

        emit(newState);
      });
    }
  }
}
