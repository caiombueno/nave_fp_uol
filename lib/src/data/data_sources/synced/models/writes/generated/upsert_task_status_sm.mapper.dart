// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../upsert_task_status_sm.dart';

class UpsertTaskStatusSMMapper extends ClassMapperBase<UpsertTaskStatusSM> {
  UpsertTaskStatusSMMapper._();

  static UpsertTaskStatusSMMapper? _instance;
  static UpsertTaskStatusSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpsertTaskStatusSMMapper._());
      TaskStatusSMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpsertTaskStatusSM';

  static String? _$taskId(UpsertTaskStatusSM v) => v.taskId;
  static const Field<UpsertTaskStatusSM, String> _f$taskId =
      Field('taskId', _$taskId, key: r'id');
  static TaskStatusSM? _$status(UpsertTaskStatusSM v) => v.status;
  static const Field<UpsertTaskStatusSM, TaskStatusSM> _f$status =
      Field('status', _$status);
  static FieldValue _$lastStatusUpdateDateTime(UpsertTaskStatusSM v) =>
      v.lastStatusUpdateDateTime;
  static const Field<UpsertTaskStatusSM, FieldValue>
      _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static double _$selectedSortKey(UpsertTaskStatusSM v) => v.selectedSortKey;
  static const Field<UpsertTaskStatusSM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<UpsertTaskStatusSM> fields = const {
    #taskId: _f$taskId,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #selectedSortKey: _f$selectedSortKey,
  };

  static UpsertTaskStatusSM _instantiate(DecodingData data) {
    return UpsertTaskStatusSM.fromMappable(
        taskId: data.dec(_f$taskId),
        status: data.dec(_f$status),
        lastStatusUpdateDateTime: data.dec(_f$lastStatusUpdateDateTime),
        selectedSortKey: data.dec(_f$selectedSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static UpsertTaskStatusSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpsertTaskStatusSM>(map);
  }

  static UpsertTaskStatusSM fromJson(String json) {
    return ensureInitialized().decodeJson<UpsertTaskStatusSM>(json);
  }
}

mixin UpsertTaskStatusSMMappable {
  String toJson() {
    return UpsertTaskStatusSMMapper.ensureInitialized()
        .encodeJson<UpsertTaskStatusSM>(this as UpsertTaskStatusSM);
  }

  Map<String, dynamic> toMap() {
    return UpsertTaskStatusSMMapper.ensureInitialized()
        .encodeMap<UpsertTaskStatusSM>(this as UpsertTaskStatusSM);
  }

  UpsertTaskStatusSMCopyWith<UpsertTaskStatusSM, UpsertTaskStatusSM,
          UpsertTaskStatusSM>
      get copyWith => _UpsertTaskStatusSMCopyWithImpl(
          this as UpsertTaskStatusSM, $identity, $identity);
  @override
  String toString() {
    return UpsertTaskStatusSMMapper.ensureInitialized()
        .stringifyValue(this as UpsertTaskStatusSM);
  }

  @override
  bool operator ==(Object other) {
    return UpsertTaskStatusSMMapper.ensureInitialized()
        .equalsValue(this as UpsertTaskStatusSM, other);
  }

  @override
  int get hashCode {
    return UpsertTaskStatusSMMapper.ensureInitialized()
        .hashValue(this as UpsertTaskStatusSM);
  }
}

extension UpsertTaskStatusSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpsertTaskStatusSM, $Out> {
  UpsertTaskStatusSMCopyWith<$R, UpsertTaskStatusSM, $Out>
      get $asUpsertTaskStatusSM =>
          $base.as((v, t, t2) => _UpsertTaskStatusSMCopyWithImpl(v, t, t2));
}

abstract class UpsertTaskStatusSMCopyWith<$R, $In extends UpsertTaskStatusSM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? taskId,
      TaskStatusSM? status,
      FieldValue? lastStatusUpdateDateTime,
      double? selectedSortKey});
  UpsertTaskStatusSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpsertTaskStatusSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpsertTaskStatusSM, $Out>
    implements UpsertTaskStatusSMCopyWith<$R, UpsertTaskStatusSM, $Out> {
  _UpsertTaskStatusSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpsertTaskStatusSM> $mapper =
      UpsertTaskStatusSMMapper.ensureInitialized();
  @override
  $R call(
          {Object? taskId = $none,
          Object? status = $none,
          FieldValue? lastStatusUpdateDateTime,
          double? selectedSortKey}) =>
      $apply(FieldCopyWithData({
        if (taskId != $none) #taskId: taskId,
        if (status != $none) #status: status,
        if (lastStatusUpdateDateTime != null)
          #lastStatusUpdateDateTime: lastStatusUpdateDateTime,
        if (selectedSortKey != null) #selectedSortKey: selectedSortKey
      }));
  @override
  UpsertTaskStatusSM $make(CopyWithData data) =>
      UpsertTaskStatusSM.fromMappable(
          taskId: data.get(#taskId, or: $value.taskId),
          status: data.get(#status, or: $value.status),
          lastStatusUpdateDateTime: data.get(#lastStatusUpdateDateTime,
              or: $value.lastStatusUpdateDateTime),
          selectedSortKey:
              data.get(#selectedSortKey, or: $value.selectedSortKey));

  @override
  UpsertTaskStatusSMCopyWith<$R2, UpsertTaskStatusSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpsertTaskStatusSMCopyWithImpl($value, $cast, t);
}
