import 'package:flutter/material.dart';

abstract class KnotCoreColors {
  static const Color black = Colors.black;
  static const Color lightGrey = Color(0xFFF1F2F4);
  static const Color darkGrey = Color(0xFF253757);

  static const Color white = Colors.white;

  static const Color blue = Color(0xFF2679BF);

  static const Color grey = Color(0xFFB0B0B0);

  static const Color red = Color(0xFFEB5A46);
}

abstract class KnotSemanticColors {
  static const Color kanbanCardTitle = KnotCoreColors.black;
  static const Color kanbanCardLeadingIcon = KnotCoreColors.black;

  static const Color kanbanColumnBackground = KnotCoreColors.lightGrey;
  static const Color kanbanCardBackground = KnotCoreColors.white;

  static const Color kanbanBoardScreenBackground = KnotCoreColors.blue;

  static const Color taskDetailsScreenBackground = KnotCoreColors.lightGrey;
  static const Color taskDetailsSectionBackground = KnotCoreColors.white;

  static const Color taskDetailsLessonListTileIcon = KnotCoreColors.darkGrey;

  static const Color taskDetailsLessonsSectionTitle = KnotCoreColors.darkGrey;

  static const Color textLessonScreenBackground = KnotCoreColors.white;

  static const Color knotExpansionTileDefaultTrailingIcon =
      KnotCoreColors.darkGrey;

  static const Color videoLessonScreenBackground = KnotCoreColors.black;

  static const Color videoLessonScreenBackButton = KnotCoreColors.white;

  static const Color videoLessonScreenProgressIndicator = KnotCoreColors.white;

  static const Color taskDetailsLessonBackButton = KnotCoreColors.darkGrey;

  static const Color kanbanBoardScreenProgressIndicator = KnotCoreColors.white;

  static const Color signInScreenBackground = KnotCoreColors.white;

  static const Color knotExpandedElevatedButtonBackground =
      KnotCoreColors.white;

  static const Color forgotMyPasswordDialogBackground = KnotCoreColors.white;
}
