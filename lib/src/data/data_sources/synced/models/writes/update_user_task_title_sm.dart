import 'package:dart_mappable/dart_mappable.dart';

part 'generated/update_user_task_title_sm.mapper.dart';

@MappableClass()
class UpdateUserTaskTitleSM with UpdateUserTaskTitleSMMappable {
  const UpdateUserTaskTitleSM({
    required this.taskId,
    required this.newTitle,
  });

  @MappableField(key: 'id')
  final String? taskId;
  @MappableField(key: 'title')
  final String newTitle;
}
