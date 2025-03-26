abstract class KnotCoreSizings {
  static const size1x = 8.0;
  static const size2x = 16.0;
  static const size3x = 24.0;
  static const size4x = 32.0;
  static const size5x = 40.0;
  static const size6x = 48.0;
  static const size7x = 56.0;
  static const size8x = 64.0;
  static const size9x = 72.0;
  static const size10x = 80.0;
  static const size11x = 88.0;
  static const size12x = 96.0;
  static const size40x = 320.0;
}

abstract class KnotSemanticSizings {
  /// Only used by [ContinuousScrollKanbanBoard]'s [KanbanColumn]s.
  static const double kanbanColumnWidth = KnotCoreSizings.size40x;

  static const double pageDragZoneWidth = KnotCoreSizings.size5x;

  static const double pageIndicatorDotWidth = KnotCoreSizings.size1x;

  static const double kanbanCardLeadingIcon = KnotCoreSizings.size2x;

  static const double taskDetailsLessonListTileIcon = KnotCoreSizings.size3x;

  static const double taskDetailsLessonNotesSectionLeadingIcon =
      KnotCoreSizings.size3x;
}
