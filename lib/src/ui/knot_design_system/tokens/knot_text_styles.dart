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

  static const kanbanBoardAddCardConfirmButtonLabel = TextStyle(
    fontWeight: FontWeight.bold,
    color: KnotCoreColors.blue,
  );

  static const taskDetailsLessonListTileTitle = TextStyle(
    fontSize: KnotSemanticFontSizes.taskDetailsLessonListTileTitle,
    color: KnotCoreColors.black,
  );
}
