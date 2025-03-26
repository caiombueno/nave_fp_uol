// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../task_details_state.dart';

class TaskDetailsStateMapper extends ClassMapperBase<TaskDetailsState> {
  TaskDetailsStateMapper._();

  static TaskDetailsStateMapper? _instance;
  static TaskDetailsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsStateMapper._());
      TaskDetailsLoadingMapper.ensureInitialized();
      TaskDetailsFailedMapper.ensureInitialized();
      TaskDetailsLoadedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsState';

  @override
  final MappableFields<TaskDetailsState> fields = const {};

  static TaskDetailsState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TaskDetailsState', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsState>(map);
  }

  static TaskDetailsState fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsState>(json);
  }
}

mixin TaskDetailsStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TaskDetailsStateCopyWith<TaskDetailsState, TaskDetailsState, TaskDetailsState>
      get copyWith;
}

abstract class TaskDetailsStateCopyWith<$R, $In extends TaskDetailsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  TaskDetailsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class TaskDetailsLoadingMapper extends SubClassMapperBase<TaskDetailsLoading> {
  TaskDetailsLoadingMapper._();

  static TaskDetailsLoadingMapper? _instance;
  static TaskDetailsLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsLoadingMapper._());
      TaskDetailsStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsLoading';

  @override
  final MappableFields<TaskDetailsLoading> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TaskDetailsLoading';
  @override
  late final ClassMapperBase superMapper =
      TaskDetailsStateMapper.ensureInitialized();

  static TaskDetailsLoading _instantiate(DecodingData data) {
    return TaskDetailsLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsLoading>(map);
  }

  static TaskDetailsLoading fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsLoading>(json);
  }
}

mixin TaskDetailsLoadingMappable {
  String toJson() {
    return TaskDetailsLoadingMapper.ensureInitialized()
        .encodeJson<TaskDetailsLoading>(this as TaskDetailsLoading);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsLoadingMapper.ensureInitialized()
        .encodeMap<TaskDetailsLoading>(this as TaskDetailsLoading);
  }

  TaskDetailsLoadingCopyWith<TaskDetailsLoading, TaskDetailsLoading,
          TaskDetailsLoading>
      get copyWith => _TaskDetailsLoadingCopyWithImpl(
          this as TaskDetailsLoading, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsLoadingMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsLoading);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsLoadingMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsLoading, other);
  }

  @override
  int get hashCode {
    return TaskDetailsLoadingMapper.ensureInitialized()
        .hashValue(this as TaskDetailsLoading);
  }
}

extension TaskDetailsLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsLoading, $Out> {
  TaskDetailsLoadingCopyWith<$R, TaskDetailsLoading, $Out>
      get $asTaskDetailsLoading =>
          $base.as((v, t, t2) => _TaskDetailsLoadingCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsLoadingCopyWith<$R, $In extends TaskDetailsLoading,
    $Out> implements TaskDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TaskDetailsLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsLoading, $Out>
    implements TaskDetailsLoadingCopyWith<$R, TaskDetailsLoading, $Out> {
  _TaskDetailsLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsLoading> $mapper =
      TaskDetailsLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TaskDetailsLoading $make(CopyWithData data) => TaskDetailsLoading();

  @override
  TaskDetailsLoadingCopyWith<$R2, TaskDetailsLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsLoadingCopyWithImpl($value, $cast, t);
}

class TaskDetailsFailedMapper extends SubClassMapperBase<TaskDetailsFailed> {
  TaskDetailsFailedMapper._();

  static TaskDetailsFailedMapper? _instance;
  static TaskDetailsFailedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsFailedMapper._());
      TaskDetailsStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsFailed';

  @override
  final MappableFields<TaskDetailsFailed> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TaskDetailsFailed';
  @override
  late final ClassMapperBase superMapper =
      TaskDetailsStateMapper.ensureInitialized();

  static TaskDetailsFailed _instantiate(DecodingData data) {
    return TaskDetailsFailed();
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsFailed fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsFailed>(map);
  }

  static TaskDetailsFailed fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsFailed>(json);
  }
}

