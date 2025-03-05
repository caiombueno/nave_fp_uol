import 'package:dart_mappable/dart_mappable.dart';

part 'generated/upsert_task_selected_sort_key_sm.mapper.dart';

@MappableClass()
class UpsertTaskSelectedSortKeySM with UpsertTaskSelectedSortKeySMMappable {
  UpsertTaskSelectedSortKeySM({
    required this.taskId,
    required this.selectedSortKey,
  });

  @MappableField(key: 'id')
  final String? taskId;
  final double selectedSortKey;
}
