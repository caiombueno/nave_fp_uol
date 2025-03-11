import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_column_footer/widgets/card_creation_column_footer.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/widgets/kanban_column/widgets/kanban_column_footer/widgets/create_card_button.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class KanbanColumnFooter extends StatefulWidget {
  const KanbanColumnFooter({
    super.key,
    this.onCreateCard,
  });
  final void Function(String title)? onCreateCard;

  @override
  State<KanbanColumnFooter> createState() => _KanbanColumnFooterState();
}

class _KanbanColumnFooterState extends State<KanbanColumnFooter> {
  bool _isInEditMode = false;

  void _startEditMode() {
    setState(() {
      _isInEditMode = true;
    });
  }

  void _exitEditMode() {
    setState(() {
      _isInEditMode = false;
    });
  }

  void _createCard(String cardText) {
    if (cardText.isNotEmpty) {
      widget.onCreateCard?.call(cardText);
    }

    _exitEditMode();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.bottomCenter,
      child: _isInEditMode
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KnotSemanticSpacings.kanbanColumnHorizontalPadding,
              ),
              decoration: BoxDecoration(
                color: KnotSemanticColors.kanbanColumnBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 3,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CardCreationColumnFooter(
                key: const ValueKey('editMode'),
                onSubmitted: _createCard,
                onCancel: _exitEditMode,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KnotSemanticSpacings.kanbanColumnHorizontalPadding,
              ),
              child: CreateCardButton(
                key: const ValueKey('createButton'),
                onPressed: _startEditMode,
              ),
            ),
    );
  }
}
