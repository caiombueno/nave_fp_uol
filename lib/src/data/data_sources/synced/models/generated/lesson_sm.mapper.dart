// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../lesson_sm.dart';

class LessonSMMapper extends ClassMapperBase<LessonSM> {
  LessonSMMapper._();

  static LessonSMMapper? _instance;
  static LessonSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LessonSMMapper._());
      TextLessonSMMapper.ensureInitialized();
      VideoLessonSMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LessonSM';

  static String _$id(LessonSM v) => v.id;
  static const Field<LessonSM, String> _f$id = Field('id', _$id);

  @override
  final MappableFields<LessonSM> fields = const {
    #id: _f$id,
  };

  static LessonSM _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'LessonSM', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static LessonSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LessonSM>(map);
  }

  static LessonSM fromJson(String json) {
    return ensureInitialized().decodeJson<LessonSM>(json);
  }
}

mixin LessonSMMappable {
  String toJson();
  Map<String, dynamic> toMap();
  LessonSMCopyWith<LessonSM, LessonSM, LessonSM> get copyWith;
}

abstract class LessonSMCopyWith<$R, $In extends LessonSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id});
  LessonSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class TextLessonSMMapper extends SubClassMapperBase<TextLessonSM> {
  TextLessonSMMapper._();

  static TextLessonSMMapper? _instance;
  static TextLessonSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonSMMapper._());
      LessonSMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonSM';

  static String _$id(TextLessonSM v) => v.id;
  static const Field<TextLessonSM, String> _f$id = Field('id', _$id);
  static String? _$title(TextLessonSM v) => v.title;
  static const Field<TextLessonSM, String> _f$title = Field('title', _$title);
  static String? _$content(TextLessonSM v) => v.content;
  static const Field<TextLessonSM, String> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<TextLessonSM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'text';
  @override
  late final ClassMapperBase superMapper = LessonSMMapper.ensureInitialized();

  static TextLessonSM _instantiate(DecodingData data) {
    return TextLessonSM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonSM>(map);
  }

  static TextLessonSM fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonSM>(json);
  }
}

mixin TextLessonSMMappable {
  String toJson() {
    return TextLessonSMMapper.ensureInitialized()
        .encodeJson<TextLessonSM>(this as TextLessonSM);
  }

  Map<String, dynamic> toMap() {
    return TextLessonSMMapper.ensureInitialized()
        .encodeMap<TextLessonSM>(this as TextLessonSM);
  }

  TextLessonSMCopyWith<TextLessonSM, TextLessonSM, TextLessonSM> get copyWith =>
      _TextLessonSMCopyWithImpl(this as TextLessonSM, $identity, $identity);
  @override
  String toString() {
    return TextLessonSMMapper.ensureInitialized()
        .stringifyValue(this as TextLessonSM);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonSMMapper.ensureInitialized()
        .equalsValue(this as TextLessonSM, other);
  }

  @override
  int get hashCode {
    return TextLessonSMMapper.ensureInitialized()
        .hashValue(this as TextLessonSM);
  }
}

extension TextLessonSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLessonSM, $Out> {
  TextLessonSMCopyWith<$R, TextLessonSM, $Out> get $asTextLessonSM =>
      $base.as((v, t, t2) => _TextLessonSMCopyWithImpl(v, t, t2));
}

abstract class TextLessonSMCopyWith<$R, $In extends TextLessonSM, $Out>
    implements LessonSMCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, String? content});
  TextLessonSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextLessonSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLessonSM, $Out>
    implements TextLessonSMCopyWith<$R, TextLessonSM, $Out> {
  _TextLessonSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLessonSM> $mapper =
      TextLessonSMMapper.ensureInitialized();
  @override
  $R call({String? id, Object? title = $none, Object? content = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (content != $none) #content: content
      }));
  @override
  TextLessonSM $make(CopyWithData data) => TextLessonSM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      content: data.get(#content, or: $value.content));

  @override
  TextLessonSMCopyWith<$R2, TextLessonSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonSMCopyWithImpl($value, $cast, t);
}

