// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../create_note_sm.dart';

class CreateNoteSMMapper extends ClassMapperBase<CreateNoteSM> {
  CreateNoteSMMapper._();

  static CreateNoteSMMapper? _instance;
  static CreateNoteSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateNoteSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CreateNoteSM';

  static String? _$content(CreateNoteSM v) => v.content;
  static const Field<CreateNoteSM, String> _f$content =
      Field('content', _$content);
  static FieldValue _$creationDateTime(CreateNoteSM v) => v.creationDateTime;
  static const Field<CreateNoteSM, FieldValue> _f$creationDateTime =
      Field('creationDateTime', _$creationDateTime);

  @override
  final MappableFields<CreateNoteSM> fields = const {
    #content: _f$content,
    #creationDateTime: _f$creationDateTime,
  };

  static CreateNoteSM _instantiate(DecodingData data) {
    return CreateNoteSM.fromMappable(
        content: data.dec(_f$content),
        creationDateTime: data.dec(_f$creationDateTime));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateNoteSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateNoteSM>(map);
  }

  static CreateNoteSM fromJson(String json) {
    return ensureInitialized().decodeJson<CreateNoteSM>(json);
  }
}

mixin CreateNoteSMMappable {
  String toJson() {
    return CreateNoteSMMapper.ensureInitialized()
        .encodeJson<CreateNoteSM>(this as CreateNoteSM);
  }

  Map<String, dynamic> toMap() {
    return CreateNoteSMMapper.ensureInitialized()
        .encodeMap<CreateNoteSM>(this as CreateNoteSM);
  }

  CreateNoteSMCopyWith<CreateNoteSM, CreateNoteSM, CreateNoteSM> get copyWith =>
      _CreateNoteSMCopyWithImpl(this as CreateNoteSM, $identity, $identity);
  @override
  String toString() {
    return CreateNoteSMMapper.ensureInitialized()
        .stringifyValue(this as CreateNoteSM);
  }

  @override
  bool operator ==(Object other) {
    return CreateNoteSMMapper.ensureInitialized()
        .equalsValue(this as CreateNoteSM, other);
  }

  @override
  int get hashCode {
    return CreateNoteSMMapper.ensureInitialized()
        .hashValue(this as CreateNoteSM);
  }
}

extension CreateNoteSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateNoteSM, $Out> {
  CreateNoteSMCopyWith<$R, CreateNoteSM, $Out> get $asCreateNoteSM =>
      $base.as((v, t, t2) => _CreateNoteSMCopyWithImpl(v, t, t2));
}

abstract class CreateNoteSMCopyWith<$R, $In extends CreateNoteSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? content, FieldValue? creationDateTime});
  CreateNoteSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CreateNoteSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateNoteSM, $Out>
    implements CreateNoteSMCopyWith<$R, CreateNoteSM, $Out> {
  _CreateNoteSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateNoteSM> $mapper =
      CreateNoteSMMapper.ensureInitialized();
  @override
  $R call({Object? content = $none, FieldValue? creationDateTime}) =>
      $apply(FieldCopyWithData({
        if (content != $none) #content: content,
        if (creationDateTime != null) #creationDateTime: creationDateTime
      }));
  @override
  CreateNoteSM $make(CopyWithData data) => CreateNoteSM.fromMappable(
      content: data.get(#content, or: $value.content),
      creationDateTime:
          data.get(#creationDateTime, or: $value.creationDateTime));

  @override
  CreateNoteSMCopyWith<$R2, CreateNoteSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateNoteSMCopyWithImpl($value, $cast, t);
}
