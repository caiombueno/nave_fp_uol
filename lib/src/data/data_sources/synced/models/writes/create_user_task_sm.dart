import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';

part 'generated/create_user_task_sm.mapper.dart';

@MappableClass()
class CreateUserTaskSM with CreateUserTaskSMMappable {
  CreateUserTaskSM({
    required this.title,
    required this.selectedSortKey,
    required this.status,
  }) : creationDateTime = FieldValue.serverTimestamp();

  @MappableConstructor()
  const CreateUserTaskSM.fromMappable({
    required this.title,
    required this.selectedSortKey,
    required this.creationDateTime,
    required this.status,
  });

  final String title;
  final FieldValue creationDateTime;
  final double selectedSortKey;
  final TaskStatusSM? status;
}
