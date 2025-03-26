import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_state.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_font_sizes.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_in_progress_text_button.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

class ForgotMyPasswordDialog extends StatelessWidget {
  const ForgotMyPasswordDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotMyPasswordCubit>(
      create: (_) => ForgotMyPasswordCubit(),
      child: ForgotMyPasswordView(),
    );
  }
}

@visibleForTesting
class ForgotMyPasswordView extends StatefulWidget {
  const ForgotMyPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  _ForgotMyPasswordViewState createState() => _ForgotMyPasswordViewState();
}

class _ForgotMyPasswordViewState extends State<ForgotMyPasswordView> {
  final _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        final cubit = context.read<ForgotMyPasswordCubit>();
        cubit.onEmailUnfocused();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ForgotMyPasswordCubit, ForgotMyPasswordState>(
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  l10n.forgotMyPasswordEmailRequestSuccessMessage,
                ),
                duration: const Duration(
                  seconds: 8,
                ),
              ),
            );
          context.router.maybePop();
          return;
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotMyPasswordCubit>();
        final isSubmissionInProgress =
            state.submissionStatus == SubmissionStatus.inProgress;
        final emailError = state.email.displayError;
        return GestureDetector(
          onTap: () => _releaseFocus(context),
          child: AlertDialog(
            backgroundColor:
                KnotSemanticColors.forgotMyPasswordDialogBackground,
            title: Text(l10n.forgotMyPasswordDialogTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  focusNode: _emailFocusNode,
                  enabled: !isSubmissionInProgress,
                  onEditingComplete: cubit.onSubmit,
                  onChanged: cubit.onEmailChanged,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.alternate_email,
                    ),
                    enabled: !isSubmissionInProgress,
                    labelText: l10n.forgotMyPasswordEmailTextFieldLabel,
                    errorText: emailError == null
                        ? null
                        : (emailError == EmailValidationError.empty
                            ? l10n
                                .forgotMyPasswordEmailTextFieldEmptyErrorMessage
                            : l10n
                                .forgotMyPasswordEmailTextFieldInvalidErrorMessage),
                  ),
                ),
                if (state.submissionStatus == SubmissionStatus.unknownError ||
                    state.submissionStatus ==
                        SubmissionStatus.noInternetError) ...[
                  const SizedBox(
                    height: KnotCoreSpacings.medium,
                  ),
                  Text(
                    state.submissionStatus == SubmissionStatus.unknownError
                        ? l10n.forgotMyPasswordUnknownErrorMessage
                        : l10n.forgotMyPasswordNoInternetErrorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: KnotSemanticFontSizes.dialogErrorMessage,
                    ),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: isSubmissionInProgress
                    ? null
                    : () {
                        context.router.maybePop();
                      },
                child: Text(
                  l10n.forgotMyPasswordCancelButtonLabel,
                ),
              ),
              isSubmissionInProgress
                  ? KnotInProgressTextButton(
                      label: l10n.forgotMyPasswordConfirmButtonLabel,
                    )
                  : TextButton(
                      onPressed: cubit.onSubmit,
                      child: Text(
                        l10n.forgotMyPasswordConfirmButtonLabel,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }
}
