import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/forgot_my_password_dialog.dart';
import 'package:nave_fp_uol/src/ui/features/auth/form_field_state_models.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_state.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_expanded_elevated_button.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_unknown_error_snack_bar.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

@RoutePage()
class SignInScreen extends StatelessWidget implements AutoRouteWrapper {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (_) => SignInCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => _releaseFocus(context),
      child: Scaffold(
        backgroundColor: KnotSemanticColors.signInScreenBackground,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: KnotSemanticColors.signInScreenBackground,
          title: Text(
            l10n.signInAppBarTitle,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: KnotSemanticSpacings.screenSideBorders,
            ),
            child: _SignInForm(),
          ),
        ),
      ),
    );
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}

class _SignInForm extends StatefulWidget {
  const _SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignInCubit>();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        cubit.onEmailUnfocused();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        cubit.onPasswordUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (oldState, newState) =>
          oldState.submissionStatus != newState.submissionStatus,
      listener: (context, state) {
        if (state.submissionStatus == SubmissionStatus.success) {
          context.router.maybePop(true);
          return;
        }

        final hasSubmissionError = state.submissionStatus ==
                SubmissionStatus.unknownError ||
            state.submissionStatus == SubmissionStatus.invalidCredentialsError;

        if (hasSubmissionError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              state.submissionStatus == SubmissionStatus.unknownError
                  ? const KnotUnknownErrorSnackBar()
                  : SnackBar(
                      content: Text(
                        state.submissionStatus ==
                                SubmissionStatus.invalidCredentialsError
                            ? l10n.signInInvalidCredentialsErrorMessage
                            : state.submissionStatus ==
                                    SubmissionStatus.disabledUserError
                                ? l10n.signInDisabledUserErrorMessage
                                : state.submissionStatus ==
                                        SubmissionStatus.tooManyAttemptsError
                                    ? l10n.signInTooManyAttemptsErrorMessage
                                    : l10n.unknownErrorGeneralSnackbarMessage,
                      ),
                    ),
            );
        }
      },
      builder: (context, state) {
        final emailError = state.emailField.displayError;
        final passwordError = state.passwordField.displayError;
        final isSubmissionInProgress =
            state.submissionStatus == SubmissionStatus.inProgress;

        final cubit = context.read<SignInCubit>();
        return Column(
          children: <Widget>[
            TextField(
              focusNode: _emailFocusNode,
              onChanged: cubit.onEmailChanged,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.alternate_email,
                ),
                enabled: !isSubmissionInProgress,
                labelText: l10n.signInEmailTextFieldLabel,
                errorText: emailError == null
                    ? null
                    : (emailError == EmailValidationError.empty
                        ? l10n.signInEmailTextFieldEmptyErrorMessage
                        : l10n.signInEmailTextFieldInvalidErrorMessage),
              ),
            ),
            const SizedBox(
              height: KnotSemanticSpacings.formFieldsVerticalSpacer,
            ),
            TextField(
              focusNode: _passwordFocusNode,
              onChanged: cubit.onPasswordChanged,
              obscureText: true,
              onEditingComplete: cubit.onSubmit,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.password,
                ),
                enabled: !isSubmissionInProgress,
                labelText: l10n.signInPasswordTextFieldLabel,
                errorText: passwordError == null
                    ? null
                    : (passwordError == PasswordValidationError.empty
                        ? l10n.signInPasswordTextFieldEmptyErrorMessage
                        : l10n.signInPasswordTextFieldInvalidErrorMessage),
              ),
            ),
            TextButton(
              child: Text(
                l10n.signInForgotMyPasswordButtonLabel,
              ),
              onPressed: isSubmissionInProgress
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (_) => ForgotMyPasswordDialog(),
                      );
                    },
            ),
            const SizedBox(
              height: KnotCoreSpacings.small,
            ),
            isSubmissionInProgress
                ? KnotExpandedElevatedButton.inProgress(
                    label: l10n.signInCtaLabel,
                  )
                : KnotExpandedElevatedButton(
                    onTap: cubit.onSubmit,
                    label: l10n.signInCtaLabel,
                    icon: const Icon(
                      Icons.login,
                    ),
                  ),
            const SizedBox(
              height: KnotCoreSpacings.xxLarge,
            ),
            Text(
              l10n.signInJoinOpeningText,
            ),
            TextButton(
              child: Text(
                l10n.signInJoinCtaLabel,
              ),
              onPressed: isSubmissionInProgress
                  ? null
                  : () {
                      // TODO: Abrir página de vendas no navegador.
                    },
            ),
          ],
        );
      },
    );
  }
}
