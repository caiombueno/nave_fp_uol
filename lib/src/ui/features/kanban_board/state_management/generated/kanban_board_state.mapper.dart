// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../kanban_board_state.dart';

class KanbanBoardStateMapper extends ClassMapperBase<KanbanBoardState> {
  KanbanBoardStateMapper._();

  static KanbanBoardStateMapper? _instance;
  static KanbanBoardStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KanbanBoardStateMapper._());
      KanbanBoardLoadingMapper.ensureInitialized();
      KanbanBoardErrorMapper.ensureInitialized();
      KanbanBoardLoadedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KanbanBoardState';

  @override
  final MappableFields<KanbanBoardState> fields = const {};

  static KanbanBoardState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'KanbanBoardState', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static KanbanBoardState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KanbanBoardState>(map);
  }

  static KanbanBoardState fromJson(String json) {
    return ensureInitialized().decodeJson<KanbanBoardState>(json);
  }
}

mixin KanbanBoardStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  KanbanBoardStateCopyWith<KanbanBoardState, KanbanBoardState, KanbanBoardState>
      get copyWith;
}

abstract class KanbanBoardStateCopyWith<$R, $In extends KanbanBoardState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  KanbanBoardStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class KanbanBoardLoadingMapper extends SubClassMapperBase<KanbanBoardLoading> {
  KanbanBoardLoadingMapper._();

  static KanbanBoardLoadingMapper? _instance;
  static KanbanBoardLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KanbanBoardLoadingMapper._());
      KanbanBoardStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'KanbanBoardLoading';

  @override
  final MappableFields<KanbanBoardLoading> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'KanbanBoardLoading';
  @override
  late final ClassMapperBase superMapper =
      KanbanBoardStateMapper.ensureInitialized();

  static KanbanBoardLoading _instantiate(DecodingData data) {
    return KanbanBoardLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static KanbanBoardLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KanbanBoardLoading>(map);
  }

  static KanbanBoardLoading fromJson(String json) {
    return ensureInitialized().decodeJson<KanbanBoardLoading>(json);
  }
}

mixin KanbanBoardLoadingMappable {
  String toJson() {
    return KanbanBoardLoadingMapper.ensureInitialized()
        .encodeJson<KanbanBoardLoading>(this as KanbanBoardLoading);
  }

  Map<String, dynamic> toMap() {
    return KanbanBoardLoadingMapper.ensureInitialized()
        .encodeMap<KanbanBoardLoading>(this as KanbanBoardLoading);
  }

  KanbanBoardLoadingCopyWith<KanbanBoardLoading, KanbanBoardLoading,
          KanbanBoardLoading>
      get copyWith => _KanbanBoardLoadingCopyWithImpl(
          this as KanbanBoardLoading, $identity, $identity);
  @override
  String toString() {
    return KanbanBoardLoadingMapper.ensureInitialized()
        .stringifyValue(this as KanbanBoardLoading);
  }

  @override
  bool operator ==(Object other) {
    return KanbanBoardLoadingMapper.ensureInitialized()
        .equalsValue(this as KanbanBoardLoading, other);
  }

  @override
  int get hashCode {
    return KanbanBoardLoadingMapper.ensureInitialized()
        .hashValue(this as KanbanBoardLoading);
  }
}

extension KanbanBoardLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KanbanBoardLoading, $Out> {
  KanbanBoardLoadingCopyWith<$R, KanbanBoardLoading, $Out>
      get $asKanbanBoardLoading =>
          $base.as((v, t, t2) => _KanbanBoardLoadingCopyWithImpl(v, t, t2));
}

abstract class KanbanBoardLoadingCopyWith<$R, $In extends KanbanBoardLoading,
    $Out> implements KanbanBoardStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  KanbanBoardLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KanbanBoardLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KanbanBoardLoading, $Out>
    implements KanbanBoardLoadingCopyWith<$R, KanbanBoardLoading, $Out> {
  _KanbanBoardLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KanbanBoardLoading> $mapper =
      KanbanBoardLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  KanbanBoardLoading $make(CopyWithData data) => KanbanBoardLoading();

  @override
  KanbanBoardLoadingCopyWith<$R2, KanbanBoardLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KanbanBoardLoadingCopyWithImpl($value, $cast, t);
}

