import 'package:dart_mappable/dart_mappable.dart';

part 'generated/system_task_sm.mapper.dart';

@MappableClass()
class SystemTaskSM with SystemTaskSMMappable {
  const SystemTaskSM({
    required this.id,
    required this.title,
    required this.descriptionContent,
    required this.isFree,
    required this.blockingTaskIds,
    required this.defaultSortKey,
    required this.lessonIds,
  });

  final String id;
  final String? title;
  final String? descriptionContent;
  final bool? isFree;
  final List<String>? blockingTaskIds;
  final int? defaultSortKey;
  final List<String>? lessonIds;
}
