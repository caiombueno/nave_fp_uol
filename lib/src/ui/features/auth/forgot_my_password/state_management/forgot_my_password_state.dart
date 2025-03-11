import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';

part 'generated/forgot_my_password_state.mapper.dart';

@MappableClass()
class ForgotMyPasswordState with ForgotMyPasswordStateMappable {
  const ForgotMyPasswordState({
    this.email = const EmailFieldState.unvalidated(),
    this.submissionStatus = SubmissionStatus.idle,
  });

  final EmailFieldState email;
  final SubmissionStatus submissionStatus;
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  unknownError,
  noInternetError,
}
