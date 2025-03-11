import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';

part 'generated/sign_in_state.mapper.dart';

@MappableClass()
class SignInState with SignInStateMappable {
  const SignInState({
    this.emailField = const EmailFieldState.unvalidated(),
    this.passwordField = const PasswordFieldState.unvalidated(),
    this.submissionStatus = SubmissionStatus.idle,
  });

  final EmailFieldState emailField;
  final PasswordFieldState passwordField;
  final SubmissionStatus submissionStatus;
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  unknownError,
  invalidCredentialsError,
  disabledUserError,
  tooManyAttemptsError,
  noInternetError,
}
