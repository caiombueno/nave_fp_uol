import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: KnotCoreColors.black,
          ),
          const SizedBox(
            width: KnotCoreSpacings.xSmall,
          ),
          Text(
            l10n.kanbanBoardAddCardButtonLabel,
            style: KnotSemanticTextStyles.createCardButton,
          ),
        ],
      ),
    );
  }
}
