import 'package:dart_mappable/dart_mappable.dart';

part 'generated/task_status_sm.mapper.dart';

@MappableEnum()
enum TaskStatusSM {
  @MappableValue('to_do')
  toDo,
  @MappableValue('in_progress')
  inProgress,
  @MappableValue('done')
  done
}
