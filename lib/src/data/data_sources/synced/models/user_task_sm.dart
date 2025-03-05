import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';

part 'generated/user_task_sm.mapper.dart';

@MappableClass()
class UserTaskSM with UserTaskSMMappable {
  const UserTaskSM({
    required this.id,
    required this.title,
    required this.descriptionContent,
    required this.status,
    required this.lastStatusUpdateDateTime,
    required this.selectedSortKey,
  });

  final String id;
  final String? title;
  final String? descriptionContent;
  final TaskStatusSM? status;
  final Timestamp? lastStatusUpdateDateTime;
  final double? selectedSortKey;
}
