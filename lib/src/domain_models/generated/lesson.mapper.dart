// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../lesson.dart';

class LessonMapper extends ClassMapperBase<Lesson> {
  LessonMapper._();

  static LessonMapper? _instance;
  static LessonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LessonMapper._());
      TextLessonMapper.ensureInitialized();
      VideoLessonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Lesson';

  static String _$id(Lesson v) => v.id;
  static const Field<Lesson, String> _f$id = Field('id', _$id);
  static bool? _$isCompleted(Lesson v) => v.isCompleted;
  static const Field<Lesson, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<Lesson> fields = const {
    #id: _f$id,
    #isCompleted: _f$isCompleted,
  };

  static Lesson _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Lesson', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Lesson fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Lesson>(map);
  }

  static Lesson fromJson(String json) {
    return ensureInitialized().decodeJson<Lesson>(json);
  }
}

mixin LessonMappable {
  String toJson();
  Map<String, dynamic> toMap();
  LessonCopyWith<Lesson, Lesson, Lesson> get copyWith;
}

abstract class LessonCopyWith<$R, $In extends Lesson, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, bool? isCompleted});
  LessonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class TextLessonMapper extends SubClassMapperBase<TextLesson> {
  TextLessonMapper._();

  static TextLessonMapper? _instance;
  static TextLessonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonMapper._());
      LessonMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TextLesson';

  static String _$id(TextLesson v) => v.id;
  static const Field<TextLesson, String> _f$id = Field('id', _$id);
  static String? _$title(TextLesson v) => v.title;
  static const Field<TextLesson, String> _f$title = Field('title', _$title);
  static String? _$content(TextLesson v) => v.content;
  static const Field<TextLesson, String> _f$content =
      Field('content', _$content);
  static bool? _$isCompleted(TextLesson v) => v.isCompleted;
  static const Field<TextLesson, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<TextLesson> fields = const {
    #id: _f$id,
    #title: _f$title,
    #content: _f$content,
    #isCompleted: _f$isCompleted,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'text';
  @override
  late final ClassMapperBase superMapper = LessonMapper.ensureInitialized();

  static TextLesson _instantiate(DecodingData data) {
    return TextLesson(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        content: data.dec(_f$content),
        isCompleted: data.dec(_f$isCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TextLesson fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLesson>(map);
  }

  static TextLesson fromJson(String json) {
    return ensureInitialized().decodeJson<TextLesson>(json);
  }
}

mixin TextLessonMappable {
  String toJson() {
    return TextLessonMapper.ensureInitialized()
        .encodeJson<TextLesson>(this as TextLesson);
  }

  Map<String, dynamic> toMap() {
    return TextLessonMapper.ensureInitialized()
        .encodeMap<TextLesson>(this as TextLesson);
  }

  TextLessonCopyWith<TextLesson, TextLesson, TextLesson> get copyWith =>
      _TextLessonCopyWithImpl(this as TextLesson, $identity, $identity);
  @override
  String toString() {
    return TextLessonMapper.ensureInitialized()
        .stringifyValue(this as TextLesson);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonMapper.ensureInitialized()
        .equalsValue(this as TextLesson, other);
  }

  @override
  int get hashCode {
    return TextLessonMapper.ensureInitialized().hashValue(this as TextLesson);
  }
}

extension TextLessonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLesson, $Out> {
  TextLessonCopyWith<$R, TextLesson, $Out> get $asTextLesson =>
      $base.as((v, t, t2) => _TextLessonCopyWithImpl(v, t, t2));
}

abstract class TextLessonCopyWith<$R, $In extends TextLesson, $Out>
    implements LessonCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, String? content, bool? isCompleted});
  TextLessonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextLessonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLesson, $Out>
    implements TextLessonCopyWith<$R, TextLesson, $Out> {
  _TextLessonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLesson> $mapper =
      TextLessonMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? title = $none,
          Object? content = $none,
          Object? isCompleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (content != $none) #content: content,
        if (isCompleted != $none) #isCompleted: isCompleted
      }));
  @override
  TextLesson $make(CopyWithData data) => TextLesson(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      content: data.get(#content, or: $value.content),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  TextLessonCopyWith<$R2, TextLesson, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonCopyWithImpl($value, $cast, t);
}

class VideoLessonMapper extends SubClassMapperBase<VideoLesson> {
  VideoLessonMapper._();

  static VideoLessonMapper? _instance;
  static VideoLessonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonMapper._());
      LessonMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLesson';

  static String _$id(VideoLesson v) => v.id;
  static const Field<VideoLesson, String> _f$id = Field('id', _$id);
  static String? _$title(VideoLesson v) => v.title;
  static const Field<VideoLesson, String> _f$title = Field('title', _$title);
  static String? _$url(VideoLesson v) => v.url;
  static const Field<VideoLesson, String> _f$url = Field('url', _$url);
  static bool? _$isHorizontal(VideoLesson v) => v.isHorizontal;
  static const Field<VideoLesson, bool> _f$isHorizontal =
      Field('isHorizontal', _$isHorizontal);
  static bool? _$isCompleted(VideoLesson v) => v.isCompleted;
  static const Field<VideoLesson, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<VideoLesson> fields = const {
    #id: _f$id,
    #title: _f$title,
    #url: _f$url,
    #isHorizontal: _f$isHorizontal,
    #isCompleted: _f$isCompleted,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'video';
  @override
  late final ClassMapperBase superMapper = LessonMapper.ensureInitialized();

  static VideoLesson _instantiate(DecodingData data) {
    return VideoLesson(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        url: data.dec(_f$url),
        isHorizontal: data.dec(_f$isHorizontal),
        isCompleted: data.dec(_f$isCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLesson fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLesson>(map);
  }

  static VideoLesson fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLesson>(json);
  }
}

mixin VideoLessonMappable {
  String toJson() {
    return VideoLessonMapper.ensureInitialized()
        .encodeJson<VideoLesson>(this as VideoLesson);
  }

  Map<String, dynamic> toMap() {
    return VideoLessonMapper.ensureInitialized()
        .encodeMap<VideoLesson>(this as VideoLesson);
  }

  VideoLessonCopyWith<VideoLesson, VideoLesson, VideoLesson> get copyWith =>
      _VideoLessonCopyWithImpl(this as VideoLesson, $identity, $identity);
  @override
  String toString() {
    return VideoLessonMapper.ensureInitialized()
        .stringifyValue(this as VideoLesson);
  }

  @override
  bool operator ==(Object other) {
    return VideoLessonMapper.ensureInitialized()
        .equalsValue(this as VideoLesson, other);
  }

  @override
  int get hashCode {
    return VideoLessonMapper.ensureInitialized().hashValue(this as VideoLesson);
  }
}

extension VideoLessonValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoLesson, $Out> {
  VideoLessonCopyWith<$R, VideoLesson, $Out> get $asVideoLesson =>
      $base.as((v, t, t2) => _VideoLessonCopyWithImpl(v, t, t2));
}

abstract class VideoLessonCopyWith<$R, $In extends VideoLesson, $Out>
    implements LessonCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? title,
      String? url,
      bool? isHorizontal,
      bool? isCompleted});
  VideoLessonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VideoLessonCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoLesson, $Out>
    implements VideoLessonCopyWith<$R, VideoLesson, $Out> {
  _VideoLessonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoLesson> $mapper =
      VideoLessonMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? title = $none,
          Object? url = $none,
          Object? isHorizontal = $none,
          Object? isCompleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (url != $none) #url: url,
        if (isHorizontal != $none) #isHorizontal: isHorizontal,
        if (isCompleted != $none) #isCompleted: isCompleted
      }));
  @override
  VideoLesson $make(CopyWithData data) => VideoLesson(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      url: data.get(#url, or: $value.url),
      isHorizontal: data.get(#isHorizontal, or: $value.isHorizontal),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  VideoLessonCopyWith<$R2, VideoLesson, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoLessonCopyWithImpl($value, $cast, t);
}
