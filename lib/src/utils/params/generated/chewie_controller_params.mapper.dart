// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../chewie_controller_params.dart';

class ChewieControllerParamsMapper
    extends ClassMapperBase<ChewieControllerParams> {
  ChewieControllerParamsMapper._();

  static ChewieControllerParamsMapper? _instance;
  static ChewieControllerParamsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChewieControllerParamsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChewieControllerParams';

  static double? _$aspectRatio(ChewieControllerParams v) => v.aspectRatio;
  static const Field<ChewieControllerParams, double> _f$aspectRatio =
      Field('aspectRatio', _$aspectRatio, opt: true);
  static double _$maxScale(ChewieControllerParams v) => v.maxScale;
  static const Field<ChewieControllerParams, double> _f$maxScale =
      Field('maxScale', _$maxScale, opt: true, def: 2.5);
  static bool _$allowedScreenSleep(ChewieControllerParams v) =>
      v.allowedScreenSleep;
  static const Field<ChewieControllerParams, bool> _f$allowedScreenSleep =
      Field('allowedScreenSleep', _$allowedScreenSleep, opt: true, def: true);
  static VideoPlayerController _$videoPlayerController(
          ChewieControllerParams v) =>
      v.videoPlayerController;
  static const Field<ChewieControllerParams, VideoPlayerController>
      _f$videoPlayerController =
      Field('videoPlayerController', _$videoPlayerController);
  static bool _$autoInitialize(ChewieControllerParams v) => v.autoInitialize;
  static const Field<ChewieControllerParams, bool> _f$autoInitialize =
      Field('autoInitialize', _$autoInitialize, opt: true, def: false);
  static List<DeviceOrientation>? _$deviceOrientationsOnEnterFullScreen(
          ChewieControllerParams v) =>
      v.deviceOrientationsOnEnterFullScreen;
  static const Field<ChewieControllerParams, List<DeviceOrientation>>
      _f$deviceOrientationsOnEnterFullScreen = Field(
          'deviceOrientationsOnEnterFullScreen',
          _$deviceOrientationsOnEnterFullScreen,
          opt: true);
  static List<DeviceOrientation> _$deviceOrientationsAfterFullScreen(
          ChewieControllerParams v) =>
      v.deviceOrientationsAfterFullScreen;
  static const Field<ChewieControllerParams, List<DeviceOrientation>>
      _f$deviceOrientationsAfterFullScreen = Field(
          'deviceOrientationsAfterFullScreen',
          _$deviceOrientationsAfterFullScreen,
          opt: true,
          def: DeviceOrientation.values);
  static ChewieProgressColors? _$materialProgressColors(
          ChewieControllerParams v) =>
      v.materialProgressColors;
  static const Field<ChewieControllerParams, ChewieProgressColors>
      _f$materialProgressColors =
      Field('materialProgressColors', _$materialProgressColors, opt: true);

  @override
  final MappableFields<ChewieControllerParams> fields = const {
    #aspectRatio: _f$aspectRatio,
    #maxScale: _f$maxScale,
    #allowedScreenSleep: _f$allowedScreenSleep,
    #videoPlayerController: _f$videoPlayerController,
    #autoInitialize: _f$autoInitialize,
    #deviceOrientationsOnEnterFullScreen:
        _f$deviceOrientationsOnEnterFullScreen,
    #deviceOrientationsAfterFullScreen: _f$deviceOrientationsAfterFullScreen,
    #materialProgressColors: _f$materialProgressColors,
  };

  static ChewieControllerParams _instantiate(DecodingData data) {
    return ChewieControllerParams(
        aspectRatio: data.dec(_f$aspectRatio),
        maxScale: data.dec(_f$maxScale),
        allowedScreenSleep: data.dec(_f$allowedScreenSleep),
        videoPlayerController: data.dec(_f$videoPlayerController),
        autoInitialize: data.dec(_f$autoInitialize),
        deviceOrientationsOnEnterFullScreen:
            data.dec(_f$deviceOrientationsOnEnterFullScreen),
        deviceOrientationsAfterFullScreen:
            data.dec(_f$deviceOrientationsAfterFullScreen),
        materialProgressColors: data.dec(_f$materialProgressColors));
  }

  @override
  final Function instantiate = _instantiate;

  static ChewieControllerParams fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChewieControllerParams>(map);
  }

  static ChewieControllerParams fromJson(String json) {
    return ensureInitialized().decodeJson<ChewieControllerParams>(json);
  }
}

mixin ChewieControllerParamsMappable {
  String toJson() {
    return ChewieControllerParamsMapper.ensureInitialized()
        .encodeJson<ChewieControllerParams>(this as ChewieControllerParams);
  }

  Map<String, dynamic> toMap() {
    return ChewieControllerParamsMapper.ensureInitialized()
        .encodeMap<ChewieControllerParams>(this as ChewieControllerParams);
  }

  ChewieControllerParamsCopyWith<ChewieControllerParams, ChewieControllerParams,
          ChewieControllerParams>
      get copyWith => _ChewieControllerParamsCopyWithImpl(
          this as ChewieControllerParams, $identity, $identity);
  @override
  String toString() {
    return ChewieControllerParamsMapper.ensureInitialized()
        .stringifyValue(this as ChewieControllerParams);
  }

  @override
  bool operator ==(Object other) {
    return ChewieControllerParamsMapper.ensureInitialized()
        .equalsValue(this as ChewieControllerParams, other);
  }

  @override
  int get hashCode {
    return ChewieControllerParamsMapper.ensureInitialized()
        .hashValue(this as ChewieControllerParams);
  }
}