class KanbanBoardErrorMapper extends SubClassMapperBase<KanbanBoardError> {
  KanbanBoardErrorMapper._();

  static KanbanBoardErrorMapper? _instance;
  static KanbanBoardErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KanbanBoardErrorMapper._());
      KanbanBoardStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'KanbanBoardError';

  @override
  final MappableFields<KanbanBoardError> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'KanbanBoardError';
  @override
  late final ClassMapperBase superMapper =
      KanbanBoardStateMapper.ensureInitialized();

  static KanbanBoardError _instantiate(DecodingData data) {
    return KanbanBoardError();
  }

  @override
  final Function instantiate = _instantiate;

  static KanbanBoardError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KanbanBoardError>(map);
  }

  static KanbanBoardError fromJson(String json) {
    return ensureInitialized().decodeJson<KanbanBoardError>(json);
  }
}

mixin KanbanBoardErrorMappable {
  String toJson() {
    return KanbanBoardErrorMapper.ensureInitialized()
        .encodeJson<KanbanBoardError>(this as KanbanBoardError);
  }

  Map<String, dynamic> toMap() {
    return KanbanBoardErrorMapper.ensureInitialized()
        .encodeMap<KanbanBoardError>(this as KanbanBoardError);
  }

  KanbanBoardErrorCopyWith<KanbanBoardError, KanbanBoardError, KanbanBoardError>
      get copyWith => _KanbanBoardErrorCopyWithImpl(
          this as KanbanBoardError, $identity, $identity);
  @override
  String toString() {
    return KanbanBoardErrorMapper.ensureInitialized()
        .stringifyValue(this as KanbanBoardError);
  }

  @override
  bool operator ==(Object other) {
    return KanbanBoardErrorMapper.ensureInitialized()
        .equalsValue(this as KanbanBoardError, other);
  }

  @override
  int get hashCode {
    return KanbanBoardErrorMapper.ensureInitialized()
        .hashValue(this as KanbanBoardError);
  }
}

extension KanbanBoardErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KanbanBoardError, $Out> {
  KanbanBoardErrorCopyWith<$R, KanbanBoardError, $Out>
      get $asKanbanBoardError =>
          $base.as((v, t, t2) => _KanbanBoardErrorCopyWithImpl(v, t, t2));
}

abstract class KanbanBoardErrorCopyWith<$R, $In extends KanbanBoardError, $Out>
    implements KanbanBoardStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  KanbanBoardErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KanbanBoardErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KanbanBoardError, $Out>
    implements KanbanBoardErrorCopyWith<$R, KanbanBoardError, $Out> {
  _KanbanBoardErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KanbanBoardError> $mapper =
      KanbanBoardErrorMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  KanbanBoardError $make(CopyWithData data) => KanbanBoardError();

  @override
  KanbanBoardErrorCopyWith<$R2, KanbanBoardError, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KanbanBoardErrorCopyWithImpl($value, $cast, t);
}

class KanbanBoardLoadedMapper extends SubClassMapperBase<KanbanBoardLoaded> {
  KanbanBoardLoadedMapper._();

