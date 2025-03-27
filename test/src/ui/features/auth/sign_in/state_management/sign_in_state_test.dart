import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_state.dart';

void main() {
  group('SignInState', () {
    test('initializes with default values', () {
      // Arrange & Act
      const signInState = SignInState();

      // Assert
      expect(signInState.emailField, const EmailFieldState.unvalidated());
      expect(signInState.passwordField, const PasswordFieldState.unvalidated());
      expect(signInState.submissionStatus, SubmissionStatus.idle);
    });

    test('initializes with custom email field', () {
      // Arrange
      const emailField = EmailFieldState.validated('test@example.com');

      // Act
      const signInState = SignInState(emailField: emailField);

      // Assert
      expect(signInState.emailField, emailField);
      expect(signInState.passwordField, const PasswordFieldState.unvalidated());
      expect(signInState.submissionStatus, SubmissionStatus.idle);
    });

    test('initializes with custom password field', () {
      // Arrange
      const passwordField = PasswordFieldState.validated('password123');

      // Act
      const signInState = SignInState(passwordField: passwordField);

      // Assert
      expect(signInState.emailField, const EmailFieldState.unvalidated());
      expect(signInState.passwordField, passwordField);
      expect(signInState.submissionStatus, SubmissionStatus.idle);
    });

    test('initializes with custom submission status', () {
      // Arrange
      const status = SubmissionStatus.inProgress;

      // Act
      const signInState = SignInState(submissionStatus: status);

      // Assert
      expect(signInState.emailField, const EmailFieldState.unvalidated());
      expect(signInState.passwordField, const PasswordFieldState.unvalidated());
      expect(signInState.submissionStatus, status);
    });

    test('initializes with all custom fields', () {
      // Arrange
      const emailField = EmailFieldState.validated('test@example.com');
      const passwordField = PasswordFieldState.validated('password123');
      const status = SubmissionStatus.success;

      // Act
      const signInState = SignInState(
        emailField: emailField,
        passwordField: passwordField,
        submissionStatus: status,
      );

      // Assert
      expect(signInState.emailField, emailField);
      expect(signInState.passwordField, passwordField);
      expect(signInState.submissionStatus, status);
    });

    test('form validation status is correctly determined', () {
      // Arrange - valid form
      const validEmailField = EmailFieldState.validated('test@example.com');
      const validPasswordField = PasswordFieldState.validated('password123');
      const validState = SignInState(
        emailField: validEmailField,
        passwordField: validPasswordField,
      );

      // Arrange - invalid form (invalid email)
      const invalidEmailField = EmailFieldState.validated('invalid_email');
      const invalidEmailState = SignInState(
        emailField: invalidEmailField,
        passwordField: validPasswordField,
      );

      // Arrange - invalid form (invalid password)
      const invalidPasswordField = PasswordFieldState.validated('');
      const invalidPasswordState = SignInState(
        emailField: validEmailField,
        passwordField: invalidPasswordField,
      );

      // Act & Assert
      expect(Formz.validate([validState.emailField, validState.passwordField]),
          true);
      expect(
          Formz.validate(
              [invalidEmailState.emailField, invalidEmailState.passwordField]),
          false);
      expect(
          Formz.validate([
            invalidPasswordState.emailField,
            invalidPasswordState.passwordField
          ]),
          false);
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
      expect(values, contains(SubmissionStatus.invalidCredentialsError));
      expect(values, contains(SubmissionStatus.disabledUserError));
      expect(values, contains(SubmissionStatus.tooManyAttemptsError));
      expect(values, contains(SubmissionStatus.noInternetError));
      expect(values.length, 8); // Ensures no additional values were added
    });
  });
}
