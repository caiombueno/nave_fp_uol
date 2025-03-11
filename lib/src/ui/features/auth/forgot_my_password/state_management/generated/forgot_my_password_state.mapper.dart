// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../forgot_my_password_state.dart';

class ForgotMyPasswordStateMapper
    extends ClassMapperBase<ForgotMyPasswordState> {
  ForgotMyPasswordStateMapper._();

  static ForgotMyPasswordStateMapper? _instance;
  static ForgotMyPasswordStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ForgotMyPasswordStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ForgotMyPasswordState';

  static EmailFieldState _$email(ForgotMyPasswordState v) => v.email;
  static const Field<ForgotMyPasswordState, EmailFieldState> _f$email = Field(
      'email', _$email,
      opt: true, def: const EmailFieldState.unvalidated());
  static SubmissionStatus _$submissionStatus(ForgotMyPasswordState v) =>
      v.submissionStatus;
  static const Field<ForgotMyPasswordState, SubmissionStatus>
      _f$submissionStatus = Field('submissionStatus', _$submissionStatus,
          opt: true, def: SubmissionStatus.idle);

  @override
  final MappableFields<ForgotMyPasswordState> fields = const {
    #email: _f$email,
    #submissionStatus: _f$submissionStatus,
  };

  static ForgotMyPasswordState _instantiate(DecodingData data) {
    return ForgotMyPasswordState(
        email: data.dec(_f$email),
        submissionStatus: data.dec(_f$submissionStatus));
  }

  @override
  final Function instantiate = _instantiate;

  static ForgotMyPasswordState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ForgotMyPasswordState>(map);
  }

  static ForgotMyPasswordState fromJson(String json) {
    return ensureInitialized().decodeJson<ForgotMyPasswordState>(json);
  }
}

mixin ForgotMyPasswordStateMappable {
  String toJson() {
    return ForgotMyPasswordStateMapper.ensureInitialized()
        .encodeJson<ForgotMyPasswordState>(this as ForgotMyPasswordState);
  }

  Map<String, dynamic> toMap() {
    return ForgotMyPasswordStateMapper.ensureInitialized()
        .encodeMap<ForgotMyPasswordState>(this as ForgotMyPasswordState);
  }

  ForgotMyPasswordStateCopyWith<ForgotMyPasswordState, ForgotMyPasswordState,
          ForgotMyPasswordState>
      get copyWith => _ForgotMyPasswordStateCopyWithImpl(
          this as ForgotMyPasswordState, $identity, $identity);
  @override
  String toString() {
    return ForgotMyPasswordStateMapper.ensureInitialized()
        .stringifyValue(this as ForgotMyPasswordState);
  }

  @override
  bool operator ==(Object other) {
    return ForgotMyPasswordStateMapper.ensureInitialized()
        .equalsValue(this as ForgotMyPasswordState, other);
  }

  @override
  int get hashCode {
    return ForgotMyPasswordStateMapper.ensureInitialized()
        .hashValue(this as ForgotMyPasswordState);
  }
}

extension ForgotMyPasswordStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ForgotMyPasswordState, $Out> {
  ForgotMyPasswordStateCopyWith<$R, ForgotMyPasswordState, $Out>
      get $asForgotMyPasswordState =>
          $base.as((v, t, t2) => _ForgotMyPasswordStateCopyWithImpl(v, t, t2));
}

abstract class ForgotMyPasswordStateCopyWith<
    $R,
    $In extends ForgotMyPasswordState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({EmailFieldState? email, SubmissionStatus? submissionStatus});
  ForgotMyPasswordStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ForgotMyPasswordStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ForgotMyPasswordState, $Out>
    implements ForgotMyPasswordStateCopyWith<$R, ForgotMyPasswordState, $Out> {
  _ForgotMyPasswordStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ForgotMyPasswordState> $mapper =
      ForgotMyPasswordStateMapper.ensureInitialized();
  @override
  $R call({EmailFieldState? email, SubmissionStatus? submissionStatus}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (submissionStatus != null) #submissionStatus: submissionStatus
      }));
  @override
  ForgotMyPasswordState $make(CopyWithData data) => ForgotMyPasswordState(
      email: data.get(#email, or: $value.email),
      submissionStatus:
          data.get(#submissionStatus, or: $value.submissionStatus));

  @override
  ForgotMyPasswordStateCopyWith<$R2, ForgotMyPasswordState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ForgotMyPasswordStateCopyWithImpl($value, $cast, t);
}
