// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../failures.dart';

class FailureMapper extends ClassMapperBase<Failure> {
  FailureMapper._();

  static FailureMapper? _instance;
  static FailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FailureMapper._());
      UnknownFailureMapper.ensureInitialized();
      NoInternetFailureMapper.ensureInitialized();
      UnauthenticatedUserFailureMapper.ensureInitialized();
      SignInFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Failure';

  @override
  final MappableFields<Failure> fields = const {};

  static Failure _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Failure', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Failure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Failure>(map);
  }

  static Failure fromJson(String json) {
    return ensureInitialized().decodeJson<Failure>(json);
  }
}

mixin FailureMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FailureCopyWith<Failure, Failure, Failure> get copyWith;
}

abstract class FailureCopyWith<$R, $In extends Failure, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  FailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class UnknownFailureMapper extends SubClassMapperBase<UnknownFailure> {
  UnknownFailureMapper._();

  static UnknownFailureMapper? _instance;
  static UnknownFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UnknownFailureMapper._());
      FailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UnknownFailure';

  static Object _$underlyingException(UnknownFailure v) =>
      v.underlyingException;
  static const Field<UnknownFailure, Object> _f$underlyingException =
      Field('underlyingException', _$underlyingException);
  static StackTrace? _$underlyingStackTrace(UnknownFailure v) =>
      v.underlyingStackTrace;
  static const Field<UnknownFailure, StackTrace> _f$underlyingStackTrace =
      Field('underlyingStackTrace', _$underlyingStackTrace, opt: true);

  @override
  final MappableFields<UnknownFailure> fields = const {
    #underlyingException: _f$underlyingException,
    #underlyingStackTrace: _f$underlyingStackTrace,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UnknownFailure';
  @override
  late final ClassMapperBase superMapper = FailureMapper.ensureInitialized();

  static UnknownFailure _instantiate(DecodingData data) {
    return UnknownFailure(
        underlyingException: data.dec(_f$underlyingException),
        underlyingStackTrace: data.dec(_f$underlyingStackTrace));
  }

  @override
  final Function instantiate = _instantiate;

  static UnknownFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UnknownFailure>(map);
  }

  static UnknownFailure fromJson(String json) {
    return ensureInitialized().decodeJson<UnknownFailure>(json);
  }
}

mixin UnknownFailureMappable {
  String toJson() {
    return UnknownFailureMapper.ensureInitialized()
        .encodeJson<UnknownFailure>(this as UnknownFailure);
  }

  Map<String, dynamic> toMap() {
    return UnknownFailureMapper.ensureInitialized()
        .encodeMap<UnknownFailure>(this as UnknownFailure);
  }

  UnknownFailureCopyWith<UnknownFailure, UnknownFailure, UnknownFailure>
      get copyWith => _UnknownFailureCopyWithImpl(
          this as UnknownFailure, $identity, $identity);
  @override
  String toString() {
    return UnknownFailureMapper.ensureInitialized()
        .stringifyValue(this as UnknownFailure);
  }

  @override
  bool operator ==(Object other) {
    return UnknownFailureMapper.ensureInitialized()
        .equalsValue(this as UnknownFailure, other);
  }

  @override
  int get hashCode {
    return UnknownFailureMapper.ensureInitialized()
        .hashValue(this as UnknownFailure);
  }
}

extension UnknownFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UnknownFailure, $Out> {
  UnknownFailureCopyWith<$R, UnknownFailure, $Out> get $asUnknownFailure =>
      $base.as((v, t, t2) => _UnknownFailureCopyWithImpl(v, t, t2));
}

