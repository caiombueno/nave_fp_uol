import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';

part 'generated/system_task_user_data_sm.mapper.dart';

@MappableClass()
class SystemTaskUserDataSM with SystemTaskUserDataSMMappable {
  const SystemTaskUserDataSM({
    required this.taskId,
    required this.status,
    required this.lastStatusUpdateDateTime,
    required this.selectedSortKey,
  });

  @MappableField(key: 'id')
  final String taskId;
  final TaskStatusSM? status;
  final Timestamp? lastStatusUpdateDateTime;
  final double? selectedSortKey;
}
