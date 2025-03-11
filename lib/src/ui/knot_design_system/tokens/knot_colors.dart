import 'package:flutter/material.dart';

abstract class KnotCoreColors {
  static const Color black = Colors.black;
  static const Color lightGrey = Color(0xFFF1F2F4);

  static const Color white = Colors.white;

  static const Color blue = Color(0xFF2679BF);
}

abstract class KnotSemanticColors {
  static const Color kanbanCardTitle = KnotCoreColors.black;
  static const Color kanbanCardLeadingIcon = KnotCoreColors.black;

  static const Color kanbanColumnBackground = KnotCoreColors.lightGrey;
  static const Color kanbanCardBackground = KnotCoreColors.white;

  static const Color kanbanBoardScreenBackground = KnotCoreColors.blue;

  static const Color taskDetailsScreenBackground = KnotCoreColors.lightGrey;
  static const Color taskDetailsSectionBackground = KnotCoreColors.white;

  static const Color taskDetailsLessonListTileIcon = KnotCoreColors.black;

  static const Color taskDetailsLessonsSectionTitle = KnotCoreColors.black;

  static const Color knotExpansionTileDefaultTrailingIcon =
      KnotCoreColors.black;
}
