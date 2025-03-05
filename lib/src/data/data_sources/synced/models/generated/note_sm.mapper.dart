// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../note_sm.dart';

class NoteSMMapper extends ClassMapperBase<NoteSM> {
  NoteSMMapper._();

  static NoteSMMapper? _instance;
  static NoteSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NoteSM';

  static String _$id(NoteSM v) => v.id;
  static const Field<NoteSM, String> _f$id = Field('id', _$id);
  static String? _$content(NoteSM v) => v.content;
  static const Field<NoteSM, String> _f$content = Field('content', _$content);
  static Timestamp? _$lastUpdateDateTime(NoteSM v) => v.lastUpdateDateTime;
  static const Field<NoteSM, Timestamp> _f$lastUpdateDateTime =
      Field('lastUpdateDateTime', _$lastUpdateDateTime);
  static Timestamp? _$creationDateTime(NoteSM v) => v.creationDateTime;
  static const Field<NoteSM, Timestamp> _f$creationDateTime =
      Field('creationDateTime', _$creationDateTime);

  @override
  final MappableFields<NoteSM> fields = const {
    #id: _f$id,
    #content: _f$content,
    #lastUpdateDateTime: _f$lastUpdateDateTime,
    #creationDateTime: _f$creationDateTime,
  };

  static NoteSM _instantiate(DecodingData data) {
    return NoteSM(
        id: data.dec(_f$id),
        content: data.dec(_f$content),
        lastUpdateDateTime: data.dec(_f$lastUpdateDateTime),
        creationDateTime: data.dec(_f$creationDateTime));
  }

  @override
  final Function instantiate = _instantiate;

  static NoteSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NoteSM>(map);
  }

  static NoteSM fromJson(String json) {
    return ensureInitialized().decodeJson<NoteSM>(json);
  }
}

mixin NoteSMMappable {
  String toJson() {
    return NoteSMMapper.ensureInitialized().encodeJson<NoteSM>(this as NoteSM);
  }

  Map<String, dynamic> toMap() {
    return NoteSMMapper.ensureInitialized().encodeMap<NoteSM>(this as NoteSM);
  }

  NoteSMCopyWith<NoteSM, NoteSM, NoteSM> get copyWith =>
      _NoteSMCopyWithImpl(this as NoteSM, $identity, $identity);
  @override
  String toString() {
    return NoteSMMapper.ensureInitialized().stringifyValue(this as NoteSM);
  }

  @override
  bool operator ==(Object other) {
    return NoteSMMapper.ensureInitialized().equalsValue(this as NoteSM, other);
  }

  @override
  int get hashCode {
    return NoteSMMapper.ensureInitialized().hashValue(this as NoteSM);
  }
}

extension NoteSMValueCopy<$R, $Out> on ObjectCopyWith<$R, NoteSM, $Out> {
  NoteSMCopyWith<$R, NoteSM, $Out> get $asNoteSM =>
      $base.as((v, t, t2) => _NoteSMCopyWithImpl(v, t, t2));
}

abstract class NoteSMCopyWith<$R, $In extends NoteSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? content,
      Timestamp? lastUpdateDateTime,
      Timestamp? creationDateTime});
  NoteSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NoteSMCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, NoteSM, $Out>
    implements NoteSMCopyWith<$R, NoteSM, $Out> {
  _NoteSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NoteSM> $mapper = NoteSMMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? content = $none,
          Object? lastUpdateDateTime = $none,
          Object? creationDateTime = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (content != $none) #content: content,
        if (lastUpdateDateTime != $none)
          #lastUpdateDateTime: lastUpdateDateTime,
        if (creationDateTime != $none) #creationDateTime: creationDateTime
      }));
  @override
  NoteSM $make(CopyWithData data) => NoteSM(
      id: data.get(#id, or: $value.id),
      content: data.get(#content, or: $value.content),
      lastUpdateDateTime:
          data.get(#lastUpdateDateTime, or: $value.lastUpdateDateTime),
      creationDateTime:
          data.get(#creationDateTime, or: $value.creationDateTime));

  @override
  NoteSMCopyWith<$R2, NoteSM, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NoteSMCopyWithImpl($value, $cast, t);
}
