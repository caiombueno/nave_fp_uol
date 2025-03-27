import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';

void main() {
  group('EmailFieldState', () {
    test('returns empty error when email is empty', () {
      // Arrange
      const email = EmailFieldState.validated('');

      // Act - validation happens during construction

      // Assert
      expect(email.error, EmailValidationError.empty);
      expect(email.isValid, false);
    });

    test('returns invalid error when email format is invalid', () {
      // Arrange
      const email = EmailFieldState.validated('invalid_email');

      // Act - validation happens during construction

      // Assert
      expect(email.error, EmailValidationError.invalid);
      expect(email.isValid, false);
    });

    test('returns null when email is valid', () {
      // Arrange
      const email = EmailFieldState.validated('test@example.com');

      // Act - validation happens during construction

      // Assert
      expect(email.error, isNull);
      expect(email.isValid, true);
    });

    test('returns valid for various correct email formats', () {
      // Arrange
      final validEmails = [
        'simple@example.com',
        'very.common@example.com',
        'other.email-with-hyphen@example.com',
        'fully-qualified-domain@example.com',
        'x@example.com',
        'example-indeed@strange-example.com',
      ];

      for (final email in validEmails) {
        // Act
        final field = EmailFieldState.validated(email);

        // Assert
        expect(field.isValid, true, reason: '$email should be valid');
      }
    });

    test('unvalidated email has pure status', () {
      // Arrange
      const email = EmailFieldState.unvalidated('test@example.com');

      // Act - pure/validation state is set during construction

      // Assert
      expect(email.isPure, true);
      expect(email.isNotValid, false);
    });

    test('validated email validation status', () {
      // Arrange
      const email = EmailFieldState.validated('test@example.com');

      // Act - validation state is set during construction

      // Assert
      expect(email.isPure, false);
      expect(email.isNotValid, false);
    });
  });

  group('PasswordFieldState', () {
    test('returns empty error when password is empty', () {
      // Arrange
      const password = PasswordFieldState.validated('');

      // Act - validation happens during construction

      // Assert
      expect(password.error, PasswordValidationError.empty);
      expect(password.isValid, false);
    });

    test('returns invalid error when password is too short', () {
      // Arrange
      const password = PasswordFieldState.validated('1234');

      // Act - validation happens during construction

      // Assert
      expect(password.error, PasswordValidationError.invalid);
      expect(password.isValid, false);
    });

    test('returns invalid error when password is too long', () {
      // Arrange
      final longPassword = 'x' * 121;

      // Act
      final password = PasswordFieldState.validated(longPassword);

      // Assert
      expect(password.error, PasswordValidationError.invalid);
      expect(password.isValid, false);
    });

    test('returns null when password is valid', () {
      // Arrange
      const password = PasswordFieldState.validated('validpassword');

      // Act - validation happens during construction

      // Assert
      expect(password.error, isNull);
      expect(password.isValid, true);
    });

    test('validates passwords on the boundary conditions', () {
      // Arrange & Act - minimum valid length (5 characters)
      final minPassword = PasswordFieldState.validated('12345');

      // Assert
      expect(minPassword.isValid, true);

      // Arrange & Act - maximum valid length (120 characters)
      final maxPassword = PasswordFieldState.validated('x' * 120);

      // Assert
      expect(maxPassword.isValid, true);
    });

    test('unvalidated password has pure status', () {
      // Arrange
      const password = PasswordFieldState.unvalidated('password123');

      // Act - pure state is set during construction

      // Assert
      expect(password.isPure, true);
      expect(password.isNotValid, false);
    });

    test('validated password validation status', () {
      // Arrange
      const password = PasswordFieldState.validated('password123');

      // Act - validation state is set during construction

      // Assert
      expect(password.isPure, false);
      expect(password.isNotValid, false);
    });
  });

  group('Form integration', () {
    test('form is valid when all fields are valid', () {
      // Arrange
      const email = EmailFieldState.validated('test@example.com');
      const password = PasswordFieldState.validated('password123');

      // Act & Assert
      expect(Formz.validate([email, password]), true);
    });

    test('form is invalid when any field is invalid', () {
      // Arrange - Valid email, invalid password
      const email1 = EmailFieldState.validated('test@example.com');
      const password1 = PasswordFieldState.validated('');

      // Act & Assert
      expect(Formz.validate([email1, password1]), false);

      // Arrange - Invalid email, valid password
      const email2 = EmailFieldState.validated('invalid-email');
      const password2 = PasswordFieldState.validated('password123');

      // Act & Assert
      expect(Formz.validate([email2, password2]), false);

      // Arrange - Both invalid
      const email3 = EmailFieldState.validated('');
      const password3 = PasswordFieldState.validated('');

      // Act & Assert
      expect(Formz.validate([email3, password3]), false);
    });
  });
}