abstract class UnknownFailureCopyWith<$R, $In extends UnknownFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({Object? underlyingException, StackTrace? underlyingStackTrace});
  UnknownFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UnknownFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UnknownFailure, $Out>
    implements UnknownFailureCopyWith<$R, UnknownFailure, $Out> {
  _UnknownFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnknownFailure> $mapper =
      UnknownFailureMapper.ensureInitialized();
  @override
  $R call(
          {Object? underlyingException,
          Object? underlyingStackTrace = $none}) =>
      $apply(FieldCopyWithData({
        if (underlyingException != null)
          #underlyingException: underlyingException,
        if (underlyingStackTrace != $none)
          #underlyingStackTrace: underlyingStackTrace
      }));
  @override
  UnknownFailure $make(CopyWithData data) => UnknownFailure(
      underlyingException:
          data.get(#underlyingException, or: $value.underlyingException),
      underlyingStackTrace:
          data.get(#underlyingStackTrace, or: $value.underlyingStackTrace));

  @override
  UnknownFailureCopyWith<$R2, UnknownFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UnknownFailureCopyWithImpl($value, $cast, t);
}

class NoInternetFailureMapper extends SubClassMapperBase<NoInternetFailure> {
  NoInternetFailureMapper._();

  static NoInternetFailureMapper? _instance;
  static NoInternetFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoInternetFailureMapper._());
      FailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'NoInternetFailure';

  @override
  final MappableFields<NoInternetFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'NoInternetFailure';
  @override
  late final ClassMapperBase superMapper = FailureMapper.ensureInitialized();

  static NoInternetFailure _instantiate(DecodingData data) {
    return NoInternetFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static NoInternetFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NoInternetFailure>(map);
  }

  static NoInternetFailure fromJson(String json) {
    return ensureInitialized().decodeJson<NoInternetFailure>(json);
  }
}

mixin NoInternetFailureMappable {
  String toJson() {
    return NoInternetFailureMapper.ensureInitialized()
        .encodeJson<NoInternetFailure>(this as NoInternetFailure);
  }

  Map<String, dynamic> toMap() {
    return NoInternetFailureMapper.ensureInitialized()
        .encodeMap<NoInternetFailure>(this as NoInternetFailure);
  }

  NoInternetFailureCopyWith<NoInternetFailure, NoInternetFailure,
          NoInternetFailure>
      get copyWith => _NoInternetFailureCopyWithImpl(
          this as NoInternetFailure, $identity, $identity);
  @override
  String toString() {
    return NoInternetFailureMapper.ensureInitialized()
        .stringifyValue(this as NoInternetFailure);
  }

  @override
  bool operator ==(Object other) {
    return NoInternetFailureMapper.ensureInitialized()
        .equalsValue(this as NoInternetFailure, other);
  }

  @override
  int get hashCode {
    return NoInternetFailureMapper.ensureInitialized()
        .hashValue(this as NoInternetFailure);
  }
}

extension NoInternetFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NoInternetFailure, $Out> {
  NoInternetFailureCopyWith<$R, NoInternetFailure, $Out>
      get $asNoInternetFailure =>
          $base.as((v, t, t2) => _NoInternetFailureCopyWithImpl(v, t, t2));
}

abstract class NoInternetFailureCopyWith<$R, $In extends NoInternetFailure,
    $Out> implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  NoInternetFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NoInternetFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NoInternetFailure, $Out>
    implements NoInternetFailureCopyWith<$R, NoInternetFailure, $Out> {
  _NoInternetFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NoInternetFailure> $mapper =
      NoInternetFailureMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  NoInternetFailure $make(CopyWithData data) => NoInternetFailure();

  @override
  NoInternetFailureCopyWith<$R2, NoInternetFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NoInternetFailureCopyWithImpl($value, $cast, t);
}

class UnauthenticatedUserFailureMapper
    extends SubClassMapperBase<UnauthenticatedUserFailure> {
  UnauthenticatedUserFailureMapper._();

  static UnauthenticatedUserFailureMapper? _instance;
  static UnauthenticatedUserFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UnauthenticatedUserFailureMapper._());
      FailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UnauthenticatedUserFailure';

  @override
  final MappableFields<UnauthenticatedUserFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UnauthenticatedUserFailure';
  @override
  late final ClassMapperBase superMapper = FailureMapper.ensureInitialized();

  static UnauthenticatedUserFailure _instantiate(DecodingData data) {
    return UnauthenticatedUserFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static UnauthenticatedUserFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UnauthenticatedUserFailure>(map);
  }

  static UnauthenticatedUserFailure fromJson(String json) {
    return ensureInitialized().decodeJson<UnauthenticatedUserFailure>(json);
  }
}

mixin UnauthenticatedUserFailureMappable {
  String toJson() {
    return UnauthenticatedUserFailureMapper.ensureInitialized()
        .encodeJson<UnauthenticatedUserFailure>(
            this as UnauthenticatedUserFailure);
  }

  Map<String, dynamic> toMap() {
    return UnauthenticatedUserFailureMapper.ensureInitialized()
        .encodeMap<UnauthenticatedUserFailure>(
            this as UnauthenticatedUserFailure);
  }

  UnauthenticatedUserFailureCopyWith<UnauthenticatedUserFailure,
          UnauthenticatedUserFailure, UnauthenticatedUserFailure>
      get copyWith => _UnauthenticatedUserFailureCopyWithImpl(
          this as UnauthenticatedUserFailure, $identity, $identity);
  @override
  String toString() {
    return UnauthenticatedUserFailureMapper.ensureInitialized()
        .stringifyValue(this as UnauthenticatedUserFailure);
  }

  @override
  bool operator ==(Object other) {
    return UnauthenticatedUserFailureMapper.ensureInitialized()
        .equalsValue(this as UnauthenticatedUserFailure, other);
  }

  @override
  int get hashCode {
    return UnauthenticatedUserFailureMapper.ensureInitialized()
        .hashValue(this as UnauthenticatedUserFailure);
  }
}

extension UnauthenticatedUserFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UnauthenticatedUserFailure, $Out> {
  UnauthenticatedUserFailureCopyWith<$R, UnauthenticatedUserFailure, $Out>
      get $asUnauthenticatedUserFailure => $base
          .as((v, t, t2) => _UnauthenticatedUserFailureCopyWithImpl(v, t, t2));
}

abstract class UnauthenticatedUserFailureCopyWith<
    $R,
    $In extends UnauthenticatedUserFailure,
    $Out> implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UnauthenticatedUserFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UnauthenticatedUserFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UnauthenticatedUserFailure, $Out>
    implements
        UnauthenticatedUserFailureCopyWith<$R, UnauthenticatedUserFailure,
            $Out> {
  _UnauthenticatedUserFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnauthenticatedUserFailure> $mapper =
      UnauthenticatedUserFailureMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UnauthenticatedUserFailure $make(CopyWithData data) =>
      UnauthenticatedUserFailure();

  @override
  UnauthenticatedUserFailureCopyWith<$R2, UnauthenticatedUserFailure, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UnauthenticatedUserFailureCopyWithImpl($value, $cast, t);
}

class SignInFailureMapper extends SubClassMapperBase<SignInFailure> {
  SignInFailureMapper._();

  static SignInFailureMapper? _instance;
  static SignInFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInFailureMapper._());
      FailureMapper.ensureInitialized().addSubMapper(_instance!);
      InvalidCredentialsFailureMapper.ensureInitialized();
      DisabledUserFailureMapper.ensureInitialized();
      TooManySignInAttemptsFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignInFailure';

  @override
  final MappableFields<SignInFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SignInFailure';
  @override
  late final ClassMapperBase superMapper = FailureMapper.ensureInitialized();

  static SignInFailure _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SignInFailure', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SignInFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInFailure>(map);
  }

  static SignInFailure fromJson(String json) {
    return ensureInitialized().decodeJson<SignInFailure>(json);
  }
}

