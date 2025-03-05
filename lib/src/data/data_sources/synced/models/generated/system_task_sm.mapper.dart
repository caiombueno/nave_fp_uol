// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../system_task_sm.dart';

class SystemTaskSMMapper extends ClassMapperBase<SystemTaskSM> {
  SystemTaskSMMapper._();

  static SystemTaskSMMapper? _instance;
  static SystemTaskSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SystemTaskSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SystemTaskSM';

  static String _$id(SystemTaskSM v) => v.id;
  static const Field<SystemTaskSM, String> _f$id = Field('id', _$id);
  static String? _$title(SystemTaskSM v) => v.title;
  static const Field<SystemTaskSM, String> _f$title = Field('title', _$title);
  static String? _$descriptionContent(SystemTaskSM v) => v.descriptionContent;
  static const Field<SystemTaskSM, String> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static bool? _$isFree(SystemTaskSM v) => v.isFree;
  static const Field<SystemTaskSM, bool> _f$isFree = Field('isFree', _$isFree);
  static List<String>? _$blockingTaskIds(SystemTaskSM v) => v.blockingTaskIds;
  static const Field<SystemTaskSM, List<String>> _f$blockingTaskIds =
      Field('blockingTaskIds', _$blockingTaskIds);
  static int? _$defaultSortKey(SystemTaskSM v) => v.defaultSortKey;
  static const Field<SystemTaskSM, int> _f$defaultSortKey =
      Field('defaultSortKey', _$defaultSortKey);
  static List<String>? _$lessonIds(SystemTaskSM v) => v.lessonIds;
  static const Field<SystemTaskSM, List<String>> _f$lessonIds =
      Field('lessonIds', _$lessonIds);

  @override
  final MappableFields<SystemTaskSM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionContent: _f$descriptionContent,
    #isFree: _f$isFree,
    #blockingTaskIds: _f$blockingTaskIds,
    #defaultSortKey: _f$defaultSortKey,
    #lessonIds: _f$lessonIds,
  };

  static SystemTaskSM _instantiate(DecodingData data) {
    return SystemTaskSM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        descriptionContent: data.dec(_f$descriptionContent),
        isFree: data.dec(_f$isFree),
        blockingTaskIds: data.dec(_f$blockingTaskIds),
        defaultSortKey: data.dec(_f$defaultSortKey),
        lessonIds: data.dec(_f$lessonIds));
  }

  @override
  final Function instantiate = _instantiate;

  static SystemTaskSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SystemTaskSM>(map);
  }

  static SystemTaskSM fromJson(String json) {
    return ensureInitialized().decodeJson<SystemTaskSM>(json);
  }
}

mixin SystemTaskSMMappable {
  String toJson() {
    return SystemTaskSMMapper.ensureInitialized()
        .encodeJson<SystemTaskSM>(this as SystemTaskSM);
  }

  Map<String, dynamic> toMap() {
    return SystemTaskSMMapper.ensureInitialized()
        .encodeMap<SystemTaskSM>(this as SystemTaskSM);
  }

  SystemTaskSMCopyWith<SystemTaskSM, SystemTaskSM, SystemTaskSM> get copyWith =>
      _SystemTaskSMCopyWithImpl(this as SystemTaskSM, $identity, $identity);
  @override
  String toString() {
    return SystemTaskSMMapper.ensureInitialized()
        .stringifyValue(this as SystemTaskSM);
  }

  @override
  bool operator ==(Object other) {
    return SystemTaskSMMapper.ensureInitialized()
        .equalsValue(this as SystemTaskSM, other);
  }

  @override
  int get hashCode {
    return SystemTaskSMMapper.ensureInitialized()
        .hashValue(this as SystemTaskSM);
  }
}

extension SystemTaskSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SystemTaskSM, $Out> {
  SystemTaskSMCopyWith<$R, SystemTaskSM, $Out> get $asSystemTaskSM =>
      $base.as((v, t, t2) => _SystemTaskSMCopyWithImpl(v, t, t2));
}

abstract class SystemTaskSMCopyWith<$R, $In extends SystemTaskSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lessonIds;
  $R call(
      {String? id,
      String? title,
      String? descriptionContent,
      bool? isFree,
      List<String>? blockingTaskIds,
      int? defaultSortKey,
      List<String>? lessonIds});
  SystemTaskSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SystemTaskSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SystemTaskSM, $Out>
    implements SystemTaskSMCopyWith<$R, SystemTaskSM, $Out> {
  _SystemTaskSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SystemTaskSM> $mapper =
      SystemTaskSMMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds => $value.blockingTaskIds != null
          ? ListCopyWith(
              $value.blockingTaskIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(blockingTaskIds: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get lessonIds =>
      $value.lessonIds != null
          ? ListCopyWith(
              $value.lessonIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(lessonIds: v))
          : null;
  @override
  $R call(
          {String? id,
          Object? title = $none,
          Object? descriptionContent = $none,
          Object? isFree = $none,
          Object? blockingTaskIds = $none,
          Object? defaultSortKey = $none,
          Object? lessonIds = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (descriptionContent != $none)
          #descriptionContent: descriptionContent,
        if (isFree != $none) #isFree: isFree,
        if (blockingTaskIds != $none) #blockingTaskIds: blockingTaskIds,
        if (defaultSortKey != $none) #defaultSortKey: defaultSortKey,
        if (lessonIds != $none) #lessonIds: lessonIds
      }));
  @override
  SystemTaskSM $make(CopyWithData data) => SystemTaskSM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      descriptionContent:
          data.get(#descriptionContent, or: $value.descriptionContent),
      isFree: data.get(#isFree, or: $value.isFree),
      blockingTaskIds: data.get(#blockingTaskIds, or: $value.blockingTaskIds),
      defaultSortKey: data.get(#defaultSortKey, or: $value.defaultSortKey),
      lessonIds: data.get(#lessonIds, or: $value.lessonIds));

  @override
  SystemTaskSMCopyWith<$R2, SystemTaskSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SystemTaskSMCopyWithImpl($value, $cast, t);
}
