// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../note.dart';

class NoteMapper extends ClassMapperBase<Note> {
  NoteMapper._();

  static NoteMapper? _instance;
  static NoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NoteMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Note';

  static String _$id(Note v) => v.id;
  static const Field<Note, String> _f$id = Field('id', _$id);
  static String? _$content(Note v) => v.content;
  static const Field<Note, String> _f$content = Field('content', _$content);
  static TZDateTime? _$lastUpdateDateTime(Note v) => v.lastUpdateDateTime;
  static const Field<Note, TZDateTime> _f$lastUpdateDateTime =
      Field('lastUpdateDateTime', _$lastUpdateDateTime, opt: true);
  static TZDateTime? _$creationDateTime(Note v) => v.creationDateTime;
  static const Field<Note, TZDateTime> _f$creationDateTime =
      Field('creationDateTime', _$creationDateTime, opt: true);

  @override
  final MappableFields<Note> fields = const {
    #id: _f$id,
    #content: _f$content,
    #lastUpdateDateTime: _f$lastUpdateDateTime,
    #creationDateTime: _f$creationDateTime,
  };

  static Note _instantiate(DecodingData data) {
    return Note(
        id: data.dec(_f$id),
        content: data.dec(_f$content),
        lastUpdateDateTime: data.dec(_f$lastUpdateDateTime),
        creationDateTime: data.dec(_f$creationDateTime));
  }

  @override
  final Function instantiate = _instantiate;

  static Note fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Note>(map);
  }

  static Note fromJson(String json) {
    return ensureInitialized().decodeJson<Note>(json);
  }
}

mixin NoteMappable {
  String toJson() {
    return NoteMapper.ensureInitialized().encodeJson<Note>(this as Note);
  }

  Map<String, dynamic> toMap() {
    return NoteMapper.ensureInitialized().encodeMap<Note>(this as Note);
  }

  NoteCopyWith<Note, Note, Note> get copyWith =>
      _NoteCopyWithImpl(this as Note, $identity, $identity);
  @override
  String toString() {
    return NoteMapper.ensureInitialized().stringifyValue(this as Note);
  }

  @override
  bool operator ==(Object other) {
    return NoteMapper.ensureInitialized().equalsValue(this as Note, other);
  }

  @override
  int get hashCode {
    return NoteMapper.ensureInitialized().hashValue(this as Note);
  }
}

extension NoteValueCopy<$R, $Out> on ObjectCopyWith<$R, Note, $Out> {
  NoteCopyWith<$R, Note, $Out> get $asNote =>
      $base.as((v, t, t2) => _NoteCopyWithImpl(v, t, t2));
}

abstract class NoteCopyWith<$R, $In extends Note, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? content,
      TZDateTime? lastUpdateDateTime,
      TZDateTime? creationDateTime});
  NoteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NoteCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Note, $Out>
    implements NoteCopyWith<$R, Note, $Out> {
  _NoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Note> $mapper = NoteMapper.ensureInitialized();
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
  Note $make(CopyWithData data) => Note(
      id: data.get(#id, or: $value.id),
      content: data.get(#content, or: $value.content),
      lastUpdateDateTime:
          data.get(#lastUpdateDateTime, or: $value.lastUpdateDateTime),
      creationDateTime:
          data.get(#creationDateTime, or: $value.creationDateTime));

  @override
  NoteCopyWith<$R2, Note, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NoteCopyWithImpl($value, $cast, t);
}
