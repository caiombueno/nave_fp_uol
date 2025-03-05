// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../lesson_user_data_sm.dart';

class LessonUserDataSMMapper extends ClassMapperBase<LessonUserDataSM> {
  LessonUserDataSMMapper._();

  static LessonUserDataSMMapper? _instance;
  static LessonUserDataSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LessonUserDataSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LessonUserDataSM';

  static String _$lessonId(LessonUserDataSM v) => v.lessonId;
  static const Field<LessonUserDataSM, String> _f$lessonId =
      Field('lessonId', _$lessonId, key: r'id');
  static bool? _$isCompleted(LessonUserDataSM v) => v.isCompleted;
  static const Field<LessonUserDataSM, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<LessonUserDataSM> fields = const {
    #lessonId: _f$lessonId,
    #isCompleted: _f$isCompleted,
  };

  static LessonUserDataSM _instantiate(DecodingData data) {
    return LessonUserDataSM(
        lessonId: data.dec(_f$lessonId), isCompleted: data.dec(_f$isCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static LessonUserDataSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LessonUserDataSM>(map);
  }

  static LessonUserDataSM fromJson(String json) {
    return ensureInitialized().decodeJson<LessonUserDataSM>(json);
  }
}

mixin LessonUserDataSMMappable {
  String toJson() {
    return LessonUserDataSMMapper.ensureInitialized()
        .encodeJson<LessonUserDataSM>(this as LessonUserDataSM);
  }

  Map<String, dynamic> toMap() {
    return LessonUserDataSMMapper.ensureInitialized()
        .encodeMap<LessonUserDataSM>(this as LessonUserDataSM);
  }

  LessonUserDataSMCopyWith<LessonUserDataSM, LessonUserDataSM, LessonUserDataSM>
      get copyWith => _LessonUserDataSMCopyWithImpl(
          this as LessonUserDataSM, $identity, $identity);
  @override
  String toString() {
    return LessonUserDataSMMapper.ensureInitialized()
        .stringifyValue(this as LessonUserDataSM);
  }

  @override
  bool operator ==(Object other) {
    return LessonUserDataSMMapper.ensureInitialized()
        .equalsValue(this as LessonUserDataSM, other);
  }

  @override
  int get hashCode {
    return LessonUserDataSMMapper.ensureInitialized()
        .hashValue(this as LessonUserDataSM);
  }
}

extension LessonUserDataSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LessonUserDataSM, $Out> {
  LessonUserDataSMCopyWith<$R, LessonUserDataSM, $Out>
      get $asLessonUserDataSM =>
          $base.as((v, t, t2) => _LessonUserDataSMCopyWithImpl(v, t, t2));
}

abstract class LessonUserDataSMCopyWith<$R, $In extends LessonUserDataSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? lessonId, bool? isCompleted});
  LessonUserDataSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LessonUserDataSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LessonUserDataSM, $Out>
    implements LessonUserDataSMCopyWith<$R, LessonUserDataSM, $Out> {
  _LessonUserDataSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LessonUserDataSM> $mapper =
      LessonUserDataSMMapper.ensureInitialized();
  @override
  $R call({String? lessonId, Object? isCompleted = $none}) =>
      $apply(FieldCopyWithData({
        if (lessonId != null) #lessonId: lessonId,
        if (isCompleted != $none) #isCompleted: isCompleted
      }));
  @override
  LessonUserDataSM $make(CopyWithData data) => LessonUserDataSM(
      lessonId: data.get(#lessonId, or: $value.lessonId),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  LessonUserDataSMCopyWith<$R2, LessonUserDataSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LessonUserDataSMCopyWithImpl($value, $cast, t);
}