class VideoLessonSMMapper extends SubClassMapperBase<VideoLessonSM> {
  VideoLessonSMMapper._();

  static VideoLessonSMMapper? _instance;
  static VideoLessonSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonSMMapper._());
      LessonSMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLessonSM';

  static String _$id(VideoLessonSM v) => v.id;
  static const Field<VideoLessonSM, String> _f$id = Field('id', _$id);
  static String? _$title(VideoLessonSM v) => v.title;
  static const Field<VideoLessonSM, String> _f$title = Field('title', _$title);
  static String? _$filePath(VideoLessonSM v) => v.filePath;
  static const Field<VideoLessonSM, String> _f$filePath =
      Field('filePath', _$filePath);
  static bool? _$isHorizontal(VideoLessonSM v) => v.isHorizontal;
  static const Field<VideoLessonSM, bool> _f$isHorizontal =
      Field('isHorizontal', _$isHorizontal);

  @override
  final MappableFields<VideoLessonSM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #filePath: _f$filePath,
    #isHorizontal: _f$isHorizontal,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'video';
  @override
  late final ClassMapperBase superMapper = LessonSMMapper.ensureInitialized();

  static VideoLessonSM _instantiate(DecodingData data) {
    return VideoLessonSM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        filePath: data.dec(_f$filePath),
        isHorizontal: data.dec(_f$isHorizontal));
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLessonSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLessonSM>(map);
  }

  static VideoLessonSM fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLessonSM>(json);
  }
}

mixin VideoLessonSMMappable {
  String toJson() {
    return VideoLessonSMMapper.ensureInitialized()
        .encodeJson<VideoLessonSM>(this as VideoLessonSM);
  }

  Map<String, dynamic> toMap() {
    return VideoLessonSMMapper.ensureInitialized()
        .encodeMap<VideoLessonSM>(this as VideoLessonSM);
  }

  VideoLessonSMCopyWith<VideoLessonSM, VideoLessonSM, VideoLessonSM>
      get copyWith => _VideoLessonSMCopyWithImpl(
          this as VideoLessonSM, $identity, $identity);
  @override
  String toString() {
    return VideoLessonSMMapper.ensureInitialized()
        .stringifyValue(this as VideoLessonSM);
  }

  @override
  bool operator ==(Object other) {
    return VideoLessonSMMapper.ensureInitialized()
        .equalsValue(this as VideoLessonSM, other);
  }

  @override
  int get hashCode {
    return VideoLessonSMMapper.ensureInitialized()
        .hashValue(this as VideoLessonSM);
  }
}

extension VideoLessonSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoLessonSM, $Out> {
  VideoLessonSMCopyWith<$R, VideoLessonSM, $Out> get $asVideoLessonSM =>
      $base.as((v, t, t2) => _VideoLessonSMCopyWithImpl(v, t, t2));
}

abstract class VideoLessonSMCopyWith<$R, $In extends VideoLessonSM, $Out>
    implements LessonSMCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, String? filePath, bool? isHorizontal});
  VideoLessonSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VideoLessonSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoLessonSM, $Out>
    implements VideoLessonSMCopyWith<$R, VideoLessonSM, $Out> {
  _VideoLessonSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoLessonSM> $mapper =
      VideoLessonSMMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? title = $none,
          Object? filePath = $none,
          Object? isHorizontal = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (filePath != $none) #filePath: filePath,
        if (isHorizontal != $none) #isHorizontal: isHorizontal
      }));
  @override
  VideoLessonSM $make(CopyWithData data) => VideoLessonSM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      filePath: data.get(#filePath, or: $value.filePath),
      isHorizontal: data.get(#isHorizontal, or: $value.isHorizontal));

  @override
  VideoLessonSMCopyWith<$R2, VideoLessonSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoLessonSMCopyWithImpl($value, $cast, t);
}
