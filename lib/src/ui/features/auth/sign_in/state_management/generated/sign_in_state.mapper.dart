// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../sign_in_state.dart';

class SignInStateMapper extends ClassMapperBase<SignInState> {
  SignInStateMapper._();

  static SignInStateMapper? _instance;
  static SignInStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SignInState';

  static EmailFieldState _$emailField(SignInState v) => v.emailField;
  static const Field<SignInState, EmailFieldState> _f$emailField = Field(
      'emailField', _$emailField,
      opt: true, def: const EmailFieldState.unvalidated());
  static PasswordFieldState _$passwordField(SignInState v) => v.passwordField;
  static const Field<SignInState, PasswordFieldState> _f$passwordField = Field(
      'passwordField', _$passwordField,
      opt: true, def: const PasswordFieldState.unvalidated());
  static SubmissionStatus _$submissionStatus(SignInState v) =>
      v.submissionStatus;
  static const Field<SignInState, SubmissionStatus> _f$submissionStatus = Field(
      'submissionStatus', _$submissionStatus,
      opt: true, def: SubmissionStatus.idle);

  @override
  final MappableFields<SignInState> fields = const {
    #emailField: _f$emailField,
    #passwordField: _f$passwordField,
    #submissionStatus: _f$submissionStatus,
  };

  static SignInState _instantiate(DecodingData data) {
    return SignInState(
        emailField: data.dec(_f$emailField),
        passwordField: data.dec(_f$passwordField),
        submissionStatus: data.dec(_f$submissionStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static SignInState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInState>(map);
  }

  static SignInState fromJson(String json) {
    return ensureInitialized().decodeJson<SignInState>(json);
  }
}

mixin SignInStateMappable {
  String toJson() {
    return SignInStateMapper.ensureInitialized()
        .encodeJson<SignInState>(this as SignInState);
  }

  Map<String, dynamic> toMap() {
    return SignInStateMapper.ensureInitialized()
        .encodeMap<SignInState>(this as SignInState);
  }

  SignInStateCopyWith<SignInState, SignInState, SignInState> get copyWith =>
      _SignInStateCopyWithImpl(this as SignInState, $identity, $identity);
  @override
  String toString() {
    return SignInStateMapper.ensureInitialized()
        .stringifyValue(this as SignInState);
  }

  @override
  bool operator ==(Object other) {
    return SignInStateMapper.ensureInitialized()
        .equalsValue(this as SignInState, other);
  }

  @override
  int get hashCode {
    return SignInStateMapper.ensureInitialized().hashValue(this as SignInState);
  }
}

extension SignInStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignInState, $Out> {
  SignInStateCopyWith<$R, SignInState, $Out> get $asSignInState =>
      $base.as((v, t, t2) => _SignInStateCopyWithImpl(v, t, t2));
}

abstract class SignInStateCopyWith<$R, $In extends SignInState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {EmailFieldState? emailField,
      PasswordFieldState? passwordField,
      SubmissionStatus? submissionStatus});
  SignInStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignInStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignInState, $Out>
    implements SignInStateCopyWith<$R, SignInState, $Out> {
  _SignInStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignInState> $mapper =
      SignInStateMapper.ensureInitialized();
  @override
  $R call(
          {EmailFieldState? emailField,
          PasswordFieldState? passwordField,
          SubmissionStatus? submissionStatus}) =>
      $apply(FieldCopyWithData({
        if (emailField != null) #emailField: emailField,
        if (passwordField != null) #passwordField: passwordField,
        if (submissionStatus != null) #submissionStatus: submissionStatus
      }));
  @override
  SignInState $make(CopyWithData data) => SignInState(
      emailField: data.get(#emailField, or: $value.emailField),
      passwordField: data.get(#passwordField, or: $value.passwordField),
      submissionStatus:
          data.get(#submissionStatus, or: $value.submissionStatus));

  @override
  SignInStateCopyWith<$R2, SignInState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SignInStateCopyWithImpl($value, $cast, t);
}
