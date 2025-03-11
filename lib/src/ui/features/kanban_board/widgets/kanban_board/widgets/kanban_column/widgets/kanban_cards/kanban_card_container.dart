import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_border_radius.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class KanbanCardContainer extends StatelessWidget {
  const KanbanCardContainer({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: KnotSemanticColors.kanbanCardBackground,
      borderRadius: KnotCoreRadius.mediumLarge,
      elevation: 0.4,
      child: Padding(
        padding: const EdgeInsets.all(KnotSemanticSpacings.kanbanCardPadding),
        child: child,
      ),
    );
  }
}
