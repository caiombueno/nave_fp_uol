import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/service_locator.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_state.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';

class ForgotMyPasswordCubit extends Cubit<ForgotMyPasswordState> {
  ForgotMyPasswordCubit()
      : super(
          const ForgotMyPasswordState(),
        );

  final UserRepository _userRepository = sl<UserRepository>();
  final ErrorReporter _errorReporter = sl<ErrorReporter>();

  void onEmailChanged(String newValue) {
    final previousEmailFieldState = state.email;
    final shouldValidate = !previousEmailFieldState.isPure;
    final newState = state.copyWith(
      email: shouldValidate
          ? EmailFieldState.validated(
              newValue,
            )
          : EmailFieldState.unvalidated(
              newValue,
            ),
    );

    emit(newState);
  }

  void onEmailUnfocused() {
    final newState = state.copyWith(
      email: EmailFieldState.validated(
        state.email.value,
      ),
    );
    emit(newState);
  }

  void onSubmit() async {
    final email = EmailFieldState.validated(
      state.email.value,
    );
    final newState = state.copyWith(
      email: email,
      submissionStatus: email.isValid ? SubmissionStatus.inProgress : null,
    );
    emit(newState);
    if (email.isValid) {
      final requestEither = await _userRepository.sendPasswordResetEmail(
        email.value,
      );

      requestEither.fold((failure) {
        _errorReporter.reportFailure(failure);

        final newState = state.copyWith(
          submissionStatus: switch (failure) {
            NoInternetFailure() => SubmissionStatus.noInternetError,
            _ => SubmissionStatus.unknownError,
          },
        );
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
