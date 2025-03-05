// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../task.dart';

class TaskMapper extends ClassMapperBase<Task> {
  TaskMapper._();

  static TaskMapper? _instance;
  static TaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskMapper._());
      SystemTaskMapper.ensureInitialized();
      UserTaskMapper.ensureInitialized();
      TaskStatusMapper.ensureInitialized();
      NoteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Task';

  static String? _$id(Task v) => v.id;
  static const Field<Task, String> _f$id = Field('id', _$id);
  static String? _$title(Task v) => v.title;
  static const Field<Task, String> _f$title = Field('title', _$title);
  static String? _$descriptionContent(Task v) => v.descriptionContent;
  static const Field<Task, String> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static TaskStatus _$status(Task v) => v.status;
  static const Field<Task, TaskStatus> _f$status = Field('status', _$status);
  static TZDateTime? _$lastStatusUpdateDateTime(Task v) =>
      v.lastStatusUpdateDateTime;
  static const Field<Task, TZDateTime> _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static List<Note>? _$notes(Task v) => v.notes;
  static const Field<Task, List<Note>> _f$notes = Field('notes', _$notes);

  @override
  final MappableFields<Task> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionContent: _f$descriptionContent,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #notes: _f$notes,
  };

  static Task _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Task', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Task fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Task>(map);
  }

  static Task fromJson(String json) {
    return ensureInitialized().decodeJson<Task>(json);
  }
}

mixin TaskMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TaskCopyWith<Task, Task, Task> get copyWith;
}

abstract class TaskCopyWith<$R, $In extends Task, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>>? get notes;
  $R call(
      {String? id,
      String? title,
      String? descriptionContent,
      TaskStatus? status,
      TZDateTime? lastStatusUpdateDateTime,
      List<Note>? notes});
  TaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SystemTaskMapper extends SubClassMapperBase<SystemTask> {
  SystemTaskMapper._();

  static SystemTaskMapper? _instance;
  static SystemTaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SystemTaskMapper._());
      TaskMapper.ensureInitialized().addSubMapper(_instance!);
      TaskStatusMapper.ensureInitialized();
      NoteMapper.ensureInitialized();
      LessonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SystemTask';

  static String? _$id(SystemTask v) => v.id;
  static const Field<SystemTask, String> _f$id = Field('id', _$id);
  static String? _$title(SystemTask v) => v.title;
  static const Field<SystemTask, String> _f$title = Field('title', _$title);
  static String? _$descriptionContent(SystemTask v) => v.descriptionContent;
  static const Field<SystemTask, String> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static TaskStatus _$status(SystemTask v) => v.status;
  static const Field<SystemTask, TaskStatus> _f$status =
      Field('status', _$status);
  static TZDateTime? _$lastStatusUpdateDateTime(SystemTask v) =>
      v.lastStatusUpdateDateTime;
  static const Field<SystemTask, TZDateTime> _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static List<Note>? _$notes(SystemTask v) => v.notes;
  static const Field<SystemTask, List<Note>> _f$notes = Field('notes', _$notes);
  static bool? _$isFree(SystemTask v) => v.isFree;
  static const Field<SystemTask, bool> _f$isFree = Field('isFree', _$isFree);
  static List<String>? _$blockingTaskIds(SystemTask v) => v.blockingTaskIds;
  static const Field<SystemTask, List<String>> _f$blockingTaskIds =
      Field('blockingTaskIds', _$blockingTaskIds);
  static List<Lesson>? _$lessons(SystemTask v) => v.lessons;
  static const Field<SystemTask, List<Lesson>> _f$lessons =
      Field('lessons', _$lessons);

  @override
  final MappableFields<SystemTask> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionContent: _f$descriptionContent,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #notes: _f$notes,
    #isFree: _f$isFree,
    #blockingTaskIds: _f$blockingTaskIds,
    #lessons: _f$lessons,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SystemTask';
  @override
  late final ClassMapperBase superMapper = TaskMapper.ensureInitialized();

  static SystemTask _instantiate(DecodingData data) {
    return SystemTask(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        descriptionContent: data.dec(_f$descriptionContent),
        status: data.dec(_f$status),
        lastStatusUpdateDateTime: data.dec(_f$lastStatusUpdateDateTime),
        notes: data.dec(_f$notes),
        isFree: data.dec(_f$isFree),
        blockingTaskIds: data.dec(_f$blockingTaskIds),
        lessons: data.dec(_f$lessons));
  }

  @override
  final Function instantiate = _instantiate;

  static SystemTask fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SystemTask>(map);
  }

  static SystemTask fromJson(String json) {
    return ensureInitialized().decodeJson<SystemTask>(json);
  }
}

