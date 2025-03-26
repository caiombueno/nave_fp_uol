// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../create_user_task_sm.dart';

class CreateUserTaskSMMapper extends ClassMapperBase<CreateUserTaskSM> {
  CreateUserTaskSMMapper._();

  static CreateUserTaskSMMapper? _instance;
  static CreateUserTaskSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CreateUserTaskSMMapper._());
      TaskStatusSMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CreateUserTaskSM';

  static String _$title(CreateUserTaskSM v) => v.title;
  static const Field<CreateUserTaskSM, String> _f$title =
      Field('title', _$title);
  static double _$selectedSortKey(CreateUserTaskSM v) => v.selectedSortKey;
  static const Field<CreateUserTaskSM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);
  static FieldValue _$creationDateTime(CreateUserTaskSM v) =>
      v.creationDateTime;
  static const Field<CreateUserTaskSM, FieldValue> _f$creationDateTime =
      Field('creationDateTime', _$creationDateTime);
  static TaskStatusSM? _$status(CreateUserTaskSM v) => v.status;
  static const Field<CreateUserTaskSM, TaskStatusSM> _f$status =
      Field('status', _$status);

  @override
  final MappableFields<CreateUserTaskSM> fields = const {
    #title: _f$title,
    #selectedSortKey: _f$selectedSortKey,
    #creationDateTime: _f$creationDateTime,
    #status: _f$status,
  };

  static CreateUserTaskSM _instantiate(DecodingData data) {
    return CreateUserTaskSM.fromMappable(
        title: data.dec(_f$title),
        selectedSortKey: data.dec(_f$selectedSortKey),
        creationDateTime: data.dec(_f$creationDateTime),
        status: data.dec(_f$status));
  }

  @override
  final Function instantiate = _instantiate;

  static CreateUserTaskSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CreateUserTaskSM>(map);
  }

  static CreateUserTaskSM fromJson(String json) {
    return ensureInitialized().decodeJson<CreateUserTaskSM>(json);
  }
}

mixin CreateUserTaskSMMappable {
  String toJson() {
    return CreateUserTaskSMMapper.ensureInitialized()
        .encodeJson<CreateUserTaskSM>(this as CreateUserTaskSM);
  }

  Map<String, dynamic> toMap() {
    return CreateUserTaskSMMapper.ensureInitialized()
        .encodeMap<CreateUserTaskSM>(this as CreateUserTaskSM);
  }

  CreateUserTaskSMCopyWith<CreateUserTaskSM, CreateUserTaskSM, CreateUserTaskSM>
      get copyWith => _CreateUserTaskSMCopyWithImpl(
          this as CreateUserTaskSM, $identity, $identity);
  @override
  String toString() {
    return CreateUserTaskSMMapper.ensureInitialized()
        .stringifyValue(this as CreateUserTaskSM);
  }

  @override
  bool operator ==(Object other) {
    return CreateUserTaskSMMapper.ensureInitialized()
        .equalsValue(this as CreateUserTaskSM, other);
  }

  @override
  int get hashCode {
    return CreateUserTaskSMMapper.ensureInitialized()
        .hashValue(this as CreateUserTaskSM);
  }
}

extension CreateUserTaskSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CreateUserTaskSM, $Out> {
  CreateUserTaskSMCopyWith<$R, CreateUserTaskSM, $Out>
      get $asCreateUserTaskSM =>
          $base.as((v, t, t2) => _CreateUserTaskSMCopyWithImpl(v, t, t2));
}

abstract class CreateUserTaskSMCopyWith<$R, $In extends CreateUserTaskSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? title,
      double? selectedSortKey,
      FieldValue? creationDateTime,
      TaskStatusSM? status});
  CreateUserTaskSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CreateUserTaskSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CreateUserTaskSM, $Out>
    implements CreateUserTaskSMCopyWith<$R, CreateUserTaskSM, $Out> {
  _CreateUserTaskSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CreateUserTaskSM> $mapper =
      CreateUserTaskSMMapper.ensureInitialized();
  @override
  $R call(
          {String? title,
          double? selectedSortKey,
          FieldValue? creationDateTime,
          Object? status = $none}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (selectedSortKey != null) #selectedSortKey: selectedSortKey,
        if (creationDateTime != null) #creationDateTime: creationDateTime,
        if (status != $none) #status: status
      }));
  @override
  CreateUserTaskSM $make(CopyWithData data) => CreateUserTaskSM.fromMappable(
      title: data.get(#title, or: $value.title),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey),
      creationDateTime:
          data.get(#creationDateTime, or: $value.creationDateTime),
      status: data.get(#status, or: $value.status));

  @override
  CreateUserTaskSMCopyWith<$R2, CreateUserTaskSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CreateUserTaskSMCopyWithImpl($value, $cast, t);
}
