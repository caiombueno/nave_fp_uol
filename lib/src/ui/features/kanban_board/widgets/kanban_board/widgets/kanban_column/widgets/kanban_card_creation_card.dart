import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_cards/kanban_card_container.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

class KanbanCardCreationCard extends StatelessWidget {
  const KanbanCardCreationCard({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onSubmitted,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return KanbanCardContainer(
      child: TextField(
        cursorColor: KnotCoreColors.blue,
        style: KnotSemanticTextStyles.cardCreationTextField,
        onTapOutside: (_) => focusNode?.unfocus(),
        controller: controller,
        focusNode: focusNode,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: KnotCoreSpacings.xSmall,
            vertical: KnotCoreSpacings.none,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          isDense: true,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
