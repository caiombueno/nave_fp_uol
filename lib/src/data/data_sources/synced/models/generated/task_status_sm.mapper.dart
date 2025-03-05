// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../task_status_sm.dart';

class TaskStatusSMMapper extends EnumMapper<TaskStatusSM> {
  TaskStatusSMMapper._();

  static TaskStatusSMMapper? _instance;
  static TaskStatusSMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TaskStatusSMMapper._());
    }
    return _instance!;
  }

  static TaskStatusSM fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TaskStatusSM decode(dynamic value) {
    switch (value) {
      case 'to_do':
        return TaskStatusSM.toDo;
      case 'in_progress':
        return TaskStatusSM.inProgress;
      case 'done':
        return TaskStatusSM.done;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TaskStatusSM self) {
    switch (self) {
      case TaskStatusSM.toDo:
        return 'to_do';
      case TaskStatusSM.inProgress:
        return 'in_progress';
      case TaskStatusSM.done:
        return 'done';
    }
  }
}

extension TaskStatusSMMapperExtension on TaskStatusSM {
  dynamic toValue() {
    TaskStatusSMMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TaskStatusSM>(this);
  }
}
