// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../update_note_sm.dart';

class UpdateNoteSMMapper extends ClassMapperBase<UpdateNoteSM> {
  UpdateNoteSMMapper._();

  static UpdateNoteSMMapper? _instance;
  static UpdateNoteSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateNoteSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateNoteSM';

  static String? _$noteId(UpdateNoteSM v) => v.noteId;
  static const Field<UpdateNoteSM, String> _f$noteId =
      Field('noteId', _$noteId, key: r'id');
  static String? _$content(UpdateNoteSM v) => v.content;
  static const Field<UpdateNoteSM, String> _f$content =
      Field('content', _$content);
  static FieldValue _$lastUpdateDateTime(UpdateNoteSM v) =>
      v.lastUpdateDateTime;
  static const Field<UpdateNoteSM, FieldValue> _f$lastUpdateDateTime =
      Field('lastUpdateDateTime', _$lastUpdateDateTime);

  @override
  final MappableFields<UpdateNoteSM> fields = const {
    #noteId: _f$noteId,
    #content: _f$content,
    #lastUpdateDateTime: _f$lastUpdateDateTime,
  };

  static UpdateNoteSM _instantiate(DecodingData data) {
    return UpdateNoteSM.fromMappable(
        noteId: data.dec(_f$noteId),
        content: data.dec(_f$content),
        lastUpdateDateTime: data.dec(_f$lastUpdateDateTime));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateNoteSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateNoteSM>(map);
  }

  static UpdateNoteSM fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateNoteSM>(json);
  }
}

mixin UpdateNoteSMMappable {
  String toJson() {
    return UpdateNoteSMMapper.ensureInitialized()
        .encodeJson<UpdateNoteSM>(this as UpdateNoteSM);
  }

  Map<String, dynamic> toMap() {
    return UpdateNoteSMMapper.ensureInitialized()
        .encodeMap<UpdateNoteSM>(this as UpdateNoteSM);
  }

  UpdateNoteSMCopyWith<UpdateNoteSM, UpdateNoteSM, UpdateNoteSM> get copyWith =>
      _UpdateNoteSMCopyWithImpl(this as UpdateNoteSM, $identity, $identity);
  @override
  String toString() {
    return UpdateNoteSMMapper.ensureInitialized()
        .stringifyValue(this as UpdateNoteSM);
  }

  @override
  bool operator ==(Object other) {
    return UpdateNoteSMMapper.ensureInitialized()
        .equalsValue(this as UpdateNoteSM, other);
  }

  @override
  int get hashCode {
    return UpdateNoteSMMapper.ensureInitialized()
        .hashValue(this as UpdateNoteSM);
  }
}

extension UpdateNoteSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateNoteSM, $Out> {
  UpdateNoteSMCopyWith<$R, UpdateNoteSM, $Out> get $asUpdateNoteSM =>
      $base.as((v, t, t2) => _UpdateNoteSMCopyWithImpl(v, t, t2));
}

abstract class UpdateNoteSMCopyWith<$R, $In extends UpdateNoteSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? noteId, String? content, FieldValue? lastUpdateDateTime});
  UpdateNoteSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UpdateNoteSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateNoteSM, $Out>
    implements UpdateNoteSMCopyWith<$R, UpdateNoteSM, $Out> {
  _UpdateNoteSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateNoteSM> $mapper =
      UpdateNoteSMMapper.ensureInitialized();
  @override
  $R call(
          {Object? noteId = $none,
          Object? content = $none,
          FieldValue? lastUpdateDateTime}) =>
      $apply(FieldCopyWithData({
        if (noteId != $none) #noteId: noteId,
        if (content != $none) #content: content,
        if (lastUpdateDateTime != null) #lastUpdateDateTime: lastUpdateDateTime
      }));
  @override
  UpdateNoteSM $make(CopyWithData data) => UpdateNoteSM.fromMappable(
      noteId: data.get(#noteId, or: $value.noteId),
      content: data.get(#content, or: $value.content),
      lastUpdateDateTime:
          data.get(#lastUpdateDateTime, or: $value.lastUpdateDateTime));

  @override
  UpdateNoteSMCopyWith<$R2, UpdateNoteSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpdateNoteSMCopyWithImpl($value, $cast, t);
}
