// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../video_lesson_state.dart';

class VideoLessonStateMapper extends ClassMapperBase<VideoLessonState> {
  VideoLessonStateMapper._();

  static VideoLessonStateMapper? _instance;
  static VideoLessonStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonStateMapper._());
      VideoLessonLoadingMapper.ensureInitialized();
      VideoLessonLoadedMapper.ensureInitialized();
      VideoLessonFailedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLessonState';

  @override
  final MappableFields<VideoLessonState> fields = const {};

  static VideoLessonState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'VideoLessonState', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLessonState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLessonState>(map);
  }

  static VideoLessonState fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLessonState>(json);
  }
}

mixin VideoLessonStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  VideoLessonStateCopyWith<VideoLessonState, VideoLessonState, VideoLessonState>
      get copyWith;
}

abstract class VideoLessonStateCopyWith<$R, $In extends VideoLessonState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  VideoLessonStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class VideoLessonLoadingMapper extends SubClassMapperBase<VideoLessonLoading> {
  VideoLessonLoadingMapper._();

  static VideoLessonLoadingMapper? _instance;
  static VideoLessonLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonLoadingMapper._());
      VideoLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLessonLoading';

  @override
  final MappableFields<VideoLessonLoading> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'VideoLessonLoading';
  @override
  late final ClassMapperBase superMapper =
      VideoLessonStateMapper.ensureInitialized();

  static VideoLessonLoading _instantiate(DecodingData data) {
    return VideoLessonLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLessonLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLessonLoading>(map);
  }

  static VideoLessonLoading fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLessonLoading>(json);
  }
}

mixin VideoLessonLoadingMappable {
  String toJson() {
    return VideoLessonLoadingMapper.ensureInitialized()
        .encodeJson<VideoLessonLoading>(this as VideoLessonLoading);
  }

  Map<String, dynamic> toMap() {
    return VideoLessonLoadingMapper.ensureInitialized()
        .encodeMap<VideoLessonLoading>(this as VideoLessonLoading);
  }

  VideoLessonLoadingCopyWith<VideoLessonLoading, VideoLessonLoading,
          VideoLessonLoading>
      get copyWith => _VideoLessonLoadingCopyWithImpl(
          this as VideoLessonLoading, $identity, $identity);
  @override
  String toString() {
    return VideoLessonLoadingMapper.ensureInitialized()
        .stringifyValue(this as VideoLessonLoading);
  }

  @override
  bool operator ==(Object other) {
    return VideoLessonLoadingMapper.ensureInitialized()
        .equalsValue(this as VideoLessonLoading, other);
  }

  @override
  int get hashCode {
    return VideoLessonLoadingMapper.ensureInitialized()
        .hashValue(this as VideoLessonLoading);
  }
}

extension VideoLessonLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoLessonLoading, $Out> {
  VideoLessonLoadingCopyWith<$R, VideoLessonLoading, $Out>
      get $asVideoLessonLoading =>
          $base.as((v, t, t2) => _VideoLessonLoadingCopyWithImpl(v, t, t2));
}

abstract class VideoLessonLoadingCopyWith<$R, $In extends VideoLessonLoading,
    $Out> implements VideoLessonStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  VideoLessonLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VideoLessonLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoLessonLoading, $Out>
    implements VideoLessonLoadingCopyWith<$R, VideoLessonLoading, $Out> {
  _VideoLessonLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoLessonLoading> $mapper =
      VideoLessonLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  VideoLessonLoading $make(CopyWithData data) => VideoLessonLoading();

  @override
  VideoLessonLoadingCopyWith<$R2, VideoLessonLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoLessonLoadingCopyWithImpl($value, $cast, t);
}

class VideoLessonLoadedMapper extends SubClassMapperBase<VideoLessonLoaded> {
  VideoLessonLoadedMapper._();

  static VideoLessonLoadedMapper? _instance;
  static VideoLessonLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonLoadedMapper._());
      VideoLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLessonLoaded';

  static String _$lessonUrl(VideoLessonLoaded v) => v.lessonUrl;
  static const Field<VideoLessonLoaded, String> _f$lessonUrl =
      Field('lessonUrl', _$lessonUrl);
  static Orientation _$videoOrientation(VideoLessonLoaded v) =>
      v.videoOrientation;
  static const Field<VideoLessonLoaded, Orientation> _f$videoOrientation =
      Field('videoOrientation', _$videoOrientation);

  @override
  final MappableFields<VideoLessonLoaded> fields = const {
    #lessonUrl: _f$lessonUrl,
    #videoOrientation: _f$videoOrientation,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'VideoLessonLoaded';
  @override
  late final ClassMapperBase superMapper =
      VideoLessonStateMapper.ensureInitialized();

  static VideoLessonLoaded _instantiate(DecodingData data) {
    return VideoLessonLoaded(
        lessonUrl: data.dec(_f$lessonUrl),
        videoOrientation: data.dec(_f$videoOrientation));
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLessonLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLessonLoaded>(map);
  }

  static VideoLessonLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLessonLoaded>(json);
  }
}

