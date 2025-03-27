import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_state.dart';

void main() {
  group('ForgotMyPasswordState', () {
    test('initializes with default values', () {
      // Arrange & Act
      const forgotPasswordState = ForgotMyPasswordState();

      // Assert
      expect(forgotPasswordState.email, const EmailFieldState.unvalidated());
      expect(forgotPasswordState.submissionStatus, SubmissionStatus.idle);
    });

    test('initializes with custom email field', () {
      // Arrange
      const emailField = EmailFieldState.validated('test@example.com');

      // Act
      const forgotPasswordState = ForgotMyPasswordState(email: emailField);

      // Assert
      expect(forgotPasswordState.email, emailField);
      expect(forgotPasswordState.submissionStatus, SubmissionStatus.idle);
    });

    test('initializes with custom submission status', () {
      // Arrange
      const status = SubmissionStatus.inProgress;

      // Act
      const forgotPasswordState =
          ForgotMyPasswordState(submissionStatus: status);

      // Assert
      expect(forgotPasswordState.email, const EmailFieldState.unvalidated());
      expect(forgotPasswordState.submissionStatus, status);
    });

    test('initializes with all custom fields', () {
      // Arrange
      const emailField = EmailFieldState.validated('test@example.com');
      const status = SubmissionStatus.success;

      // Act
      const forgotPasswordState = ForgotMyPasswordState(
        email: emailField,
        submissionStatus: status,
      );

      // Assert
      expect(forgotPasswordState.email, emailField);
      expect(forgotPasswordState.submissionStatus, status);
    });
  });

  group('SubmissionStatus', () {
    test('contains all expected enum values', () {
      // Arrange & Act
      final values = SubmissionStatus.values;

      // Assert
      expect(values, contains(SubmissionStatus.idle));
      expect(values, contains(SubmissionStatus.inProgress));
      expect(values, contains(SubmissionStatus.success));
      expect(values, contains(SubmissionStatus.unknownError));
      expect(values, contains(SubmissionStatus.noInternetError));
      expect(values.length, 5); // Ensures no additional values were added
    });
  });
}