mixin SignInFailureMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SignInFailureCopyWith<SignInFailure, SignInFailure, SignInFailure>
      get copyWith;
}

abstract class SignInFailureCopyWith<$R, $In extends SignInFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SignInFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class InvalidCredentialsFailureMapper
    extends SubClassMapperBase<InvalidCredentialsFailure> {
  InvalidCredentialsFailureMapper._();

  static InvalidCredentialsFailureMapper? _instance;
  static InvalidCredentialsFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = InvalidCredentialsFailureMapper._());
      SignInFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'InvalidCredentialsFailure';

  @override
  final MappableFields<InvalidCredentialsFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'InvalidCredentialsFailure';
  @override
  late final ClassMapperBase superMapper =
      SignInFailureMapper.ensureInitialized();

  static InvalidCredentialsFailure _instantiate(DecodingData data) {
    return InvalidCredentialsFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static InvalidCredentialsFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InvalidCredentialsFailure>(map);
  }

  static InvalidCredentialsFailure fromJson(String json) {
    return ensureInitialized().decodeJson<InvalidCredentialsFailure>(json);
  }
}

mixin InvalidCredentialsFailureMappable {
  String toJson() {
    return InvalidCredentialsFailureMapper.ensureInitialized()
        .encodeJson<InvalidCredentialsFailure>(
            this as InvalidCredentialsFailure);
  }

  Map<String, dynamic> toMap() {
    return InvalidCredentialsFailureMapper.ensureInitialized()
        .encodeMap<InvalidCredentialsFailure>(
            this as InvalidCredentialsFailure);
  }

  InvalidCredentialsFailureCopyWith<InvalidCredentialsFailure,
          InvalidCredentialsFailure, InvalidCredentialsFailure>
      get copyWith => _InvalidCredentialsFailureCopyWithImpl(
          this as InvalidCredentialsFailure, $identity, $identity);
  @override
  String toString() {
    return InvalidCredentialsFailureMapper.ensureInitialized()
        .stringifyValue(this as InvalidCredentialsFailure);
  }

  @override
  bool operator ==(Object other) {
    return InvalidCredentialsFailureMapper.ensureInitialized()
        .equalsValue(this as InvalidCredentialsFailure, other);
  }

  @override
  int get hashCode {
    return InvalidCredentialsFailureMapper.ensureInitialized()
        .hashValue(this as InvalidCredentialsFailure);
  }
}