mixin SystemTaskMappable {
  String toJson() {
    return SystemTaskMapper.ensureInitialized()
        .encodeJson<SystemTask>(this as SystemTask);
  }

  Map<String, dynamic> toMap() {
    return SystemTaskMapper.ensureInitialized()
        .encodeMap<SystemTask>(this as SystemTask);
  }

  SystemTaskCopyWith<SystemTask, SystemTask, SystemTask> get copyWith =>
      _SystemTaskCopyWithImpl(this as SystemTask, $identity, $identity);
  @override
  String toString() {
    return SystemTaskMapper.ensureInitialized()
        .stringifyValue(this as SystemTask);
  }

  @override
  bool operator ==(Object other) {
    return SystemTaskMapper.ensureInitialized()
        .equalsValue(this as SystemTask, other);
  }

  @override
  int get hashCode {
    return SystemTaskMapper.ensureInitialized().hashValue(this as SystemTask);
  }
}

extension SystemTaskValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SystemTask, $Out> {
  SystemTaskCopyWith<$R, SystemTask, $Out> get $asSystemTask =>
      $base.as((v, t, t2) => _SystemTaskCopyWithImpl(v, t, t2));
}

abstract class SystemTaskCopyWith<$R, $In extends SystemTask, $Out>
    implements TaskCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>>? get notes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds;
  ListCopyWith<$R, Lesson, ObjectCopyWith<$R, Lesson, Lesson>>? get lessons;
  @override
  $R call(
      {String? id,
      String? title,
      String? descriptionContent,
      TaskStatus? status,
      TZDateTime? lastStatusUpdateDateTime,
      List<Note>? notes,
      bool? isFree,
      List<String>? blockingTaskIds,
      List<Lesson>? lessons});
  SystemTaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SystemTaskCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SystemTask, $Out>
    implements SystemTaskCopyWith<$R, SystemTask, $Out> {
  _SystemTaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SystemTask> $mapper =
      SystemTaskMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>>? get notes =>
      $value.notes != null
          ? ListCopyWith($value.notes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(notes: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get blockingTaskIds => $value.blockingTaskIds != null
          ? ListCopyWith(
              $value.blockingTaskIds!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(blockingTaskIds: v))
          : null;
  @override
  ListCopyWith<$R, Lesson, ObjectCopyWith<$R, Lesson, Lesson>>? get lessons =>
      $value.lessons != null
          ? ListCopyWith(
              $value.lessons!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(lessons: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? descriptionContent = $none,
          TaskStatus? status,
          Object? lastStatusUpdateDateTime = $none,
          Object? notes = $none,
          Object? isFree = $none,
          Object? blockingTaskIds = $none,
          Object? lessons = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (descriptionContent != $none)
          #descriptionContent: descriptionContent,
        if (status != null) #status: status,
        if (lastStatusUpdateDateTime != $none)
          #lastStatusUpdateDateTime: lastStatusUpdateDateTime,
        if (notes != $none) #notes: notes,
        if (isFree != $none) #isFree: isFree,
        if (blockingTaskIds != $none) #blockingTaskIds: blockingTaskIds,
        if (lessons != $none) #lessons: lessons
      }));
  @override
  SystemTask $make(CopyWithData data) => SystemTask(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      descriptionContent:
          data.get(#descriptionContent, or: $value.descriptionContent),
      status: data.get(#status, or: $value.status),
      lastStatusUpdateDateTime: data.get(#lastStatusUpdateDateTime,
          or: $value.lastStatusUpdateDateTime),
      notes: data.get(#notes, or: $value.notes),
      isFree: data.get(#isFree, or: $value.isFree),
      blockingTaskIds: data.get(#blockingTaskIds, or: $value.blockingTaskIds),
      lessons: data.get(#lessons, or: $value.lessons));

  @override
  SystemTaskCopyWith<$R2, SystemTask, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SystemTaskCopyWithImpl($value, $cast, t);
}

class UserTaskMapper extends SubClassMapperBase<UserTask> {
  UserTaskMapper._();

  static UserTaskMapper? _instance;
  static UserTaskMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTaskMapper._());
      TaskMapper.ensureInitialized().addSubMapper(_instance!);
      TaskStatusMapper.ensureInitialized();
      NoteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserTask';

  static String? _$id(UserTask v) => v.id;
  static const Field<UserTask, String> _f$id = Field('id', _$id);
  static String? _$title(UserTask v) => v.title;
  static const Field<UserTask, String> _f$title = Field('title', _$title);
  static String? _$descriptionContent(UserTask v) => v.descriptionContent;
  static const Field<UserTask, String> _f$descriptionContent =
      Field('descriptionContent', _$descriptionContent);
  static TaskStatus _$status(UserTask v) => v.status;
  static const Field<UserTask, TaskStatus> _f$status =
      Field('status', _$status);
  static TZDateTime? _$lastStatusUpdateDateTime(UserTask v) =>
      v.lastStatusUpdateDateTime;
  static const Field<UserTask, TZDateTime> _f$lastStatusUpdateDateTime =
      Field('lastStatusUpdateDateTime', _$lastStatusUpdateDateTime);
  static List<Note>? _$notes(UserTask v) => v.notes;
  static const Field<UserTask, List<Note>> _f$notes = Field('notes', _$notes);

  @override
  final MappableFields<UserTask> fields = const {
    #id: _f$id,
    #title: _f$title,
    #descriptionContent: _f$descriptionContent,
    #status: _f$status,
    #lastStatusUpdateDateTime: _f$lastStatusUpdateDateTime,
    #notes: _f$notes,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'UserTask';
  @override
  late final ClassMapperBase superMapper = TaskMapper.ensureInitialized();

  static UserTask _instantiate(DecodingData data) {
    return UserTask(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        descriptionContent: data.dec(_f$descriptionContent),
        status: data.dec(_f$status),
        lastStatusUpdateDateTime: data.dec(_f$lastStatusUpdateDateTime),
        notes: data.dec(_f$notes));
  }

  @override
  final Function instantiate = _instantiate;

  static UserTask fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserTask>(map);
  }

  static UserTask fromJson(String json) {
    return ensureInitialized().decodeJson<UserTask>(json);
  }
}

mixin UserTaskMappable {
  String toJson() {
    return UserTaskMapper.ensureInitialized()
        .encodeJson<UserTask>(this as UserTask);
  }

  Map<String, dynamic> toMap() {
    return UserTaskMapper.ensureInitialized()
        .encodeMap<UserTask>(this as UserTask);
  }

  UserTaskCopyWith<UserTask, UserTask, UserTask> get copyWith =>
      _UserTaskCopyWithImpl(this as UserTask, $identity, $identity);
  @override
  String toString() {
    return UserTaskMapper.ensureInitialized().stringifyValue(this as UserTask);
  }

  @override
  bool operator ==(Object other) {
    return UserTaskMapper.ensureInitialized()
        .equalsValue(this as UserTask, other);
  }

  @override
  int get hashCode {
    return UserTaskMapper.ensureInitialized().hashValue(this as UserTask);
  }
}

extension UserTaskValueCopy<$R, $Out> on ObjectCopyWith<$R, UserTask, $Out> {
  UserTaskCopyWith<$R, UserTask, $Out> get $asUserTask =>
      $base.as((v, t, t2) => _UserTaskCopyWithImpl(v, t, t2));
}

abstract class UserTaskCopyWith<$R, $In extends UserTask, $Out>
    implements TaskCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>>? get notes;
  @override
  $R call(
      {String? id,
      String? title,
      String? descriptionContent,
      TaskStatus? status,
      TZDateTime? lastStatusUpdateDateTime,
      List<Note>? notes});
  UserTaskCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserTaskCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserTask, $Out>
    implements UserTaskCopyWith<$R, UserTask, $Out> {
  _UserTaskCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserTask> $mapper =
      UserTaskMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Note, NoteCopyWith<$R, Note, Note>>? get notes =>
      $value.notes != null
          ? ListCopyWith($value.notes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(notes: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? title = $none,
          Object? descriptionContent = $none,
          TaskStatus? status,
          Object? lastStatusUpdateDateTime = $none,
          Object? notes = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (title != $none) #title: title,
        if (descriptionContent != $none)
          #descriptionContent: descriptionContent,
        if (status != null) #status: status,
        if (lastStatusUpdateDateTime != $none)
          #lastStatusUpdateDateTime: lastStatusUpdateDateTime,
        if (notes != $none) #notes: notes
      }));
  @override
  UserTask $make(CopyWithData data) => UserTask(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      descriptionContent:
          data.get(#descriptionContent, or: $value.descriptionContent),
      status: data.get(#status, or: $value.status),
      lastStatusUpdateDateTime: data.get(#lastStatusUpdateDateTime,
          or: $value.lastStatusUpdateDateTime),
      notes: data.get(#notes, or: $value.notes));

  @override
  UserTaskCopyWith<$R2, UserTask, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserTaskCopyWithImpl($value, $cast, t);
}
