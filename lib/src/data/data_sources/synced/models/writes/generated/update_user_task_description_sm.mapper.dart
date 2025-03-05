// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../update_user_task_description_sm.dart';

class UpdateUserTaskDescriptionSMMapper
    extends ClassMapperBase<UpdateUserTaskDescriptionSM> {
  UpdateUserTaskDescriptionSMMapper._();

  static UpdateUserTaskDescriptionSMMapper? _instance;
  static UpdateUserTaskDescriptionSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UpdateUserTaskDescriptionSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserTaskDescriptionSM';

  static String? _$taskId(UpdateUserTaskDescriptionSM v) => v.taskId;
  static const Field<UpdateUserTaskDescriptionSM, String> _f$taskId =
      Field('taskId', _$taskId, key: r'id');
  static String _$newContent(UpdateUserTaskDescriptionSM v) => v.newContent;
  static const Field<UpdateUserTaskDescriptionSM, String> _f$newContent =
      Field('newContent', _$newContent, key: r'descriptionContent');

  @override
  final MappableFields<UpdateUserTaskDescriptionSM> fields = const {
    #taskId: _f$taskId,
    #newContent: _f$newContent,
  };

  static UpdateUserTaskDescriptionSM _instantiate(DecodingData data) {
    return UpdateUserTaskDescriptionSM(
        taskId: data.dec(_f$taskId), newContent: data.dec(_f$newContent));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserTaskDescriptionSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserTaskDescriptionSM>(map);
  }

  static UpdateUserTaskDescriptionSM fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUserTaskDescriptionSM>(json);
  }
}

mixin UpdateUserTaskDescriptionSMMappable {
  String toJson() {
    return UpdateUserTaskDescriptionSMMapper.ensureInitialized()
        .encodeJson<UpdateUserTaskDescriptionSM>(
            this as UpdateUserTaskDescriptionSM);
  }

  Map<String, dynamic> toMap() {
    return UpdateUserTaskDescriptionSMMapper.ensureInitialized()
        .encodeMap<UpdateUserTaskDescriptionSM>(
            this as UpdateUserTaskDescriptionSM);
  }

  UpdateUserTaskDescriptionSMCopyWith<UpdateUserTaskDescriptionSM,
          UpdateUserTaskDescriptionSM, UpdateUserTaskDescriptionSM>
      get copyWith => _UpdateUserTaskDescriptionSMCopyWithImpl(
          this as UpdateUserTaskDescriptionSM, $identity, $identity);
  @override
  String toString() {
    return UpdateUserTaskDescriptionSMMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserTaskDescriptionSM);
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserTaskDescriptionSMMapper.ensureInitialized()
        .equalsValue(this as UpdateUserTaskDescriptionSM, other);
  }

  @override
  int get hashCode {
    return UpdateUserTaskDescriptionSMMapper.ensureInitialized()
        .hashValue(this as UpdateUserTaskDescriptionSM);
  }
}

extension UpdateUserTaskDescriptionSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserTaskDescriptionSM, $Out> {
  UpdateUserTaskDescriptionSMCopyWith<$R, UpdateUserTaskDescriptionSM, $Out>
      get $asUpdateUserTaskDescriptionSM => $base
          .as((v, t, t2) => _UpdateUserTaskDescriptionSMCopyWithImpl(v, t, t2));
}

abstract class UpdateUserTaskDescriptionSMCopyWith<
    $R,
    $In extends UpdateUserTaskDescriptionSM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? taskId, String? newContent});
  UpdateUserTaskDescriptionSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserTaskDescriptionSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserTaskDescriptionSM, $Out>
    implements
        UpdateUserTaskDescriptionSMCopyWith<$R, UpdateUserTaskDescriptionSM,
            $Out> {
  _UpdateUserTaskDescriptionSMCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserTaskDescriptionSM> $mapper =
      UpdateUserTaskDescriptionSMMapper.ensureInitialized();
  @override
  $R call({Object? taskId = $none, String? newContent}) =>
      $apply(FieldCopyWithData({
        if (taskId != $none) #taskId: taskId,
        if (newContent != null) #newContent: newContent
      }));
  @override
  UpdateUserTaskDescriptionSM $make(CopyWithData data) =>
      UpdateUserTaskDescriptionSM(
          taskId: data.get(#taskId, or: $value.taskId),
          newContent: data.get(#newContent, or: $value.newContent));

  @override
  UpdateUserTaskDescriptionSMCopyWith<$R2, UpdateUserTaskDescriptionSM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserTaskDescriptionSMCopyWithImpl($value, $cast, t);
}
