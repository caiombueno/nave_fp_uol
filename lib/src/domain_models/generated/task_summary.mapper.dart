// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../task_summary.dart';

class TaskSummaryMapper extends ClassMapperBase<TaskSummary> {
  TaskSummaryMapper._();

  static TaskSummaryMapper? _instance;
  static TaskSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskSummaryMapper._());
      SystemTaskSummaryMapper.ensureInitialized();
      UserTaskSummaryMapper.ensureInitialized();
      TaskStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskSummary';

  static String _$id(TaskSummary v) => v.id;
  static const Field<TaskSummary, String> _f$id = Field('id', _$id);
  static String? _$title(TaskSummary v) => v.title;
  static const Field<TaskSummary, String> _f$title = Field('title', _$title);
  static TaskStatus _$status(TaskSummary v) => v.status;
  static const Field<TaskSummary, TaskStatus> _f$status =
      Field('status', _$status);
  static double? _$selectedSortKey(TaskSummary v) => v.selectedSortKey;
  static const Field<TaskSummary, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<TaskSummary> fields = const {
    #id: _f$id,
    #title: _f$title,
    #status: _f$status,
    #selectedSortKey: _f$selectedSortKey,
  };

  static TaskSummary _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TaskSummary', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TaskSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskSummary>(map);
  }

  static TaskSummary fromJson(String json) {
    return ensureInitialized().decodeJson<TaskSummary>(json);
  }
}

mixin TaskSummaryMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TaskSummaryCopyWith<TaskSummary, TaskSummary, TaskSummary> get copyWith;
}