  static KanbanBoardLoadedMapper? _instance;
  static KanbanBoardLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KanbanBoardLoadedMapper._());
      KanbanBoardStateMapper.ensureInitialized().addSubMapper(_instance!);
      TaskSummaryVMMapper.ensureInitialized();
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KanbanBoardLoaded';

  static List<TaskSummaryVM> _$toDoTaskSummaryList(KanbanBoardLoaded v) =>
      v.toDoTaskSummaryList;
  static const Field<KanbanBoardLoaded, List<TaskSummaryVM>>
      _f$toDoTaskSummaryList =
      Field('toDoTaskSummaryList', _$toDoTaskSummaryList);
  static List<TaskSummaryVM> _$inProgressTaskSummaryList(KanbanBoardLoaded v) =>
      v.inProgressTaskSummaryList;
  static const Field<KanbanBoardLoaded, List<TaskSummaryVM>>
      _f$inProgressTaskSummaryList =
      Field('inProgressTaskSummaryList', _$inProgressTaskSummaryList);
  static List<TaskSummaryVM> _$doneTaskSummaryList(KanbanBoardLoaded v) =>
      v.doneTaskSummaryList;
  static const Field<KanbanBoardLoaded, List<TaskSummaryVM>>
      _f$doneTaskSummaryList =
      Field('doneTaskSummaryList', _$doneTaskSummaryList);
  static Failure? _$updateTaskPlacementFailure(KanbanBoardLoaded v) =>
      v.updateTaskPlacementFailure;
  static const Field<KanbanBoardLoaded, Failure> _f$updateTaskPlacementFailure =
      Field('updateTaskPlacementFailure', _$updateTaskPlacementFailure,
          opt: true);

  @override
  final MappableFields<KanbanBoardLoaded> fields = const {
    #toDoTaskSummaryList: _f$toDoTaskSummaryList,
    #inProgressTaskSummaryList: _f$inProgressTaskSummaryList,
    #doneTaskSummaryList: _f$doneTaskSummaryList,
    #updateTaskPlacementFailure: _f$updateTaskPlacementFailure,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'KanbanBoardLoaded';
  @override
  late final ClassMapperBase superMapper =
      KanbanBoardStateMapper.ensureInitialized();

  static KanbanBoardLoaded _instantiate(DecodingData data) {
    return KanbanBoardLoaded(
        toDoTaskSummaryList: data.dec(_f$toDoTaskSummaryList),
        inProgressTaskSummaryList: data.dec(_f$inProgressTaskSummaryList),
        doneTaskSummaryList: data.dec(_f$doneTaskSummaryList),
        updateTaskPlacementFailure: data.dec(_f$updateTaskPlacementFailure));
  }

  @override
  final Function instantiate = _instantiate;

  static KanbanBoardLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KanbanBoardLoaded>(map);
  }

  static KanbanBoardLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<KanbanBoardLoaded>(json);
  }
}

mixin KanbanBoardLoadedMappable {
  String toJson() {
    return KanbanBoardLoadedMapper.ensureInitialized()
        .encodeJson<KanbanBoardLoaded>(this as KanbanBoardLoaded);
  }

  Map<String, dynamic> toMap() {
    return KanbanBoardLoadedMapper.ensureInitialized()
        .encodeMap<KanbanBoardLoaded>(this as KanbanBoardLoaded);
  }

  KanbanBoardLoadedCopyWith<KanbanBoardLoaded, KanbanBoardLoaded,
          KanbanBoardLoaded>
      get copyWith => _KanbanBoardLoadedCopyWithImpl(
          this as KanbanBoardLoaded, $identity, $identity);
  @override
  String toString() {
    return KanbanBoardLoadedMapper.ensureInitialized()
        .stringifyValue(this as KanbanBoardLoaded);
  }

  @override
  bool operator ==(Object other) {
    return KanbanBoardLoadedMapper.ensureInitialized()
        .equalsValue(this as KanbanBoardLoaded, other);
  }

  @override
  int get hashCode {
    return KanbanBoardLoadedMapper.ensureInitialized()
        .hashValue(this as KanbanBoardLoaded);
  }
}

extension KanbanBoardLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KanbanBoardLoaded, $Out> {
  KanbanBoardLoadedCopyWith<$R, KanbanBoardLoaded, $Out>
      get $asKanbanBoardLoaded =>
          $base.as((v, t, t2) => _KanbanBoardLoadedCopyWithImpl(v, t, t2));
}