extension InvalidCredentialsFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InvalidCredentialsFailure, $Out> {
  InvalidCredentialsFailureCopyWith<$R, InvalidCredentialsFailure, $Out>
      get $asInvalidCredentialsFailure => $base
          .as((v, t, t2) => _InvalidCredentialsFailureCopyWithImpl(v, t, t2));
}

abstract class InvalidCredentialsFailureCopyWith<
    $R,
    $In extends InvalidCredentialsFailure,
    $Out> implements SignInFailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  InvalidCredentialsFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InvalidCredentialsFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InvalidCredentialsFailure, $Out>
    implements
        InvalidCredentialsFailureCopyWith<$R, InvalidCredentialsFailure, $Out> {
  _InvalidCredentialsFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InvalidCredentialsFailure> $mapper =
      InvalidCredentialsFailureMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  InvalidCredentialsFailure $make(CopyWithData data) =>
      InvalidCredentialsFailure();

  @override
  InvalidCredentialsFailureCopyWith<$R2, InvalidCredentialsFailure, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InvalidCredentialsFailureCopyWithImpl($value, $cast, t);
}

class DisabledUserFailureMapper
    extends SubClassMapperBase<DisabledUserFailure> {
  DisabledUserFailureMapper._();

  static DisabledUserFailureMapper? _instance;
  static DisabledUserFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DisabledUserFailureMapper._());
      SignInFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'DisabledUserFailure';

  @override
  final MappableFields<DisabledUserFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'DisabledUserFailure';
  @override
  late final ClassMapperBase superMapper =
      SignInFailureMapper.ensureInitialized();

  static DisabledUserFailure _instantiate(DecodingData data) {
    return DisabledUserFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static DisabledUserFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DisabledUserFailure>(map);
  }

  static DisabledUserFailure fromJson(String json) {
    return ensureInitialized().decodeJson<DisabledUserFailure>(json);
  }
}

mixin DisabledUserFailureMappable {
  String toJson() {
    return DisabledUserFailureMapper.ensureInitialized()
        .encodeJson<DisabledUserFailure>(this as DisabledUserFailure);
  }

  Map<String, dynamic> toMap() {
    return DisabledUserFailureMapper.ensureInitialized()
        .encodeMap<DisabledUserFailure>(this as DisabledUserFailure);
  }

  DisabledUserFailureCopyWith<DisabledUserFailure, DisabledUserFailure,
          DisabledUserFailure>
      get copyWith => _DisabledUserFailureCopyWithImpl(
          this as DisabledUserFailure, $identity, $identity);
  @override
  String toString() {
    return DisabledUserFailureMapper.ensureInitialized()
        .stringifyValue(this as DisabledUserFailure);
  }

  @override
  bool operator ==(Object other) {
    return DisabledUserFailureMapper.ensureInitialized()
        .equalsValue(this as DisabledUserFailure, other);
  }

  @override
  int get hashCode {
    return DisabledUserFailureMapper.ensureInitialized()
        .hashValue(this as DisabledUserFailure);
  }
}

extension DisabledUserFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DisabledUserFailure, $Out> {
  DisabledUserFailureCopyWith<$R, DisabledUserFailure, $Out>
      get $asDisabledUserFailure =>
          $base.as((v, t, t2) => _DisabledUserFailureCopyWithImpl(v, t, t2));
}

