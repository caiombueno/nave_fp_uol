// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../upsert_task_selected_sort_key_sm.dart';

class UpsertTaskSelectedSortKeySMMapper
    extends ClassMapperBase<UpsertTaskSelectedSortKeySM> {
  UpsertTaskSelectedSortKeySMMapper._();

  static UpsertTaskSelectedSortKeySMMapper? _instance;
  static UpsertTaskSelectedSortKeySMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UpsertTaskSelectedSortKeySMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpsertTaskSelectedSortKeySM';

  static String? _$taskId(UpsertTaskSelectedSortKeySM v) => v.taskId;
  static const Field<UpsertTaskSelectedSortKeySM, String> _f$taskId =
      Field('taskId', _$taskId, key: r'id');
  static double _$selectedSortKey(UpsertTaskSelectedSortKeySM v) =>
      v.selectedSortKey;
  static const Field<UpsertTaskSelectedSortKeySM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<UpsertTaskSelectedSortKeySM> fields = const {
    #taskId: _f$taskId,
    #selectedSortKey: _f$selectedSortKey,
  };

  static UpsertTaskSelectedSortKeySM _instantiate(DecodingData data) {
    return UpsertTaskSelectedSortKeySM(
        taskId: data.dec(_f$taskId),
        selectedSortKey: data.dec(_f$selectedSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static UpsertTaskSelectedSortKeySM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpsertTaskSelectedSortKeySM>(map);
  }

  static UpsertTaskSelectedSortKeySM fromJson(String json) {
    return ensureInitialized().decodeJson<UpsertTaskSelectedSortKeySM>(json);
  }
}

mixin UpsertTaskSelectedSortKeySMMappable {
  String toJson() {
    return UpsertTaskSelectedSortKeySMMapper.ensureInitialized()
        .encodeJson<UpsertTaskSelectedSortKeySM>(
            this as UpsertTaskSelectedSortKeySM);
  }

  Map<String, dynamic> toMap() {
    return UpsertTaskSelectedSortKeySMMapper.ensureInitialized()
        .encodeMap<UpsertTaskSelectedSortKeySM>(
            this as UpsertTaskSelectedSortKeySM);
  }

  UpsertTaskSelectedSortKeySMCopyWith<UpsertTaskSelectedSortKeySM,
          UpsertTaskSelectedSortKeySM, UpsertTaskSelectedSortKeySM>
      get copyWith => _UpsertTaskSelectedSortKeySMCopyWithImpl(
          this as UpsertTaskSelectedSortKeySM, $identity, $identity);
  @override
  String toString() {
    return UpsertTaskSelectedSortKeySMMapper.ensureInitialized()
        .stringifyValue(this as UpsertTaskSelectedSortKeySM);
  }

  @override
  bool operator ==(Object other) {
    return UpsertTaskSelectedSortKeySMMapper.ensureInitialized()
        .equalsValue(this as UpsertTaskSelectedSortKeySM, other);
  }

  @override
  int get hashCode {
    return UpsertTaskSelectedSortKeySMMapper.ensureInitialized()
        .hashValue(this as UpsertTaskSelectedSortKeySM);
  }
}

extension UpsertTaskSelectedSortKeySMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpsertTaskSelectedSortKeySM, $Out> {
  UpsertTaskSelectedSortKeySMCopyWith<$R, UpsertTaskSelectedSortKeySM, $Out>
      get $asUpsertTaskSelectedSortKeySM => $base
          .as((v, t, t2) => _UpsertTaskSelectedSortKeySMCopyWithImpl(v, t, t2));
}

abstract class UpsertTaskSelectedSortKeySMCopyWith<
    $R,
    $In extends UpsertTaskSelectedSortKeySM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? taskId, double? selectedSortKey});
  UpsertTaskSelectedSortKeySMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpsertTaskSelectedSortKeySMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpsertTaskSelectedSortKeySM, $Out>
    implements
        UpsertTaskSelectedSortKeySMCopyWith<$R, UpsertTaskSelectedSortKeySM,
            $Out> {
  _UpsertTaskSelectedSortKeySMCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpsertTaskSelectedSortKeySM> $mapper =
      UpsertTaskSelectedSortKeySMMapper.ensureInitialized();
  @override
  $R call({Object? taskId = $none, double? selectedSortKey}) =>
      $apply(FieldCopyWithData({
        if (taskId != $none) #taskId: taskId,
        if (selectedSortKey != null) #selectedSortKey: selectedSortKey
      }));
  @override
  UpsertTaskSelectedSortKeySM $make(CopyWithData data) =>
      UpsertTaskSelectedSortKeySM(
          taskId: data.get(#taskId, or: $value.taskId),
          selectedSortKey:
              data.get(#selectedSortKey, or: $value.selectedSortKey));

  @override
  UpsertTaskSelectedSortKeySMCopyWith<$R2, UpsertTaskSelectedSortKeySM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpsertTaskSelectedSortKeySMCopyWithImpl($value, $cast, t);
}
