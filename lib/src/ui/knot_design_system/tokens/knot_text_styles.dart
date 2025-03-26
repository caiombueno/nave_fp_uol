import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_font_sizes.dart';

abstract class KnotSemanticTextStyles {
  static const kanbanColumnTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: KnotSemanticFontSizes.kanbanColumnTitle,
  );

  static const createCardButton = TextStyle(
    fontWeight: FontWeight.w400,
    color: KnotCoreColors.black,
  );

  static const cardCreationTextField = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: KnotCoreFontSizes.medium,
  );

  static const kanbanCardTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: KnotSemanticFontSizes.kanbanCardTitle,
    color: KnotSemanticColors.kanbanCardTitle,
  );

  static const kanbanCardDoneTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: KnotSemanticFontSizes.kanbanCardTitle,
    color: KnotSemanticColors.kanbanCardTitle,
    decoration: TextDecoration.lineThrough,
  );

  static const kanbanBoardAddCardCancelButtonLabel = TextStyle(
    fontWeight: FontWeight.w500,
    color: KnotCoreColors.blue,
  );

  static const knotTextButtonPrimary = TextStyle(
    fontWeight: FontWeight.bold,
    color: KnotCoreColors.blue,
  );

  static const knotTextButtonSecondary = TextStyle(
    fontWeight: FontWeight.w500,
    color: KnotCoreColors.blue,
  );

  static const knotTextButtonPrimaryDisabled = TextStyle(
    fontWeight: FontWeight.bold,
    color: KnotCoreColors.grey,
  );

  static const knotTextButtonSecondaryDisabled = TextStyle(
    fontWeight: FontWeight.w500,
    color: KnotCoreColors.grey,
  );

  static const kanbanBoardAddCardConfirmButtonLabel = TextStyle(
    fontWeight: FontWeight.bold,
    color: KnotCoreColors.blue,
  );

  static const taskDetailsLessonListTileTitle = TextStyle(
    fontSize: KnotSemanticFontSizes.taskDetailsLessonListTileTitle,
    color: KnotCoreColors.darkGrey,
  );

  static const quillEditorParagraph = TextStyle(
    fontSize: 16.0,
    height: 1.4,
    color: KnotCoreColors.darkGrey,
  );

  static const quillEditorHintText = TextStyle(
    fontSize: 16.0,
    height: 1.4,
    color: KnotCoreColors.grey,
  );

  static const taskDetailsScreenTitle = TextStyle(
    color: KnotCoreColors.darkGrey,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const taskDetailsLessonSectionTitle =
      TextStyle(color: KnotCoreColors.darkGrey);

  static const videoLessonErrorMessage = TextStyle(
    color: KnotCoreColors.white,
    fontSize: 16,
  );

  static const textLessonTitle = TextStyle(
    color: KnotCoreColors.darkGrey,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const kanbanBoardScreenErrorMessage = TextStyle(
    color: KnotCoreColors.white,
    fontSize: 20,
  );
}
