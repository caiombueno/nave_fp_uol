// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../user_task_sm.dart';

class UserTaskSMMapper extends ClassMapperBase<UserTaskSM> {
  UserTaskSMMapper._();

  static UserTaskSMMapper? _instance;
  static UserTaskSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTaskSMMapper._());
      TaskStatusSMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserTaskSM';

  static String _$id(UserTaskSM v) => v.id;
  static const Field<UserTaskSM, String> _f$id = Field('id', _$id);
  static String? _$title(UserTaskSM v) => v.title;
  static const Field<UserTaskSM, String> _f$title = Field('title', _$title);
  static String? _$descriptionContent(UserTaskSM v) => v.descriptionContent;
  static const Field<UserTaskSM, String> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static TaskStatusSM? _$status(UserTaskSM v) => v.status;
  static const Field<UserTaskSM, TaskStatusSM> _f$status =
      Field('status', _$status);
  static Timestamp? _$lastStatusUpdateDateTime(UserTaskSM v) =>
      v.lastStatusUpdateDateTime;
  static const Field<UserTaskSM, Timestamp> _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static double? _$selectedSortKey(UserTaskSM v) => v.selectedSortKey;
  static const Field<UserTaskSM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<UserTaskSM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionContent: _f$descriptionContent,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #selectedSortKey: _f$selectedSortKey,
  };

  static UserTaskSM _instantiate(DecodingData data) {
    return UserTaskSM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        descriptionContent: data.dec(_f$descriptionContent),
        status: data.dec(_f$status),
        lastStatusUpdateDateTime: data.dec(_f$lastStatusUpdateDateTime),
        selectedSortKey: data.dec(_f$selectedSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static UserTaskSM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserTaskSM>(map);
  }

  static UserTaskSM fromJson(String json) {
    return ensureInitialized().decodeJson<UserTaskSM>(json);
  }
}

mixin UserTaskSMMappable {
  String toJson() {
    return UserTaskSMMapper.ensureInitialized()
        .encodeJson<UserTaskSM>(this as UserTaskSM);
  }

  Map<String, dynamic> toMap() {
    return UserTaskSMMapper.ensureInitialized()
        .encodeMap<UserTaskSM>(this as UserTaskSM);
  }

  UserTaskSMCopyWith<UserTaskSM, UserTaskSM, UserTaskSM> get copyWith =>
      _UserTaskSMCopyWithImpl(this as UserTaskSM, $identity, $identity);
  @override
  String toString() {
    return UserTaskSMMapper.ensureInitialized()
        .stringifyValue(this as UserTaskSM);
  }

  @override
  bool operator ==(Object other) {
    return UserTaskSMMapper.ensureInitialized()
        .equalsValue(this as UserTaskSM, other);
  }

  @override
  int get hashCode {
    return UserTaskSMMapper.ensureInitialized().hashValue(this as UserTaskSM);
  }
}

extension UserTaskSMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserTaskSM, $Out> {
  UserTaskSMCopyWith<$R, UserTaskSM, $Out> get $asUserTaskSM =>
      $base.as((v, t, t2) => _UserTaskSMCopyWithImpl(v, t, t2));
}

abstract class UserTaskSMCopyWith<$R, $In extends UserTaskSM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? title,
      String? descriptionContent,
      TaskStatusSM? status,
      Timestamp? lastStatusUpdateDateTime,
      double? selectedSortKey});
  UserTaskSMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserTaskSMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserTaskSM, $Out>
    implements UserTaskSMCopyWith<$R, UserTaskSM, $Out> {
  _UserTaskSMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserTaskSM> $mapper =
      UserTaskSMMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? title = $none,
          Object? descriptionContent = $none,
          Object? status = $none,
          Object? lastStatusUpdateDateTime = $none,
          Object? selectedSortKey = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (descriptionContent != $none)
          #descriptionContent: descriptionContent,
        if (status != $none) #status: status,
        if (lastStatusUpdateDateTime != $none)
          #lastStatusUpdateDateTime: lastStatusUpdateDateTime,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey
      }));
  @override
  UserTaskSM $make(CopyWithData data) => UserTaskSM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      descriptionContent:
          data.get(#descriptionContent, or: $value.descriptionContent),
      status: data.get(#status, or: $value.status),
      lastStatusUpdateDateTime: data.get(#lastStatusUpdateDateTime,
          or: $value.lastStatusUpdateDateTime),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey));

  @override
  UserTaskSMCopyWith<$R2, UserTaskSM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserTaskSMCopyWithImpl($value, $cast, t);
}
