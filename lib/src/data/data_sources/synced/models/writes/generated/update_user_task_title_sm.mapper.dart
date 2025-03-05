// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../update_user_task_title_sm.dart';

class UpdateUserTaskTitleSMMapper
    extends ClassMapperBase<UpdateUserTaskTitleSM> {
  UpdateUserTaskTitleSMMapper._();

  static UpdateUserTaskTitleSMMapper? _instance;
  static UpdateUserTaskTitleSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateUserTaskTitleSMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateUserTaskTitleSM';

  static String? _$taskId(UpdateUserTaskTitleSM v) => v.taskId;
  static const Field<UpdateUserTaskTitleSM, String> _f$taskId =
      Field('taskId', _$taskId, key: r'id');
  static String _$newTitle(UpdateUserTaskTitleSM v) => v.newTitle;
  static const Field<UpdateUserTaskTitleSM, String> _f$newTitle =
      Field('newTitle', _$newTitle, key: r'title');

  @override
  final MappableFields<UpdateUserTaskTitleSM> fields = const {
    #taskId: _f$taskId,
    #newTitle: _f$newTitle,
  };

  static UpdateUserTaskTitleSM _instantiate(DecodingData data) {
    return UpdateUserTaskTitleSM(
        taskId: data.dec(_f$taskId), newTitle: data.dec(_f$newTitle));
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateUserTaskTitleSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateUserTaskTitleSM>(map);
  }

  static UpdateUserTaskTitleSM fromJson(String json) {
    return ensureInitialized().decodeJson<UpdateUserTaskTitleSM>(json);
  }
}

mixin UpdateUserTaskTitleSMMappable {
  String toJson() {
    return UpdateUserTaskTitleSMMapper.ensureInitialized()
        .encodeJson<UpdateUserTaskTitleSM>(this as UpdateUserTaskTitleSM);
  }

  Map<String, dynamic> toMap() {
    return UpdateUserTaskTitleSMMapper.ensureInitialized()
        .encodeMap<UpdateUserTaskTitleSM>(this as UpdateUserTaskTitleSM);
  }

  UpdateUserTaskTitleSMCopyWith<UpdateUserTaskTitleSM, UpdateUserTaskTitleSM,
          UpdateUserTaskTitleSM>
      get copyWith => _UpdateUserTaskTitleSMCopyWithImpl(
          this as UpdateUserTaskTitleSM, $identity, $identity);
  @override
  String toString() {
    return UpdateUserTaskTitleSMMapper.ensureInitialized()
        .stringifyValue(this as UpdateUserTaskTitleSM);
  }

  @override
  bool operator ==(Object other) {
    return UpdateUserTaskTitleSMMapper.ensureInitialized()
        .equalsValue(this as UpdateUserTaskTitleSM, other);
  }

  @override
  int get hashCode {
    return UpdateUserTaskTitleSMMapper.ensureInitialized()
        .hashValue(this as UpdateUserTaskTitleSM);
  }
}

extension UpdateUserTaskTitleSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateUserTaskTitleSM, $Out> {
  UpdateUserTaskTitleSMCopyWith<$R, UpdateUserTaskTitleSM, $Out>
      get $asUpdateUserTaskTitleSM =>
          $base.as((v, t, t2) => _UpdateUserTaskTitleSMCopyWithImpl(v, t, t2));
}

abstract class UpdateUserTaskTitleSMCopyWith<
    $R,
    $In extends UpdateUserTaskTitleSM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? taskId, String? newTitle});
  UpdateUserTaskTitleSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpdateUserTaskTitleSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateUserTaskTitleSM, $Out>
    implements UpdateUserTaskTitleSMCopyWith<$R, UpdateUserTaskTitleSM, $Out> {
  _UpdateUserTaskTitleSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateUserTaskTitleSM> $mapper =
      UpdateUserTaskTitleSMMapper.ensureInitialized();
  @override
  $R call({Object? taskId = $none, String? newTitle}) =>
      $apply(FieldCopyWithData({
        if (taskId != $none) #taskId: taskId,
        if (newTitle != null) #newTitle: newTitle
      }));
  @override
  UpdateUserTaskTitleSM $make(CopyWithData data) => UpdateUserTaskTitleSM(
      taskId: data.get(#taskId, or: $value.taskId),
      newTitle: data.get(#newTitle, or: $value.newTitle));

  @override
  UpdateUserTaskTitleSMCopyWith<$R2, UpdateUserTaskTitleSM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UpdateUserTaskTitleSMCopyWithImpl($value, $cast, t);
}