mixin TaskDetailsFailedMappable {
  String toJson() {
    return TaskDetailsFailedMapper.ensureInitialized()
        .encodeJson<TaskDetailsFailed>(this as TaskDetailsFailed);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsFailedMapper.ensureInitialized()
        .encodeMap<TaskDetailsFailed>(this as TaskDetailsFailed);
  }

  TaskDetailsFailedCopyWith<TaskDetailsFailed, TaskDetailsFailed,
          TaskDetailsFailed>
      get copyWith => _TaskDetailsFailedCopyWithImpl(
          this as TaskDetailsFailed, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsFailedMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsFailed);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsFailedMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsFailed, other);
  }

  @override
  int get hashCode {
    return TaskDetailsFailedMapper.ensureInitialized()
        .hashValue(this as TaskDetailsFailed);
  }
}

extension TaskDetailsFailedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsFailed, $Out> {
  TaskDetailsFailedCopyWith<$R, TaskDetailsFailed, $Out>
      get $asTaskDetailsFailed =>
          $base.as((v, t, t2) => _TaskDetailsFailedCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsFailedCopyWith<$R, $In extends TaskDetailsFailed,
    $Out> implements TaskDetailsStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TaskDetailsFailedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsFailedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsFailed, $Out>
    implements TaskDetailsFailedCopyWith<$R, TaskDetailsFailed, $Out> {
  _TaskDetailsFailedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsFailed> $mapper =
      TaskDetailsFailedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TaskDetailsFailed $make(CopyWithData data) => TaskDetailsFailed();

  @override
  TaskDetailsFailedCopyWith<$R2, TaskDetailsFailed, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsFailedCopyWithImpl($value, $cast, t);
}

class TaskDetailsLoadedMapper extends SubClassMapperBase<TaskDetailsLoaded> {
  TaskDetailsLoadedMapper._();

  static TaskDetailsLoadedMapper? _instance;
  static TaskDetailsLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsLoadedMapper._());
      TaskDetailsStateMapper.ensureInitialized().addSubMapper(_instance!);
      TaskDetailsTaskVMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsLoaded';

  static TaskDetailsTaskVM _$task(TaskDetailsLoaded v) => v.task;
  static const Field<TaskDetailsLoaded, TaskDetailsTaskVM> _f$task =
      Field('task', _$task);

  @override
  final MappableFields<TaskDetailsLoaded> fields = const {
    #task: _f$task,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TaskDetailsLoaded';
  @override
  late final ClassMapperBase superMapper =
      TaskDetailsStateMapper.ensureInitialized();

  static TaskDetailsLoaded _instantiate(DecodingData data) {
    return TaskDetailsLoaded(task: data.dec(_f$task));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsLoaded>(map);
  }

  static TaskDetailsLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsLoaded>(json);
  }
}

mixin TaskDetailsLoadedMappable {
  String toJson() {
    return TaskDetailsLoadedMapper.ensureInitialized()
        .encodeJson<TaskDetailsLoaded>(this as TaskDetailsLoaded);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsLoadedMapper.ensureInitialized()
        .encodeMap<TaskDetailsLoaded>(this as TaskDetailsLoaded);
  }

  TaskDetailsLoadedCopyWith<TaskDetailsLoaded, TaskDetailsLoaded,
          TaskDetailsLoaded>
      get copyWith => _TaskDetailsLoadedCopyWithImpl(
          this as TaskDetailsLoaded, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsLoadedMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsLoaded);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsLoadedMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsLoaded, other);
  }

  @override
  int get hashCode {
    return TaskDetailsLoadedMapper.ensureInitialized()
        .hashValue(this as TaskDetailsLoaded);
  }
}

