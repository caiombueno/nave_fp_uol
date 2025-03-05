import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';

part 'generated/upsert_task_status_sm.mapper.dart';

@MappableClass()
class UpsertTaskStatusSM with UpsertTaskStatusSMMappable {
  UpsertTaskStatusSM({
    required this.taskId,
    required this.status,
    required this.selectedSortKey,
  }) : lastStatusUpdateDateTime = FieldValue.serverTimestamp();

  @MappableConstructor()
  const UpsertTaskStatusSM.fromMappable({
    required this.taskId,
    required this.status,
    required this.lastStatusUpdateDateTime,
    required this.selectedSortKey,
  });

  @MappableField(key: 'id')
  final String? taskId;
  final TaskStatusSM? status;
  final FieldValue lastStatusUpdateDateTime;
  final double selectedSortKey;
}
