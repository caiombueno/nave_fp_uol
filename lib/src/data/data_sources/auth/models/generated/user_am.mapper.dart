// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../user_am.dart';

class UserAMMapper extends ClassMapperBase<UserAM> {
  UserAMMapper._();

  static UserAMMapper? _instance;
  static UserAMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserAM';

  static String _$id(UserAM v) => v.id;
  static const Field<UserAM, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<UserAM> fields = const {
    #id: _f$id,
  };

  static UserAM _instantiate(DecodingData data) {
    return UserAM(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static UserAM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserAM>(map);
  }

  static UserAM fromJson(String json) {
    return ensureInitialized().decodeJson<UserAM>(json);
  }
}

mixin UserAMMappable {
  String toJson() {
    return UserAMMapper.ensureInitialized().encodeJson<UserAM>(this as UserAM);
  }

  Map<String, dynamic> toMap() {
    return UserAMMapper.ensureInitialized().encodeMap<UserAM>(this as UserAM);
  }

  UserAMCopyWith<UserAM, UserAM, UserAM> get copyWith =>
      _UserAMCopyWithImpl(this as UserAM, $identity, $identity);
  @override
  String toString() {
    return UserAMMapper.ensureInitialized().stringifyValue(this as UserAM);
  }

  @override
  bool operator ==(Object other) {
    return UserAMMapper.ensureInitialized().equalsValue(this as UserAM, other);
  }

  @override
  int get hashCode {
    return UserAMMapper.ensureInitialized().hashValue(this as UserAM);
  }
}

extension UserAMValueCopy<$R, $Out> on ObjectCopyWith<$R, UserAM, $Out> {
  UserAMCopyWith<$R, UserAM, $Out> get $asUserAM =>
      $base.as((v, t, t2) => _UserAMCopyWithImpl(v, t, t2));
}

abstract class UserAMCopyWith<$R, $In extends UserAM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  UserAMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserAMCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, UserAM, $Out>
    implements UserAMCopyWith<$R, UserAM, $Out> {
  _UserAMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserAM> $mapper = UserAMMapper.ensureInitialized();
  @override
  $R call({String? id}) => $apply(FieldCopyWithData({if (id != null) #id: id}));
  @override
  UserAM $make(CopyWithData data) => UserAM(id: data.get(#id, or: $value.id));

  @override
  UserAMCopyWith<$R2, UserAM, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserAMCopyWithImpl($value, $cast, t);
}
