import 'package:dart_mappable/dart_mappable.dart';

part 'generated/update_user_task_description_sm.mapper.dart';

@MappableClass()
class UpdateUserTaskDescriptionSM with UpdateUserTaskDescriptionSMMappable {
  const UpdateUserTaskDescriptionSM({
    required this.taskId,
    required this.newContent,
  });

  @MappableField(key: 'id')
  final String? taskId;
  @MappableField(key: 'descriptionContent')
  final String newContent;
}
