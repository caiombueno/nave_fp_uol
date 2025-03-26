import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

enum TaskDetailsNotePopUpMenuAction {
  edit,
  delete,
}

class TaskDetailsNotePopUpMenuButton extends StatelessWidget {
  const TaskDetailsNotePopUpMenuButton({
    super.key,
    required this.onDeleteNote,
    required this.onEditNote,
  });
  final void Function(BuildContext) onDeleteNote;
  final void Function(BuildContext) onEditNote;

  @override
  Widget build(BuildContext context) {
    const menuItemHeight = 40.0;
    const menuItemWidth = 200.0;

    const menuItemPadding = EdgeInsets.symmetric(
      horizontal: KnotCoreSpacings.medium,
    );

    return PopupMenuButton<TaskDetailsNotePopUpMenuAction>(
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        iconColor: WidgetStatePropertyAll(KnotCoreColors.darkGrey),
        minimumSize: WidgetStatePropertyAll(Size.zero),
        splashFactory: NoSplash.splashFactory,
      ),
      color: KnotCoreColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KnotCoreSpacings.mediumLarge),
      ),
      constraints: const BoxConstraints(
        minWidth: menuItemWidth,
        maxWidth: menuItemWidth,
      ),
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            padding: menuItemPadding,
            height: menuItemHeight,
            value: TaskDetailsNotePopUpMenuAction.edit,
            onTap: () => onEditNote(context),
            child: TaskDetailsNotePopUpMenuItemRow(
              label: 'Editar',
              icon: KnotIcons.edit,
              foregroundColor: KnotCoreColors.darkGrey,
            ),
          ),
          const PopupMenuDivider(height: 1),
          PopupMenuItem(
            padding: menuItemPadding,
            height: menuItemHeight,
            value: TaskDetailsNotePopUpMenuAction.delete,
            onTap: () => onDeleteNote(context),
            child: TaskDetailsNotePopUpMenuItemRow(
              label: 'Excluir',
              icon: KnotIcons.trash,
              foregroundColor: KnotCoreColors.red,
            ),
          ),
        ];
      },
    );
  }
}

class TaskDetailsNotePopUpMenuItemRow extends StatelessWidget {
  const TaskDetailsNotePopUpMenuItemRow({
    super.key,
    required this.label,
    required this.icon,
    required this.foregroundColor,
  });
  final String label;
  final IconData icon;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
        Icon(
          icon,
          size: 16,
          color: foregroundColor,
        ),
      ],
    );
  }
}