abstract class KanbanBoardLoadedCopyWith<$R, $In extends KanbanBoardLoaded,
    $Out> implements KanbanBoardStateCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get toDoTaskSummaryList;
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get inProgressTaskSummaryList;
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get doneTaskSummaryList;
  @override
  $R call(
      {List<TaskSummaryVM>? toDoTaskSummaryList,
      List<TaskSummaryVM>? inProgressTaskSummaryList,
      List<TaskSummaryVM>? doneTaskSummaryList,
      Failure? updateTaskPlacementFailure});
  KanbanBoardLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KanbanBoardLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KanbanBoardLoaded, $Out>
    implements KanbanBoardLoadedCopyWith<$R, KanbanBoardLoaded, $Out> {
  _KanbanBoardLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KanbanBoardLoaded> $mapper =
      KanbanBoardLoadedMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get toDoTaskSummaryList => ListCopyWith($value.toDoTaskSummaryList,
          (v, t) => v.copyWith.$chain(t), (v) => call(toDoTaskSummaryList: v));
  @override
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get inProgressTaskSummaryList => ListCopyWith(
          $value.inProgressTaskSummaryList,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(inProgressTaskSummaryList: v));
  @override
  ListCopyWith<$R, TaskSummaryVM,
          TaskSummaryVMCopyWith<$R, TaskSummaryVM, TaskSummaryVM>>
      get doneTaskSummaryList => ListCopyWith($value.doneTaskSummaryList,
          (v, t) => v.copyWith.$chain(t), (v) => call(doneTaskSummaryList: v));
  @override
  $R call(
          {List<TaskSummaryVM>? toDoTaskSummaryList,
          List<TaskSummaryVM>? inProgressTaskSummaryList,
          List<TaskSummaryVM>? doneTaskSummaryList,
          Object? updateTaskPlacementFailure = $none}) =>
      $apply(FieldCopyWithData({
        if (toDoTaskSummaryList != null)
          #toDoTaskSummaryList: toDoTaskSummaryList,
        if (inProgressTaskSummaryList != null)
          #inProgressTaskSummaryList: inProgressTaskSummaryList,
        if (doneTaskSummaryList != null)
          #doneTaskSummaryList: doneTaskSummaryList,
        if (updateTaskPlacementFailure != $none)
          #updateTaskPlacementFailure: updateTaskPlacementFailure
      }));
  @override
  KanbanBoardLoaded $make(CopyWithData data) => KanbanBoardLoaded(
      toDoTaskSummaryList:
          data.get(#toDoTaskSummaryList, or: $value.toDoTaskSummaryList),
      inProgressTaskSummaryList: data.get(#inProgressTaskSummaryList,
          or: $value.inProgressTaskSummaryList),
      doneTaskSummaryList:
          data.get(#doneTaskSummaryList, or: $value.doneTaskSummaryList),
      updateTaskPlacementFailure: data.get(#updateTaskPlacementFailure,
          or: $value.updateTaskPlacementFailure));

  @override
  KanbanBoardLoadedCopyWith<$R2, KanbanBoardLoaded, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KanbanBoardLoadedCopyWithImpl($value, $cast, t);
}

class TaskSummaryVMMapper extends ClassMapperBase<TaskSummaryVM> {
  TaskSummaryVMMapper._();

  static TaskSummaryVMMapper? _instance;
  static TaskSummaryVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskSummaryVMMapper._());
      SystemTaskSummaryVMMapper.ensureInitialized();
      UserTaskSummaryVMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskSummaryVM';

  static String? _$id(TaskSummaryVM v) => v.id;
  static const Field<TaskSummaryVM, String> _f$id = Field('id', _$id);
  static String? _$title(TaskSummaryVM v) => v.title;
  static const Field<TaskSummaryVM, String> _f$title = Field('title', _$title);
  static bool? _$isLockedByPayment(TaskSummaryVM v) => v.isLockedByPayment;
  static const Field<TaskSummaryVM, bool> _f$isLockedByPayment =
      Field('isLockedByPayment', _$isLockedByPayment);
  static List<String>? _$blockingTaskTitles(TaskSummaryVM v) =>
      v.blockingTaskTitles;
  static const Field<TaskSummaryVM, List<String>> _f$blockingTaskTitles =
      Field('blockingTaskTitles', _$blockingTaskTitles);
  static double? _$selectedSortKey(TaskSummaryVM v) => v.selectedSortKey;
  static const Field<TaskSummaryVM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);
  static int _$index(TaskSummaryVM v) => v.index;
  static const Field<TaskSummaryVM, int> _f$index = Field('index', _$index);

  @override
  final MappableFields<TaskSummaryVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #isLockedByPayment: _f$isLockedByPayment,
    #blockingTaskTitles: _f$blockingTaskTitles,
    #selectedSortKey: _f$selectedSortKey,
    #index: _f$index,
  };

  static TaskSummaryVM _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TaskSummaryVM', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TaskSummaryVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskSummaryVM>(map);
  }

  static TaskSummaryVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskSummaryVM>(json);
  }
}

