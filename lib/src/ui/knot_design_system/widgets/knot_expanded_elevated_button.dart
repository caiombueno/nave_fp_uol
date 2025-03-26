import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';

class KnotExpandedElevatedButton extends StatelessWidget {
  static const double _elevatedButtonHeight = 48;

  const KnotExpandedElevatedButton({
    required this.label,
    this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  KnotExpandedElevatedButton.inProgress({
    required String label,
    Key? key,
  }) : this(
          label: label,
          icon: Transform.scale(
            scale: 0.5,
            child: const CircularProgressIndicator(),
          ),
          key: key,
        );

  final VoidCallback? onTap;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return SizedBox(
      height: _elevatedButtonHeight,
      width: double.infinity,
      child: icon != null
          ? ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    KnotSemanticColors.knotExpandedElevatedButtonBackground,
              ),
              onPressed: onTap,
              label: Text(
                label,
              ),
              icon: icon,
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    KnotSemanticColors.knotExpandedElevatedButtonBackground,
              ),
              onPressed: onTap,
              child: Text(
                label,
              ),
            ),
    );
  }
}