mixin VideoLessonLoadedMappable {
  String toJson() {
    return VideoLessonLoadedMapper.ensureInitialized()
        .encodeJson<VideoLessonLoaded>(this as VideoLessonLoaded);
  }

  Map<String, dynamic> toMap() {
    return VideoLessonLoadedMapper.ensureInitialized()
        .encodeMap<VideoLessonLoaded>(this as VideoLessonLoaded);
  }

  VideoLessonLoadedCopyWith<VideoLessonLoaded, VideoLessonLoaded,
          VideoLessonLoaded>
      get copyWith => _VideoLessonLoadedCopyWithImpl(
          this as VideoLessonLoaded, $identity, $identity);
  @override
  String toString() {
    return VideoLessonLoadedMapper.ensureInitialized()
        .stringifyValue(this as VideoLessonLoaded);
  }

  @override
  bool operator ==(Object other) {
    return VideoLessonLoadedMapper.ensureInitialized()
        .equalsValue(this as VideoLessonLoaded, other);
  }

  @override
  int get hashCode {
    return VideoLessonLoadedMapper.ensureInitialized()
        .hashValue(this as VideoLessonLoaded);
  }
}

extension VideoLessonLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoLessonLoaded, $Out> {
  VideoLessonLoadedCopyWith<$R, VideoLessonLoaded, $Out>
      get $asVideoLessonLoaded =>
          $base.as((v, t, t2) => _VideoLessonLoadedCopyWithImpl(v, t, t2));
}

abstract class VideoLessonLoadedCopyWith<$R, $In extends VideoLessonLoaded,
    $Out> implements VideoLessonStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? lessonUrl, Orientation? videoOrientation});
  VideoLessonLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VideoLessonLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoLessonLoaded, $Out>
    implements VideoLessonLoadedCopyWith<$R, VideoLessonLoaded, $Out> {
  _VideoLessonLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoLessonLoaded> $mapper =
      VideoLessonLoadedMapper.ensureInitialized();
  @override
  $R call({String? lessonUrl, Orientation? videoOrientation}) =>
      $apply(FieldCopyWithData({
        if (lessonUrl != null) #lessonUrl: lessonUrl,
        if (videoOrientation != null) #videoOrientation: videoOrientation
      }));
  @override
  VideoLessonLoaded $make(CopyWithData data) => VideoLessonLoaded(
      lessonUrl: data.get(#lessonUrl, or: $value.lessonUrl),
      videoOrientation:
          data.get(#videoOrientation, or: $value.videoOrientation));

  @override
  VideoLessonLoadedCopyWith<$R2, VideoLessonLoaded, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoLessonLoadedCopyWithImpl($value, $cast, t);
}

class VideoLessonFailedMapper extends SubClassMapperBase<VideoLessonFailed> {
  VideoLessonFailedMapper._();

  static VideoLessonFailedMapper? _instance;
  static VideoLessonFailedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoLessonFailedMapper._());
      VideoLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VideoLessonFailed';

  @override
  final MappableFields<VideoLessonFailed> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'VideoLessonFailed';
  @override
  late final ClassMapperBase superMapper =
      VideoLessonStateMapper.ensureInitialized();

  static VideoLessonFailed _instantiate(DecodingData data) {
    return VideoLessonFailed();
  }

  @override
  final Function instantiate = _instantiate;

  static VideoLessonFailed fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoLessonFailed>(map);
  }

  static VideoLessonFailed fromJson(String json) {
    return ensureInitialized().decodeJson<VideoLessonFailed>(json);
  }
}

mixin VideoLessonFailedMappable {
  String toJson() {
    return VideoLessonFailedMapper.ensureInitialized()
        .encodeJson<VideoLessonFailed>(this as VideoLessonFailed);
  }

  Map<String, dynamic> toMap() {
    return VideoLessonFailedMapper.ensureInitialized()
        .encodeMap<VideoLessonFailed>(this as VideoLessonFailed);
  }

  VideoLessonFailedCopyWith<VideoLessonFailed, VideoLessonFailed,
          VideoLessonFailed>
      get copyWith => _VideoLessonFailedCopyWithImpl(
          this as VideoLessonFailed, $identity, $identity);
  @override
  String toString() {
    return VideoLessonFailedMapper.ensureInitialized()
        .stringifyValue(this as VideoLessonFailed);
  }

  @override
  bool operator ==(Object other) {
    return VideoLessonFailedMapper.ensureInitialized()
        .equalsValue(this as VideoLessonFailed, other);
  }

  @override
  int get hashCode {
    return VideoLessonFailedMapper.ensureInitialized()
        .hashValue(this as VideoLessonFailed);
  }
}

extension VideoLessonFailedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoLessonFailed, $Out> {
  VideoLessonFailedCopyWith<$R, VideoLessonFailed, $Out>
      get $asVideoLessonFailed =>
          $base.as((v, t, t2) => _VideoLessonFailedCopyWithImpl(v, t, t2));
}

abstract class VideoLessonFailedCopyWith<$R, $In extends VideoLessonFailed,
    $Out> implements VideoLessonStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  VideoLessonFailedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VideoLessonFailedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoLessonFailed, $Out>
    implements VideoLessonFailedCopyWith<$R, VideoLessonFailed, $Out> {
  _VideoLessonFailedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoLessonFailed> $mapper =
      VideoLessonFailedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  VideoLessonFailed $make(CopyWithData data) => VideoLessonFailed();

  @override
  VideoLessonFailedCopyWith<$R2, VideoLessonFailed, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoLessonFailedCopyWithImpl($value, $cast, t);
}
