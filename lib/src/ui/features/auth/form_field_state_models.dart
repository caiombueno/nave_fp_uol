import 'package:formz/formz.dart';

class EmailFieldState extends FormzInput<String, EmailValidationError> {
  const EmailFieldState.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const EmailFieldState.validated(
    String value,
  ) : super.dirty(value);

  static final _emailRegex = RegExp(
    '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
    '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
    '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
    ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
  );

  @override
  EmailValidationError? validator(String value) {
    return value.isEmpty
        ? EmailValidationError.empty
        : (_emailRegex.hasMatch(value) ? null : EmailValidationError.invalid);
  }
}

enum EmailValidationError {
  empty,
  invalid,
  alreadyRegistered,
}

class PasswordFieldState extends FormzInput<String, PasswordValidationError> {
  const PasswordFieldState.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const PasswordFieldState.validated([
    String value = '',
  ]) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 5 || value.length > 120) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum PasswordValidationError {
  empty,
  invalid,
}