extension TaskDetailsLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsLoaded, $Out> {
  TaskDetailsLoadedCopyWith<$R, TaskDetailsLoaded, $Out>
      get $asTaskDetailsLoaded =>
          $base.as((v, t, t2) => _TaskDetailsLoadedCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsLoadedCopyWith<$R, $In extends TaskDetailsLoaded,
    $Out> implements TaskDetailsStateCopyWith<$R, $In, $Out> {
  TaskDetailsTaskVMCopyWith<$R, TaskDetailsTaskVM, TaskDetailsTaskVM> get task;
  @override
  $R call({TaskDetailsTaskVM? task});
  TaskDetailsLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsLoaded, $Out>
    implements TaskDetailsLoadedCopyWith<$R, TaskDetailsLoaded, $Out> {
  _TaskDetailsLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsLoaded> $mapper =
      TaskDetailsLoadedMapper.ensureInitialized();
  @override
  TaskDetailsTaskVMCopyWith<$R, TaskDetailsTaskVM, TaskDetailsTaskVM>
      get task => $value.task.copyWith.$chain((v) => call(task: v));
  @override
  $R call({TaskDetailsTaskVM? task}) =>
      $apply(FieldCopyWithData({if (task != null) #task: task}));
  @override
  TaskDetailsLoaded $make(CopyWithData data) =>
      TaskDetailsLoaded(task: data.get(#task, or: $value.task));

  @override
  TaskDetailsLoadedCopyWith<$R2, TaskDetailsLoaded, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsLoadedCopyWithImpl($value, $cast, t);
}

class TaskDetailsTaskVMMapper extends ClassMapperBase<TaskDetailsTaskVM> {
  TaskDetailsTaskVMMapper._();

  static TaskDetailsTaskVMMapper? _instance;
  static TaskDetailsTaskVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsTaskVMMapper._());
      TaskDetailsLessonVMMapper.ensureInitialized();
      TaskDetailsNoteVMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsTaskVM';

  static String? _$title(TaskDetailsTaskVM v) => v.title;
  static const Field<TaskDetailsTaskVM, String> _f$title =
      Field('title', _$title);
  static bool _$isUserTask(TaskDetailsTaskVM v) => v.isUserTask;
  static const Field<TaskDetailsTaskVM, bool> _f$isUserTask =
      Field('isUserTask', _$isUserTask);
  static quill.Delta? _$descriptionContent(TaskDetailsTaskVM v) =>
      v.descriptionContent;
  static const Field<TaskDetailsTaskVM, quill.Delta> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static List<TaskDetailsLessonVM>? _$lessons(TaskDetailsTaskVM v) => v.lessons;
  static const Field<TaskDetailsTaskVM, List<TaskDetailsLessonVM>> _f$lessons =
      Field('lessons', _$lessons);
  static List<TaskDetailsNoteVM>? _$notes(TaskDetailsTaskVM v) => v.notes;
  static const Field<TaskDetailsTaskVM, List<TaskDetailsNoteVM>> _f$notes =
      Field('notes', _$notes);

  @override
  final MappableFields<TaskDetailsTaskVM> fields = const {
    #title: _f$title,
    #isUserTask: _f$isUserTask,
    #descriptionContent: _f$descriptionContent,
    #lessons: _f$lessons,
    #notes: _f$notes,
  };

  static TaskDetailsTaskVM _instantiate(DecodingData data) {
    return TaskDetailsTaskVM(
        title: data.dec(_f$title),
        isUserTask: data.dec(_f$isUserTask),
        descriptionContent: data.dec(_f$descriptionContent),
        lessons: data.dec(_f$lessons),
        notes: data.dec(_f$notes));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsTaskVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsTaskVM>(map);
  }

  static TaskDetailsTaskVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsTaskVM>(json);
  }
}

mixin TaskDetailsTaskVMMappable {
  String toJson() {
    return TaskDetailsTaskVMMapper.ensureInitialized()
        .encodeJson<TaskDetailsTaskVM>(this as TaskDetailsTaskVM);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsTaskVMMapper.ensureInitialized()
        .encodeMap<TaskDetailsTaskVM>(this as TaskDetailsTaskVM);
  }

  TaskDetailsTaskVMCopyWith<TaskDetailsTaskVM, TaskDetailsTaskVM,
          TaskDetailsTaskVM>
      get copyWith => _TaskDetailsTaskVMCopyWithImpl(
          this as TaskDetailsTaskVM, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsTaskVMMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsTaskVM);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsTaskVMMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsTaskVM, other);
  }

  @override
  int get hashCode {
    return TaskDetailsTaskVMMapper.ensureInitialized()
        .hashValue(this as TaskDetailsTaskVM);
  }
}

extension TaskDetailsTaskVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsTaskVM, $Out> {
  TaskDetailsTaskVMCopyWith<$R, TaskDetailsTaskVM, $Out>
      get $asTaskDetailsTaskVM =>
          $base.as((v, t, t2) => _TaskDetailsTaskVMCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsTaskVMCopyWith<$R, $In extends TaskDetailsTaskVM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      TaskDetailsLessonVM,
      TaskDetailsLessonVMCopyWith<$R, TaskDetailsLessonVM,
          TaskDetailsLessonVM>>? get lessons;
  ListCopyWith<$R, TaskDetailsNoteVM,
          TaskDetailsNoteVMCopyWith<$R, TaskDetailsNoteVM, TaskDetailsNoteVM>>?
      get notes;
  $R call(
      {String? title,
      bool? isUserTask,
      quill.Delta? descriptionContent,
      List<TaskDetailsLessonVM>? lessons,
      List<TaskDetailsNoteVM>? notes});
  TaskDetailsTaskVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsTaskVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsTaskVM, $Out>
    implements TaskDetailsTaskVMCopyWith<$R, TaskDetailsTaskVM, $Out> {
  _TaskDetailsTaskVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsTaskVM> $mapper =
      TaskDetailsTaskVMMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      TaskDetailsLessonVM,
      TaskDetailsLessonVMCopyWith<$R, TaskDetailsLessonVM,
          TaskDetailsLessonVM>>? get lessons => $value.lessons != null
      ? ListCopyWith($value.lessons!, (v, t) => v.copyWith.$chain(t),
          (v) => call(lessons: v))
      : null;
  @override
  ListCopyWith<$R, TaskDetailsNoteVM,
          TaskDetailsNoteVMCopyWith<$R, TaskDetailsNoteVM, TaskDetailsNoteVM>>?
      get notes => $value.notes != null
          ? ListCopyWith($value.notes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(notes: v))
          : null;
  @override
  $R call(
          {Object? title = $none,
          bool? isUserTask,
          Object? descriptionContent = $none,
          Object? lessons = $none,
          Object? notes = $none}) =>
      $apply(FieldCopyWithData({
        if (title != $none) #title: title,
        if (isUserTask != null) #isUserTask: isUserTask,
        if (descriptionContent != $none)
          #descriptionContent: descriptionContent,
        if (lessons != $none) #lessons: lessons,
        if (notes != $none) #notes: notes
      }));
  @override
  TaskDetailsTaskVM $make(CopyWithData data) => TaskDetailsTaskVM(
      title: data.get(#title, or: $value.title),
      isUserTask: data.get(#isUserTask, or: $value.isUserTask),
      descriptionContent:
          data.get(#descriptionContent, or: $value.descriptionContent),
      lessons: data.get(#lessons, or: $value.lessons),
      notes: data.get(#notes, or: $value.notes));

  @override
  TaskDetailsTaskVMCopyWith<$R2, TaskDetailsTaskVM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsTaskVMCopyWithImpl($value, $cast, t);
}

class TaskDetailsLessonVMMapper extends ClassMapperBase<TaskDetailsLessonVM> {
  TaskDetailsLessonVMMapper._();

  static TaskDetailsLessonVMMapper? _instance;
  static TaskDetailsLessonVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsLessonVMMapper._());
      TaskDetailsTextLessonVMMapper.ensureInitialized();
      TaskDetailsVideoLessonVMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsLessonVM';

  static String _$id(TaskDetailsLessonVM v) => v.id;
  static const Field<TaskDetailsLessonVM, String> _f$id = Field('id', _$id);
  static String? _$title(TaskDetailsLessonVM v) => v.title;
  static const Field<TaskDetailsLessonVM, String> _f$title =
      Field('title', _$title);
  static bool? _$isCompleted(TaskDetailsLessonVM v) => v.isCompleted;
  static const Field<TaskDetailsLessonVM, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<TaskDetailsLessonVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #isCompleted: _f$isCompleted,
  };

  static TaskDetailsLessonVM _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TaskDetailsLessonVM', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsLessonVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsLessonVM>(map);
  }

  static TaskDetailsLessonVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsLessonVM>(json);
  }
}

mixin TaskDetailsLessonVMMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TaskDetailsLessonVMCopyWith<TaskDetailsLessonVM, TaskDetailsLessonVM,
      TaskDetailsLessonVM> get copyWith;
}

abstract class TaskDetailsLessonVMCopyWith<$R, $In extends TaskDetailsLessonVM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? title, bool? isCompleted});
  TaskDetailsLessonVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class TaskDetailsNoteVMMapper extends ClassMapperBase<TaskDetailsNoteVM> {
  TaskDetailsNoteVMMapper._();

  static TaskDetailsNoteVMMapper? _instance;
  static TaskDetailsNoteVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskDetailsNoteVMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsNoteVM';

  static String _$id(TaskDetailsNoteVM v) => v.id;
  static const Field<TaskDetailsNoteVM, String> _f$id = Field('id', _$id);
  static quill.Delta? _$content(TaskDetailsNoteVM v) => v.content;
  static const Field<TaskDetailsNoteVM, quill.Delta> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<TaskDetailsNoteVM> fields = const {
    #id: _f$id,
    #content: _f$content,
  };

  static TaskDetailsNoteVM _instantiate(DecodingData data) {
    return TaskDetailsNoteVM(
        id: data.dec(_f$id), content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsNoteVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsNoteVM>(map);
  }

  static TaskDetailsNoteVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsNoteVM>(json);
  }
}

mixin TaskDetailsNoteVMMappable {
  String toJson() {
    return TaskDetailsNoteVMMapper.ensureInitialized()
        .encodeJson<TaskDetailsNoteVM>(this as TaskDetailsNoteVM);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsNoteVMMapper.ensureInitialized()
        .encodeMap<TaskDetailsNoteVM>(this as TaskDetailsNoteVM);
  }

  TaskDetailsNoteVMCopyWith<TaskDetailsNoteVM, TaskDetailsNoteVM,
          TaskDetailsNoteVM>
      get copyWith => _TaskDetailsNoteVMCopyWithImpl(
          this as TaskDetailsNoteVM, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsNoteVMMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsNoteVM);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsNoteVMMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsNoteVM, other);
  }

  @override
  int get hashCode {
    return TaskDetailsNoteVMMapper.ensureInitialized()
        .hashValue(this as TaskDetailsNoteVM);
  }
}

extension TaskDetailsNoteVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsNoteVM, $Out> {
  TaskDetailsNoteVMCopyWith<$R, TaskDetailsNoteVM, $Out>
      get $asTaskDetailsNoteVM =>
          $base.as((v, t, t2) => _TaskDetailsNoteVMCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsNoteVMCopyWith<$R, $In extends TaskDetailsNoteVM,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, quill.Delta? content});
  TaskDetailsNoteVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsNoteVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsNoteVM, $Out>
    implements TaskDetailsNoteVMCopyWith<$R, TaskDetailsNoteVM, $Out> {
  _TaskDetailsNoteVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsNoteVM> $mapper =
      TaskDetailsNoteVMMapper.ensureInitialized();
  @override
  $R call({String? id, Object? content = $none}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (content != $none) #content: content}));
  @override
  TaskDetailsNoteVM $make(CopyWithData data) => TaskDetailsNoteVM(
      id: data.get(#id, or: $value.id),
      content: data.get(#content, or: $value.content));

  @override
  TaskDetailsNoteVMCopyWith<$R2, TaskDetailsNoteVM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TaskDetailsNoteVMCopyWithImpl($value, $cast, t);
}

class TaskDetailsTextLessonVMMapper
    extends SubClassMapperBase<TaskDetailsTextLessonVM> {
  TaskDetailsTextLessonVMMapper._();

  static TaskDetailsTextLessonVMMapper? _instance;
  static TaskDetailsTextLessonVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TaskDetailsTextLessonVMMapper._());
      TaskDetailsLessonVMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsTextLessonVM';

  static String _$id(TaskDetailsTextLessonVM v) => v.id;
  static const Field<TaskDetailsTextLessonVM, String> _f$id = Field('id', _$id);
  static String? _$title(TaskDetailsTextLessonVM v) => v.title;
  static const Field<TaskDetailsTextLessonVM, String> _f$title =
      Field('title', _$title);
  static bool? _$isCompleted(TaskDetailsTextLessonVM v) => v.isCompleted;
  static const Field<TaskDetailsTextLessonVM, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<TaskDetailsTextLessonVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #isCompleted: _f$isCompleted,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TaskDetailsTextLessonVM';
  @override
  late final ClassMapperBase superMapper =
      TaskDetailsLessonVMMapper.ensureInitialized();

  static TaskDetailsTextLessonVM _instantiate(DecodingData data) {
    return TaskDetailsTextLessonVM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        isCompleted: data.dec(_f$isCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsTextLessonVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsTextLessonVM>(map);
  }

  static TaskDetailsTextLessonVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsTextLessonVM>(json);
  }
}

mixin TaskDetailsTextLessonVMMappable {
  String toJson() {
    return TaskDetailsTextLessonVMMapper.ensureInitialized()
        .encodeJson<TaskDetailsTextLessonVM>(this as TaskDetailsTextLessonVM);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsTextLessonVMMapper.ensureInitialized()
        .encodeMap<TaskDetailsTextLessonVM>(this as TaskDetailsTextLessonVM);
  }

  TaskDetailsTextLessonVMCopyWith<TaskDetailsTextLessonVM,
          TaskDetailsTextLessonVM, TaskDetailsTextLessonVM>
      get copyWith => _TaskDetailsTextLessonVMCopyWithImpl(
          this as TaskDetailsTextLessonVM, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsTextLessonVMMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsTextLessonVM);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsTextLessonVMMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsTextLessonVM, other);
  }

  @override
  int get hashCode {
    return TaskDetailsTextLessonVMMapper.ensureInitialized()
        .hashValue(this as TaskDetailsTextLessonVM);
  }
}

extension TaskDetailsTextLessonVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsTextLessonVM, $Out> {
  TaskDetailsTextLessonVMCopyWith<$R, TaskDetailsTextLessonVM, $Out>
      get $asTaskDetailsTextLessonVM => $base
          .as((v, t, t2) => _TaskDetailsTextLessonVMCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsTextLessonVMCopyWith<
    $R,
    $In extends TaskDetailsTextLessonVM,
    $Out> implements TaskDetailsLessonVMCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, bool? isCompleted});
  TaskDetailsTextLessonVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsTextLessonVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsTextLessonVM, $Out>
    implements
        TaskDetailsTextLessonVMCopyWith<$R, TaskDetailsTextLessonVM, $Out> {
  _TaskDetailsTextLessonVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsTextLessonVM> $mapper =
      TaskDetailsTextLessonVMMapper.ensureInitialized();
  @override
  $R call({String? id, Object? title = $none, Object? isCompleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (isCompleted != $none) #isCompleted: isCompleted
      }));
  @override
  TaskDetailsTextLessonVM $make(CopyWithData data) => TaskDetailsTextLessonVM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  TaskDetailsTextLessonVMCopyWith<$R2, TaskDetailsTextLessonVM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TaskDetailsTextLessonVMCopyWithImpl($value, $cast, t);
}

class TaskDetailsVideoLessonVMMapper
    extends SubClassMapperBase<TaskDetailsVideoLessonVM> {
  TaskDetailsVideoLessonVMMapper._();

  static TaskDetailsVideoLessonVMMapper? _instance;
  static TaskDetailsVideoLessonVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TaskDetailsVideoLessonVMMapper._());
      TaskDetailsLessonVMMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TaskDetailsVideoLessonVM';

  static String _$id(TaskDetailsVideoLessonVM v) => v.id;
  static const Field<TaskDetailsVideoLessonVM, String> _f$id =
      Field('id', _$id);
  static String? _$title(TaskDetailsVideoLessonVM v) => v.title;
  static const Field<TaskDetailsVideoLessonVM, String> _f$title =
      Field('title', _$title);
  static bool? _$isCompleted(TaskDetailsVideoLessonVM v) => v.isCompleted;
  static const Field<TaskDetailsVideoLessonVM, bool> _f$isCompleted =
      Field('isCompleted', _$isCompleted);

  @override
  final MappableFields<TaskDetailsVideoLessonVM> fields = const {
    #id: _f$id,
    #title: _f$title,
    #isCompleted: _f$isCompleted,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TaskDetailsVideoLessonVM';
  @override
  late final ClassMapperBase superMapper =
      TaskDetailsLessonVMMapper.ensureInitialized();

  static TaskDetailsVideoLessonVM _instantiate(DecodingData data) {
    return TaskDetailsVideoLessonVM(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        isCompleted: data.dec(_f$isCompleted));
  }

  @override
  final Function instantiate = _instantiate;

  static TaskDetailsVideoLessonVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TaskDetailsVideoLessonVM>(map);
  }

  static TaskDetailsVideoLessonVM fromJson(String json) {
    return ensureInitialized().decodeJson<TaskDetailsVideoLessonVM>(json);
  }
}

mixin TaskDetailsVideoLessonVMMappable {
  String toJson() {
    return TaskDetailsVideoLessonVMMapper.ensureInitialized()
        .encodeJson<TaskDetailsVideoLessonVM>(this as TaskDetailsVideoLessonVM);
  }

  Map<String, dynamic> toMap() {
    return TaskDetailsVideoLessonVMMapper.ensureInitialized()
        .encodeMap<TaskDetailsVideoLessonVM>(this as TaskDetailsVideoLessonVM);
  }

  TaskDetailsVideoLessonVMCopyWith<TaskDetailsVideoLessonVM,
          TaskDetailsVideoLessonVM, TaskDetailsVideoLessonVM>
      get copyWith => _TaskDetailsVideoLessonVMCopyWithImpl(
          this as TaskDetailsVideoLessonVM, $identity, $identity);
  @override
  String toString() {
    return TaskDetailsVideoLessonVMMapper.ensureInitialized()
        .stringifyValue(this as TaskDetailsVideoLessonVM);
  }

  @override
  bool operator ==(Object other) {
    return TaskDetailsVideoLessonVMMapper.ensureInitialized()
        .equalsValue(this as TaskDetailsVideoLessonVM, other);
  }

  @override
  int get hashCode {
    return TaskDetailsVideoLessonVMMapper.ensureInitialized()
        .hashValue(this as TaskDetailsVideoLessonVM);
  }
}

extension TaskDetailsVideoLessonVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TaskDetailsVideoLessonVM, $Out> {
  TaskDetailsVideoLessonVMCopyWith<$R, TaskDetailsVideoLessonVM, $Out>
      get $asTaskDetailsVideoLessonVM => $base
          .as((v, t, t2) => _TaskDetailsVideoLessonVMCopyWithImpl(v, t, t2));
}

abstract class TaskDetailsVideoLessonVMCopyWith<
    $R,
    $In extends TaskDetailsVideoLessonVM,
    $Out> implements TaskDetailsLessonVMCopyWith<$R, $In, $Out> {
  @override
  $R call({String? id, String? title, bool? isCompleted});
  TaskDetailsVideoLessonVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TaskDetailsVideoLessonVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TaskDetailsVideoLessonVM, $Out>
    implements
        TaskDetailsVideoLessonVMCopyWith<$R, TaskDetailsVideoLessonVM, $Out> {
  _TaskDetailsVideoLessonVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TaskDetailsVideoLessonVM> $mapper =
      TaskDetailsVideoLessonVMMapper.ensureInitialized();
  @override
  $R call({String? id, Object? title = $none, Object? isCompleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != $none) #title: title,
        if (isCompleted != $none) #isCompleted: isCompleted
      }));
  @override
  TaskDetailsVideoLessonVM $make(CopyWithData data) => TaskDetailsVideoLessonVM(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      isCompleted: data.get(#isCompleted, or: $value.isCompleted));

  @override
  TaskDetailsVideoLessonVMCopyWith<$R2, TaskDetailsVideoLessonVM, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TaskDetailsVideoLessonVMCopyWithImpl($value, $cast, t);
}