abstract class DisabledUserFailureCopyWith<$R, $In extends DisabledUserFailure,
    $Out> implements SignInFailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  DisabledUserFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DisabledUserFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DisabledUserFailure, $Out>
    implements DisabledUserFailureCopyWith<$R, DisabledUserFailure, $Out> {
  _DisabledUserFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DisabledUserFailure> $mapper =
      DisabledUserFailureMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  DisabledUserFailure $make(CopyWithData data) => DisabledUserFailure();

  @override
  DisabledUserFailureCopyWith<$R2, DisabledUserFailure, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DisabledUserFailureCopyWithImpl($value, $cast, t);
}

class TooManySignInAttemptsFailureMapper
    extends SubClassMapperBase<TooManySignInAttemptsFailure> {
  TooManySignInAttemptsFailureMapper._();

  static TooManySignInAttemptsFailureMapper? _instance;
  static TooManySignInAttemptsFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TooManySignInAttemptsFailureMapper._());
      SignInFailureMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TooManySignInAttemptsFailure';

  @override
  final MappableFields<TooManySignInAttemptsFailure> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TooManySignInAttemptsFailure';
  @override
  late final ClassMapperBase superMapper =
      SignInFailureMapper.ensureInitialized();

  static TooManySignInAttemptsFailure _instantiate(DecodingData data) {
    return TooManySignInAttemptsFailure();
  }

  @override
  final Function instantiate = _instantiate;

  static TooManySignInAttemptsFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TooManySignInAttemptsFailure>(map);
  }

  static TooManySignInAttemptsFailure fromJson(String json) {
    return ensureInitialized().decodeJson<TooManySignInAttemptsFailure>(json);
  }
}

mixin TooManySignInAttemptsFailureMappable {
  String toJson() {
    return TooManySignInAttemptsFailureMapper.ensureInitialized()
        .encodeJson<TooManySignInAttemptsFailure>(
            this as TooManySignInAttemptsFailure);
  }

  Map<String, dynamic> toMap() {
    return TooManySignInAttemptsFailureMapper.ensureInitialized()
        .encodeMap<TooManySignInAttemptsFailure>(
            this as TooManySignInAttemptsFailure);
  }

  TooManySignInAttemptsFailureCopyWith<TooManySignInAttemptsFailure,
          TooManySignInAttemptsFailure, TooManySignInAttemptsFailure>
      get copyWith => _TooManySignInAttemptsFailureCopyWithImpl(
          this as TooManySignInAttemptsFailure, $identity, $identity);
  @override
  String toString() {
    return TooManySignInAttemptsFailureMapper.ensureInitialized()
        .stringifyValue(this as TooManySignInAttemptsFailure);
  }

  @override
  bool operator ==(Object other) {
    return TooManySignInAttemptsFailureMapper.ensureInitialized()
        .equalsValue(this as TooManySignInAttemptsFailure, other);
  }

  @override
  int get hashCode {
    return TooManySignInAttemptsFailureMapper.ensureInitialized()
        .hashValue(this as TooManySignInAttemptsFailure);
  }
}

extension TooManySignInAttemptsFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TooManySignInAttemptsFailure, $Out> {
  TooManySignInAttemptsFailureCopyWith<$R, TooManySignInAttemptsFailure, $Out>
      get $asTooManySignInAttemptsFailure => $base.as(
          (v, t, t2) => _TooManySignInAttemptsFailureCopyWithImpl(v, t, t2));
}

abstract class TooManySignInAttemptsFailureCopyWith<
    $R,
    $In extends TooManySignInAttemptsFailure,
    $Out> implements SignInFailureCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TooManySignInAttemptsFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TooManySignInAttemptsFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TooManySignInAttemptsFailure, $Out>
    implements
        TooManySignInAttemptsFailureCopyWith<$R, TooManySignInAttemptsFailure,
            $Out> {
  _TooManySignInAttemptsFailureCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TooManySignInAttemptsFailure> $mapper =
      TooManySignInAttemptsFailureMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TooManySignInAttemptsFailure $make(CopyWithData data) =>
      TooManySignInAttemptsFailure();

  @override
  TooManySignInAttemptsFailureCopyWith<$R2, TooManySignInAttemptsFailure, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TooManySignInAttemptsFailureCopyWithImpl($value, $cast, t);
}