abstract class TaskSummaryCopyWith<$R, $In extends TaskSummary, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id, String? title, TaskStatus? status, double? selectedSortKey});
  TaskSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SystemTaskSummaryMapper extends SubClassMapperBase<SystemTaskSummary> {
  SystemTaskSummaryMapper._();

  static SystemTaskSummaryMapper? _instance;
  static SystemTaskSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SystemTaskSummaryMapper._());
      TaskSummaryMapper.ensureInitialized().addSubMapper(_instance!);
      TaskStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SystemTaskSummary';

  static String _$id(SystemTaskSummary v) => v.id;
  static const Field<SystemTaskSummary, String> _f$id = Field('id', _$id);
  static String? _$title(SystemTaskSummary v) => v.title;
  static const Field<SystemTaskSummary, String> _f$title =
      Field('title', _$title);
  static TaskStatus _$status(SystemTaskSummary v) => v.status;
  static const Field<SystemTaskSummary, TaskStatus> _f$status =
      Field('status', _$status);
  static double? _$selectedSortKey(SystemTaskSummary v) => v.selectedSortKey;
  static const Field<SystemTaskSummary, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);
  static bool? _$isFree(SystemTaskSummary v) => v.isFree;
  static const Field<SystemTaskSummary, bool> _f$isFree =
      Field('isFree', _$isFree);
  static List<String>? _$blockingTaskIds(SystemTaskSummary v) =>
      v.blockingTaskIds;
  static const Field<SystemTaskSummary, List<String>> _f$blockingTaskIds =
      Field('blockingTaskIds', _$blockingTaskIds);
  static int? _$defaultSortKey(SystemTaskSummary v) => v.defaultSortKey;
  static const Field<SystemTaskSummary, int> _f$defaultSortKey =
      Field('defaultSortKey', _$defaultSortKey);

  @override
  final MappableFields<SystemTaskSummary> fields = const {
    #id: _f$id,
    #title: _f$title,
    #status: _f$status,
    #selectedSortKey: _f$selectedSortKey,
    #isFree: _f$isFree,
    #blockingTaskIds: _f$blockingTaskIds,
    #defaultSortKey: _f$defaultSortKey,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SystemTaskSummary';
  @override
  late final ClassMapperBase superMapper =
      TaskSummaryMapper.ensureInitialized();

  static SystemTaskSummary _instantiate(DecodingData data) {
    return SystemTaskSummary(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        status: data.dec(_f$status),
        selectedSortKey: data.dec(_f$selectedSortKey),
        isFree: data.dec(_f$isFree),
        blockingTaskIds: data.dec(_f$blockingTaskIds),
        defaultSortKey: data.dec(_f$defaultSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static SystemTaskSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SystemTaskSummary>(map);
  }

  static SystemTaskSummary fromJson(String json) {
    return ensureInitialized().decodeJson<SystemTaskSummary>(json);
  }
}

mixin SystemTaskSummaryMappable {
  String toJson() {
    return SystemTaskSummaryMapper.ensureInitialized()
        .encodeJson<SystemTaskSummary>(this as SystemTaskSummary);
  }

  Map<String, dynamic> toMap() {
    return SystemTaskSummaryMapper.ensureInitialized()
        .encodeMap<SystemTaskSummary>(this as SystemTaskSummary);
  }

  SystemTaskSummaryCopyWith<SystemTaskSummary, SystemTaskSummary,
          SystemTaskSummary>
      get copyWith => _SystemTaskSummaryCopyWithImpl(
          this as SystemTaskSummary, $identity, $identity);
  @override
  String toString() {
    return SystemTaskSummaryMapper.ensureInitialized()
        .stringifyValue(this as SystemTaskSummary);
  }

  @override
  bool operator ==(Object other) {
    return SystemTaskSummaryMapper.ensureInitialized()
        .equalsValue(this as SystemTaskSummary, other);
  }

  @override
  int get hashCode {
    return SystemTaskSummaryMapper.ensureInitialized()
        .hashValue(this as SystemTaskSummary);
  }
}

extension SystemTaskSummaryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SystemTaskSummary, $Out> {
  SystemTaskSummaryCopyWith<$R, SystemTaskSummary, $Out>
      get $asSystemTaskSummary =>
          $base.as((v, t, t2) => _SystemTaskSummaryCopyWithImpl(v, t, t2));
}

abstract class SystemTaskSummaryCopyWith<$R, $In extends SystemTaskSummary,
    $Out> implements TaskSummaryCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds;
  @override
  $R call(
      {String? id,
      String? title,
      TaskStatus? status,
      double? selectedSortKey,
      bool? isFree,
      List<String>? blockingTaskIds,
      int? defaultSortKey});
  SystemTaskSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SystemTaskSummaryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SystemTaskSummary, $Out>
    implements SystemTaskSummaryCopyWith<$R, SystemTaskSummary, $Out> {
  _SystemTaskSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SystemTaskSummary> $mapper =
      SystemTaskSummaryMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds => $value.blockingTaskIds != null
          ? ListCopyWith(
              $value.blockingTaskIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(blockingTaskIds: v))
          : null;
  @override
  $R call(
          {String? id,
          Object? title = $none,
          TaskStatus? status,
          Object? selectedSortKey = $none,
          Object? isFree = $none,
          Object? blockingTaskIds = $none,
          Object? defaultSortKey = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (status != null) #status: status,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey,
        if (isFree != $none) #isFree: isFree,
        if (blockingTaskIds != $none) #blockingTaskIds: blockingTaskIds,
        if (defaultSortKey != $none) #defaultSortKey: defaultSortKey
      }));
  @override
  SystemTaskSummary $make(CopyWithData data) => SystemTaskSummary(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      status: data.get(#status, or: $value.status),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey),
      isFree: data.get(#isFree, or: $value.isFree),
      blockingTaskIds: data.get(#blockingTaskIds, or: $value.blockingTaskIds),
      defaultSortKey: data.get(#defaultSortKey, or: $value.defaultSortKey));

  @override
  SystemTaskSummaryCopyWith<$R2, SystemTaskSummary, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SystemTaskSummaryCopyWithImpl($value, $cast, t);
}

class UserTaskSummaryMapper extends SubClassMapperBase<UserTaskSummary> {
  UserTaskSummaryMapper._();

  static UserTaskSummaryMapper? _instance;
  static UserTaskSummaryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTaskSummaryMapper._());
      TaskSummaryMapper.ensureInitialized().addSubMapper(_instance!);
      TaskStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserTaskSummary';

  static String _$id(UserTaskSummary v) => v.id;
  static const Field<UserTaskSummary, String> _f$id = Field('id', _$id);
  static String? _$title(UserTaskSummary v) => v.title;
  static const Field<UserTaskSummary, String> _f$title =
      Field('title', _$title);
  static TaskStatus _$status(UserTaskSummary v) => v.status;
  static const Field<UserTaskSummary, TaskStatus> _f$status =
      Field('status', _$status);
  static double? _$selectedSortKey(UserTaskSummary v) => v.selectedSortKey;
  static const Field<UserTaskSummary, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);

  @override
  final MappableFields<UserTaskSummary> fields = const {
    #id: _f$id,
    #title: _f$title,
    #status: _f$status,
    #selectedSortKey: _f$selectedSortKey,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UserTaskSummary';
  @override
  late final ClassMapperBase superMapper =
      TaskSummaryMapper.ensureInitialized();

  static UserTaskSummary _instantiate(DecodingData data) {
    return UserTaskSummary(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        status: data.dec(_f$status),
        selectedSortKey: data.dec(_f$selectedSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static UserTaskSummary fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserTaskSummary>(map);
  }

  static UserTaskSummary fromJson(String json) {
    return ensureInitialized().decodeJson<UserTaskSummary>(json);
  }
}

mixin UserTaskSummaryMappable {
  String toJson() {
    return UserTaskSummaryMapper.ensureInitialized()
        .encodeJson<UserTaskSummary>(this as UserTaskSummary);
  }

  Map<String, dynamic> toMap() {
    return UserTaskSummaryMapper.ensureInitialized()
        .encodeMap<UserTaskSummary>(this as UserTaskSummary);
  }

  UserTaskSummaryCopyWith<UserTaskSummary, UserTaskSummary, UserTaskSummary>
      get copyWith => _UserTaskSummaryCopyWithImpl(
          this as UserTaskSummary, $identity, $identity);
  @override
  String toString() {
    return UserTaskSummaryMapper.ensureInitialized()
        .stringifyValue(this as UserTaskSummary);
  }

  @override
  bool operator ==(Object other) {
    return UserTaskSummaryMapper.ensureInitialized()
        .equalsValue(this as UserTaskSummary, other);
  }

  @override
  int get hashCode {
    return UserTaskSummaryMapper.ensureInitialized()
        .hashValue(this as UserTaskSummary);
  }
}

extension UserTaskSummaryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserTaskSummary, $Out> {
  UserTaskSummaryCopyWith<$R, UserTaskSummary, $Out> get $asUserTaskSummary =>
      $base.as((v, t, t2) => _UserTaskSummaryCopyWithImpl(v, t, t2));
}

abstract class UserTaskSummaryCopyWith<$R, $In extends UserTaskSummary, $Out>
    implements TaskSummaryCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id, String? title, TaskStatus? status, double? selectedSortKey});
  UserTaskSummaryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserTaskSummaryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserTaskSummary, $Out>
    implements UserTaskSummaryCopyWith<$R, UserTaskSummary, $Out> {
  _UserTaskSummaryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserTaskSummary> $mapper =
      UserTaskSummaryMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? title = $none,
          TaskStatus? status,
          Object? selectedSortKey = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (status != null) #status: status,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey
      }));
  @override
  UserTaskSummary $make(CopyWithData data) => UserTaskSummary(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      status: data.get(#status, or: $value.status),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey));

  @override
  UserTaskSummaryCopyWith<$R2, UserTaskSummary, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserTaskSummaryCopyWithImpl($value, $cast, t);
}