mixin TaskSummaryVMMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TaskSummaryVMCopyWith<TaskSummaryVM, TaskSummaryVM, TaskSummaryVM>
      get copyWith;
}

abstract class TaskSummaryVMCopyWith<$R, $In extends TaskSummaryVM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? title, double? selectedSortKey, int? index});
  TaskSummaryVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SystemTaskSummaryVMMapper
    extends SubClassMapperBase<SystemTaskSummaryVM> {
  SystemTaskSummaryVMMapper._();

  static SystemTaskSummaryVMMapper? _instance;
  static SystemTaskSummaryVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SystemTaskSummaryVMMapper._());
      TaskSummaryVMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SystemTaskSummaryVM';

  static String? _$id(SystemTaskSummaryVM v) => v.id;
  static const Field<SystemTaskSummaryVM, String> _f$id = Field('id', _$id);
  static String? _$title(SystemTaskSummaryVM v) => v.title;
  static const Field<SystemTaskSummaryVM, String> _f$title =
      Field('title', _$title);
  static bool? _$isLockedByPayment(SystemTaskSummaryVM v) =>
      v.isLockedByPayment;
  static const Field<SystemTaskSummaryVM, bool> _f$isLockedByPayment =
      Field('isLockedByPayment', _$isLockedByPayment);
  static List<String>? _$blockingTaskTitles(SystemTaskSummaryVM v) =>
      v.blockingTaskTitles;
  static const Field<SystemTaskSummaryVM, List<String>> _f$blockingTaskTitles =
      Field('blockingTaskTitles', _$blockingTaskTitles);
  static double? _$selectedSortKey(SystemTaskSummaryVM v) => v.selectedSortKey;
  static const Field<SystemTaskSummaryVM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);
  static int _$index(SystemTaskSummaryVM v) => v.index;
  static const Field<SystemTaskSummaryVM, int> _f$index =
      Field('index', _$index);
  static int? _$defaultSortKey(SystemTaskSummaryVM v) => v.defaultSortKey;
  static const Field<SystemTaskSummaryVM, int> _f$defaultSortKey =
      Field('defaultSortKey', _$defaultSortKey);

  @override
  final MappableFields<SystemTaskSummaryVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #isLockedByPayment: _f$isLockedByPayment,
    #blockingTaskTitles: _f$blockingTaskTitles,
    #selectedSortKey: _f$selectedSortKey,
    #index: _f$index,
    #defaultSortKey: _f$defaultSortKey,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SystemTaskSummaryVM';
  @override
  late final ClassMapperBase superMapper =
      TaskSummaryVMMapper.ensureInitialized();

  static SystemTaskSummaryVM _instantiate(DecodingData data) {
    return SystemTaskSummaryVM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        isLockedByPayment: data.dec(_f$isLockedByPayment),
        blockingTaskTitles: data.dec(_f$blockingTaskTitles),
        selectedSortKey: data.dec(_f$selectedSortKey),
        index: data.dec(_f$index),
        defaultSortKey: data.dec(_f$defaultSortKey));
  }

  @override
  final Function instantiate = _instantiate;

  static SystemTaskSummaryVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SystemTaskSummaryVM>(map);
  }

  static SystemTaskSummaryVM fromJson(String json) {
    return ensureInitialized().decodeJson<SystemTaskSummaryVM>(json);
  }
}

