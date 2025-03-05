// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../task_status.dart';

class TaskStatusMapper extends EnumMapper<TaskStatus> {
  TaskStatusMapper._();

  static TaskStatusMapper? _instance;
  static TaskStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskStatusMapper._());
    }
    return _instance!;
  }

  static TaskStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskStatus decode(dynamic value) {
    switch (value) {
      case 'toDo':
        return TaskStatus.toDo;
      case 'inProgress':
        return TaskStatus.inProgress;
      case 'done':
        return TaskStatus.done;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskStatus self) {
    switch (self) {
      case TaskStatus.toDo:
        return 'toDo';
      case TaskStatus.inProgress:
        return 'inProgress';
      case TaskStatus.done:
        return 'done';
    }
  }
}

extension TaskStatusMapperExtension on TaskStatus {
  String toValue() {
    TaskStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskStatus>(this) as String;
  }
}
