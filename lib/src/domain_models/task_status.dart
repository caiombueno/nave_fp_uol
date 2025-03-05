import 'package:dart_mappable/dart_mappable.dart';

part 'generated/task_status.mapper.dart';

@MappableEnum()
enum TaskStatus { toDo, inProgress, done }