mixin SystemTaskSummaryVMMappable {
  String toJson() {
    return SystemTaskSummaryVMMapper.ensureInitialized()
        .encodeJson<SystemTaskSummaryVM>(this as SystemTaskSummaryVM);
  }

  Map<String, dynamic> toMap() {
    return SystemTaskSummaryVMMapper.ensureInitialized()
        .encodeMap<SystemTaskSummaryVM>(this as SystemTaskSummaryVM);
  }

  SystemTaskSummaryVMCopyWith<SystemTaskSummaryVM, SystemTaskSummaryVM,
          SystemTaskSummaryVM>
      get copyWith => _SystemTaskSummaryVMCopyWithImpl(
          this as SystemTaskSummaryVM, $identity, $identity);
  @override
  String toString() {
    return SystemTaskSummaryVMMapper.ensureInitialized()
        .stringifyValue(this as SystemTaskSummaryVM);
  }

  @override
  bool operator ==(Object other) {
    return SystemTaskSummaryVMMapper.ensureInitialized()
        .equalsValue(this as SystemTaskSummaryVM, other);
  }

  @override
  int get hashCode {
    return SystemTaskSummaryVMMapper.ensureInitialized()
        .hashValue(this as SystemTaskSummaryVM);
  }
}

extension SystemTaskSummaryVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SystemTaskSummaryVM, $Out> {
  SystemTaskSummaryVMCopyWith<$R, SystemTaskSummaryVM, $Out>
      get $asSystemTaskSummaryVM =>
          $base.as((v, t, t2) => _SystemTaskSummaryVMCopyWithImpl(v, t, t2));
}

abstract class SystemTaskSummaryVMCopyWith<$R, $In extends SystemTaskSummaryVM,
    $Out> implements TaskSummaryVMCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskTitles;
  @override
  $R call(
      {String? id,
      String? title,
      bool? isLockedByPayment,
      List<String>? blockingTaskTitles,
      double? selectedSortKey,
      int? index,
      int? defaultSortKey});
  SystemTaskSummaryVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SystemTaskSummaryVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SystemTaskSummaryVM, $Out>
    implements SystemTaskSummaryVMCopyWith<$R, SystemTaskSummaryVM, $Out> {
  _SystemTaskSummaryVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SystemTaskSummaryVM> $mapper =
      SystemTaskSummaryVMMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskTitles => $value.blockingTaskTitles != null
          ? ListCopyWith(
              $value.blockingTaskTitles!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(blockingTaskTitles: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? isLockedByPayment = $none,
          Object? blockingTaskTitles = $none,
          Object? selectedSortKey = $none,
          int? index,
          Object? defaultSortKey = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (isLockedByPayment != $none) #isLockedByPayment: isLockedByPayment,
        if (blockingTaskTitles != $none)
          #blockingTaskTitles: blockingTaskTitles,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey,
        if (index != null) #index: index,
        if (defaultSortKey != $none) #defaultSortKey: defaultSortKey
      }));
  @override
  SystemTaskSummaryVM $make(CopyWithData data) => SystemTaskSummaryVM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      isLockedByPayment:
          data.get(#isLockedByPayment, or: $value.isLockedByPayment),
      blockingTaskTitles:
          data.get(#blockingTaskTitles, or: $value.blockingTaskTitles),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey),
      index: data.get(#index, or: $value.index),
      defaultSortKey: data.get(#defaultSortKey, or: $value.defaultSortKey));

  @override
  SystemTaskSummaryVMCopyWith<$R2, SystemTaskSummaryVM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SystemTaskSummaryVMCopyWithImpl($value, $cast, t);
}

class UserTaskSummaryVMMapper extends SubClassMapperBase<UserTaskSummaryVM> {
  UserTaskSummaryVMMapper._();

  static UserTaskSummaryVMMapper? _instance;
  static UserTaskSummaryVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTaskSummaryVMMapper._());
      TaskSummaryVMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'UserTaskSummaryVM';

  static String? _$id(UserTaskSummaryVM v) => v.id;
  static const Field<UserTaskSummaryVM, String> _f$id = Field('id', _$id);
  static String? _$title(UserTaskSummaryVM v) => v.title;
  static const Field<UserTaskSummaryVM, String> _f$title =
      Field('title', _$title);
  static double? _$selectedSortKey(UserTaskSummaryVM v) => v.selectedSortKey;
  static const Field<UserTaskSummaryVM, double> _f$selectedSortKey =
      Field('selectedSortKey', _$selectedSortKey);
  static int _$index(UserTaskSummaryVM v) => v.index;
  static const Field<UserTaskSummaryVM, int> _f$index = Field('index', _$index);
  static bool? _$isLockedByPayment(UserTaskSummaryVM v) => v.isLockedByPayment;
  static const Field<UserTaskSummaryVM, bool> _f$isLockedByPayment =
      Field('isLockedByPayment', _$isLockedByPayment, mode: FieldMode.member);
  static List<String>? _$blockingTaskTitles(UserTaskSummaryVM v) =>
      v.blockingTaskTitles;
  static const Field<UserTaskSummaryVM, List<String>> _f$blockingTaskTitles =
      Field('blockingTaskTitles', _$blockingTaskTitles, mode: FieldMode.member);

  @override
  final MappableFields<UserTaskSummaryVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #selectedSortKey: _f$selectedSortKey,
    #index: _f$index,
    #isLockedByPayment: _f$isLockedByPayment,
    #blockingTaskTitles: _f$blockingTaskTitles,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UserTaskSummaryVM';
  @override
  late final ClassMapperBase superMapper =
      TaskSummaryVMMapper.ensureInitialized();

  static UserTaskSummaryVM _instantiate(DecodingData data) {
    return UserTaskSummaryVM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        selectedSortKey: data.dec(_f$selectedSortKey),
        index: data.dec(_f$index));
  }

  @override
  final Function instantiate = _instantiate;

  static UserTaskSummaryVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserTaskSummaryVM>(map);
  }

  static UserTaskSummaryVM fromJson(String json) {
    return ensureInitialized().decodeJson<UserTaskSummaryVM>(json);
  }
}