extension ChewieControllerParamsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChewieControllerParams, $Out> {
  ChewieControllerParamsCopyWith<$R, ChewieControllerParams, $Out>
      get $asChewieControllerParams =>
          $base.as((v, t, t2) => _ChewieControllerParamsCopyWithImpl(v, t, t2));
}

abstract class ChewieControllerParamsCopyWith<
    $R,
    $In extends ChewieControllerParams,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, DeviceOrientation,
          ObjectCopyWith<$R, DeviceOrientation, DeviceOrientation>>?
      get deviceOrientationsOnEnterFullScreen;
  ListCopyWith<$R, DeviceOrientation,
          ObjectCopyWith<$R, DeviceOrientation, DeviceOrientation>>
      get deviceOrientationsAfterFullScreen;
  $R call(
      {double? aspectRatio,
      double? maxScale,
      bool? allowedScreenSleep,
      VideoPlayerController? videoPlayerController,
      bool? autoInitialize,
      List<DeviceOrientation>? deviceOrientationsOnEnterFullScreen,
      List<DeviceOrientation>? deviceOrientationsAfterFullScreen,
      ChewieProgressColors? materialProgressColors});
  ChewieControllerParamsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChewieControllerParamsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChewieControllerParams, $Out>
    implements
        ChewieControllerParamsCopyWith<$R, ChewieControllerParams, $Out> {
  _ChewieControllerParamsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChewieControllerParams> $mapper =
      ChewieControllerParamsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, DeviceOrientation,
          ObjectCopyWith<$R, DeviceOrientation, DeviceOrientation>>?
      get deviceOrientationsOnEnterFullScreen =>
          $value.deviceOrientationsOnEnterFullScreen != null
              ? ListCopyWith(
                  $value.deviceOrientationsOnEnterFullScreen!,
                  (v, t) => ObjectCopyWith(v, $identity, t),
                  (v) => call(deviceOrientationsOnEnterFullScreen: v))
              : null;
  @override
  ListCopyWith<$R, DeviceOrientation,
          ObjectCopyWith<$R, DeviceOrientation, DeviceOrientation>>
      get deviceOrientationsAfterFullScreen => ListCopyWith(
          $value.deviceOrientationsAfterFullScreen,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(deviceOrientationsAfterFullScreen: v));
  @override
  $R call(
          {Object? aspectRatio = $none,
          double? maxScale,
          bool? allowedScreenSleep,
          VideoPlayerController? videoPlayerController,
          bool? autoInitialize,
          Object? deviceOrientationsOnEnterFullScreen = $none,
          List<DeviceOrientation>? deviceOrientationsAfterFullScreen,
          Object? materialProgressColors = $none}) =>
      $apply(FieldCopyWithData({
        if (aspectRatio != $none) #aspectRatio: aspectRatio,
        if (maxScale != null) #maxScale: maxScale,
        if (allowedScreenSleep != null) #allowedScreenSleep: allowedScreenSleep,
        if (videoPlayerController != null)
          #videoPlayerController: videoPlayerController,
        if (autoInitialize != null) #autoInitialize: autoInitialize,
        if (deviceOrientationsOnEnterFullScreen != $none)
          #deviceOrientationsOnEnterFullScreen:
              deviceOrientationsOnEnterFullScreen,
        if (deviceOrientationsAfterFullScreen != null)
          #deviceOrientationsAfterFullScreen: deviceOrientationsAfterFullScreen,
        if (materialProgressColors != $none)
          #materialProgressColors: materialProgressColors
      }));
  @override
  ChewieControllerParams $make(CopyWithData data) => ChewieControllerParams(
      aspectRatio: data.get(#aspectRatio, or: $value.aspectRatio),
      maxScale: data.get(#maxScale, or: $value.maxScale),
      allowedScreenSleep:
          data.get(#allowedScreenSleep, or: $value.allowedScreenSleep),
      videoPlayerController:
          data.get(#videoPlayerController, or: $value.videoPlayerController),
      autoInitialize: data.get(#autoInitialize, or: $value.autoInitialize),
      deviceOrientationsOnEnterFullScreen: data.get(
          #deviceOrientationsOnEnterFullScreen,
          or: $value.deviceOrientationsOnEnterFullScreen),
      deviceOrientationsAfterFullScreen: data.get(
          #deviceOrientationsAfterFullScreen,
          or: $value.deviceOrientationsAfterFullScreen),
      materialProgressColors:
          data.get(#materialProgressColors, or: $value.materialProgressColors));

  @override
  ChewieControllerParamsCopyWith<$R2, ChewieControllerParams, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ChewieControllerParamsCopyWithImpl($value, $cast, t);
}
