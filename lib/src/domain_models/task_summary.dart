import 'package:dart_mappable/dart_mappable.dart';
import 'package:nave_fp_uol/src/domain_models/task_status.dart';

part 'generated/task_summary.mapper.dart';

@MappableClass()
sealed class TaskSummary with TaskSummaryMappable {
  const TaskSummary({
    required this.id,
    required this.title,
    required this.status,
    required this.selectedSortKey,
  });

  final String id;
  final String? title;
  final TaskStatus status;
  final double? selectedSortKey;
}

@MappableClass()
class SystemTaskSummary extends TaskSummary with SystemTaskSummaryMappable {
  const SystemTaskSummary({
    required super.id,
    required super.title,
    required super.status,
    required super.selectedSortKey,
    required this.isFree,
    required this.blockingTaskIds,
    required this.defaultSortKey,
  });

  final bool? isFree;
  final List<String>? blockingTaskIds;
  final int? defaultSortKey;
}

@MappableClass()
class UserTaskSummary extends TaskSummary with UserTaskSummaryMappable {
  const UserTaskSummary({
    required super.id,
    required super.title,
    required super.status,
    required super.selectedSortKey,
  });
}