mixin UserTaskSummaryVMMappable {
  String toJson() {
    return UserTaskSummaryVMMapper.ensureInitialized()
        .encodeJson<UserTaskSummaryVM>(this as UserTaskSummaryVM);
  }

  Map<String, dynamic> toMap() {
    return UserTaskSummaryVMMapper.ensureInitialized()
        .encodeMap<UserTaskSummaryVM>(this as UserTaskSummaryVM);
  }

  UserTaskSummaryVMCopyWith<UserTaskSummaryVM, UserTaskSummaryVM,
          UserTaskSummaryVM>
      get copyWith => _UserTaskSummaryVMCopyWithImpl(
          this as UserTaskSummaryVM, $identity, $identity);
  @override
  String toString() {
    return UserTaskSummaryVMMapper.ensureInitialized()
        .stringifyValue(this as UserTaskSummaryVM);
  }

  @override
  bool operator ==(Object other) {
    return UserTaskSummaryVMMapper.ensureInitialized()
        .equalsValue(this as UserTaskSummaryVM, other);
  }

  @override
  int get hashCode {
    return UserTaskSummaryVMMapper.ensureInitialized()
        .hashValue(this as UserTaskSummaryVM);
  }
}

extension UserTaskSummaryVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserTaskSummaryVM, $Out> {
  UserTaskSummaryVMCopyWith<$R, UserTaskSummaryVM, $Out>
      get $asUserTaskSummaryVM =>
          $base.as((v, t, t2) => _UserTaskSummaryVMCopyWithImpl(v, t, t2));
}

abstract class UserTaskSummaryVMCopyWith<$R, $In extends UserTaskSummaryVM,
    $Out> implements TaskSummaryVMCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, double? selectedSortKey, int? index});
  UserTaskSummaryVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserTaskSummaryVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserTaskSummaryVM, $Out>
    implements UserTaskSummaryVMCopyWith<$R, UserTaskSummaryVM, $Out> {
  _UserTaskSummaryVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserTaskSummaryVM> $mapper =
      UserTaskSummaryVMMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? selectedSortKey = $none,
          int? index}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (selectedSortKey != $none) #selectedSortKey: selectedSortKey,
        if (index != null) #index: index
      }));
  @override
  UserTaskSummaryVM $make(CopyWithData data) => UserTaskSummaryVM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      selectedSortKey: data.get(#selectedSortKey, or: $value.selectedSortKey),
      index: data.get(#index, or: $value.index));

  @override
  UserTaskSummaryVMCopyWith<$R2, UserTaskSummaryVM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserTaskSummaryVMCopyWithImpl($value, $cast, t);
}
