import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_card_creation_card.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_border_radius.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

/// The footer of the [KanbanColumn] widget.
///
/// It is responsible for allowing the user to create a new card in the column.
///
/// When clicked on submit button, it calls [onSubmitted] with the card's title.
/// When clicked on cancel button, it calls [onCancel].
class CardCreationColumnFooter extends StatefulWidget {
  const CardCreationColumnFooter({
    super.key,
    this.onSubmitted,
    this.onCancel,
  });
  final void Function(String)? onSubmitted;
  final VoidCallback? onCancel;

  @override
  State<CardCreationColumnFooter> createState() =>
      _CardCreationColumnFooterState();
}

class _CardCreationColumnFooterState extends State<CardCreationColumnFooter> {
  final TextEditingController _cardTextController = TextEditingController();
  final FocusNode _cardTextFocusNode = FocusNode();

  @override
  void initState() {
    _cardTextFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _cardTextController.dispose();
    _cardTextFocusNode.dispose();
    super.dispose();
  }

  void _exitEditingMode() {
    _cardTextFocusNode.unfocus();
    _cardTextController.clear();
  }

  void _onSubmitted() =>
      widget.onSubmitted?.call(_cardTextController.text.trim());

  void _onCancel() {
    _exitEditingMode();
    widget.onCancel?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: BoxDecoration(
        color: KnotSemanticColors.kanbanColumnBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.005),
            offset: const Offset(0, -2), // Moves shadow above
            blurRadius: 3, // Softens the shadow a bit
            spreadRadius: 0, // No extra spread
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: KnotSemanticSpacings.kanbanCardCreationTopPadding,
        ),
        child: Column(
          children: [
            KanbanCardCreationCard(
              controller: _cardTextController,
              focusNode: _cardTextFocusNode,
              onSubmitted: (_) => _onSubmitted(),
            ),
            const SizedBox(height: KnotCoreSpacings.small),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KnotSemanticSpacings
                    .kanbanColumnFooterButtonHorizontalPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CardCreationActionTextButton(
                    label: l10n.kanbanBoardAddCardCancelButtonLabel,
                    onPressed: _onCancel,
                    style: KnotSemanticTextStyles
                        .kanbanBoardAddCardCancelButtonLabel,
                  ),
                  _CardCreationActionTextButton(
                    label: l10n.kanbanBoardAddCardConfirmButtonLabel,
                    onPressed: _onSubmitted,
                    style: KnotSemanticTextStyles
                        .kanbanBoardAddCardConfirmButtonLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardCreationActionTextButton extends StatelessWidget {
  const _CardCreationActionTextButton({
    required this.label,
    required this.onPressed,
    required this.style,
  });
  final String label;
  final VoidCallback onPressed;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(KnotCoreSpacings.none),
        ),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: KnotCoreRadius.mediumLarge,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
