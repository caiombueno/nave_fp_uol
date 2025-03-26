abstract class KnotCoreSpacings {
  static const double none = 0;
  static const double xSmall = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double mediumLarge = 16;
  static const double large = 20;
  static const double xLarge = 24;
  static const double xxLarge = 48;
  static const double xxxLarge = 64;
}

abstract class KnotSemanticSpacings {
  static const double screenSideBorders = KnotCoreSpacings.mediumLarge;
  static const double formFieldsVerticalSpacer = KnotCoreSpacings.large;
  static const double kanbanPageViewHorizontalSpacer =
      KnotCoreSpacings.mediumLarge;

  static const double kanbanColumnHorizontalPadding = KnotCoreSpacings.small;
  static const double kanbanColumnVerticalPadding = KnotCoreSpacings.medium;
  static const double kanbanCardPadding = KnotCoreSpacings.small;

  static const double kanbanCardCreationTopPadding = KnotCoreSpacings.small;
  static const double kanbanColumnFooterButtonHorizontalPadding =
      KnotCoreSpacings.small;

  static const double taskDetailsSectionHorizontalPadding =
      KnotCoreSpacings.mediumLarge;

  static const double taskDetailsSectionVerticalPadding =
      KnotCoreSpacings.medium;

  static const double taskDetailsLessonListTileHorizontalTitleGap =
      KnotCoreSpacings.small;

  static const double taskDetailsLessonsSectionLeadingGap =
      KnotCoreSpacings.xSmall;

  static const double taskDetailsScreenSectionGap = KnotCoreSpacings.medium;

  static const double taskDetailsNotesSectionHeaderLeadingGap =
      KnotCoreSpacings.xSmall;

  static const double taskDetailsLessonNotesSectionTitleContentGap =
      KnotCoreSpacings.small;

  static const double taskDetailsLessonNotesGap = KnotCoreSpacings.small;

  static const double textLessonLoadedViewHorizontalPadding =
      KnotCoreSpacings.xLarge;

  static const double textLessonLoadedViewVerticalPadding =
      KnotCoreSpacings.mediumLarge;
}
