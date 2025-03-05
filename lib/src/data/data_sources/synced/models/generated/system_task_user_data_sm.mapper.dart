// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../system_task_user_data_sm.dart';

class SystemTaskUserDataSMMapper extends ClassMapperBase<SystemTaskUserDataSM> {
  SystemTaskUserDataSMMapper._();

  static SystemTaskUserDataSMMapper? _instance;
  static SystemTaskUserDataSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SystemTaskUserDataSMMapper._());
      TaskStatusSMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SystemTaskUserDataSM';

  static String _$taskId(SystemTaskUserDataSM v) => v.taskId;
  static const Field<SystemTaskUserDataSM, String> _f$taskId =
      Field('taskId', _$taskId, key: r'id');
  static TaskStatusSM? _$status(SystemTaskUserDataSM v) => v.status;
  static const Field<SystemTaskUserDataSM, TaskStatusSM> _f$status =
      Field('status', _$status);
  static Timestamp? _$lastStatusUpdateDateTime(SystemTaskUserDataSM v) =>
      v.lastStatusUpdateDateTime;
  static const Field<SystemTaskUserDataSM, Timestamp>
      _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static double? _$selectedSortKey(SystemTaskUserDataSM v) => v.selectedSortKey;
  static const Field<SystemTaskUserDataSM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<SystemTaskUserDataSM> fields = const {
    #taskId: _f$taskId,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #selectedSortKey: _f$selectedSortKey,
  };

  static SystemTaskUserDataSM _instantiate(DecodingData data) {
    return SystemTaskUserDataSM(
        taskId: data.dec(_f$taskId),
        status: data.dec(_f$status),
        lastStatusUpdateDateTime: data.dec(_f$lastStatusUpdateDateTime),
        selectedSortKey: data.dec(_f$selectedSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static SystemTaskUserDataSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SystemTaskUserDataSM>(map);
  }

  static SystemTaskUserDataSM fromJson(String json) {
    return ensureInitialized().decodeJson<SystemTaskUserDataSM>(json);
  }
}

mixin SystemTaskUserDataSMMappable {
  String toJson() {
    return SystemTaskUserDataSMMapper.ensureInitialized()
        .encodeJson<SystemTaskUserDataSM>(this as SystemTaskUserDataSM);
  }

  Map<String, dynamic> toMap() {
    return SystemTaskUserDataSMMapper.ensureInitialized()
        .encodeMap<SystemTaskUserDataSM>(this as SystemTaskUserDataSM);
  }

  SystemTaskUserDataSMCopyWith<SystemTaskUserDataSM, SystemTaskUserDataSM,
          SystemTaskUserDataSM>
      get copyWith => _SystemTaskUserDataSMCopyWithImpl(
          this as SystemTaskUserDataSM, $identity, $identity);
  @override
  String toString() {
    return SystemTaskUserDataSMMapper.ensureInitialized()
        .stringifyValue(this as SystemTaskUserDataSM);
  }

  @override
  bool operator ==(Object other) {
    return SystemTaskUserDataSMMapper.ensureInitialized()
        .equalsValue(this as SystemTaskUserDataSM, other);
  }

  @override
  int get hashCode {
    return SystemTaskUserDataSMMapper.ensureInitialized()
        .hashValue(this as SystemTaskUserDataSM);
  }
}

extension SystemTaskUserDataSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SystemTaskUserDataSM, $Out> {
  SystemTaskUserDataSMCopyWith<$R, SystemTaskUserDataSM, $Out>
      get $asSystemTaskUserDataSM =>
          $base.as((v, t, t2) => _SystemTaskUserDataSMCopyWithImpl(v, t, t2));
}

abstract class SystemTaskUserDataSMCopyWith<
    $R,
    $In extends SystemTaskUserDataSM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? taskId,
      TaskStatusSM? status,
      Timestamp? lastStatusUpdateDateTime,
      double? selectedSortKey});
  SystemTaskUserDataSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SystemTaskUserDataSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SystemTaskUserDataSM, $Out>
    implements SystemTaskUserDataSMCopyWith<$R, SystemTaskUserDataSM, $Out> {
  _SystemTaskUserDataSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SystemTaskUserDataSM> $mapper =
      SystemTaskUserDataSMMapper.ensureInitialized();
  @override
  $R call(
          {String? taskId,
          Object? status = $none,
          Object? lastStatusUpdateDateTime = $none,
          Object? selectedSortKey = $none}) =>
      $apply(FieldCopyWithData({
        if (taskId != null) #taskId: taskId,
        if (status != $none) #status: status,
        if (lastStatusUpdateDateTime != $none)
          #lastStatusUpdateDateTime: lastStatusUpdateDateTime,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey
      }));
  @override
  SystemTaskUserDataSM $make(CopyWithData data) => SystemTaskUserDataSM(
      taskId: data.get(#taskId, or: $value.taskId),
      status: data.get(#status, or: $value.status),
      lastStatusUpdateDateTime: data.get(#lastStatusUpdateDateTime,
          or: $value.lastStatusUpdateDateTime),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey));

  @override
  SystemTaskUserDataSMCopyWith<$R2, SystemTaskUserDataSM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SystemTaskUserDataSMCopyWithImpl($value, $cast, t);
}
