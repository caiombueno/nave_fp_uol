import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

enum KnotTextButtonVariation {
  primary,
  secondary,
}

class KnotTextButton extends StatelessWidget {
  const KnotTextButton._({
    super.key,
    required this.label,
    required this.onPressed,
    this.variation = KnotTextButtonVariation.primary,
  });
  final String label;
  final VoidCallback? onPressed;
  final KnotTextButtonVariation variation;

  factory KnotTextButton.primary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return KnotTextButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      variation: KnotTextButtonVariation.primary,
    );
  }

  factory KnotTextButton.secondary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return KnotTextButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      variation: KnotTextButtonVariation.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        textStyle: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return switch (variation) {
                KnotTextButtonVariation.primary =>
                  KnotSemanticTextStyles.knotTextButtonPrimaryDisabled,
                KnotTextButtonVariation.secondary =>
                  KnotSemanticTextStyles.knotTextButtonPrimaryDisabled,
              };
            }
            return switch (variation) {
              KnotTextButtonVariation.primary =>
                KnotSemanticTextStyles.knotTextButtonPrimary,
              KnotTextButtonVariation.secondary =>
                KnotSemanticTextStyles.knotTextButtonSecondary,
            };
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return switch (variation) {
                KnotTextButtonVariation.primary =>
                  KnotSemanticTextStyles.knotTextButtonPrimaryDisabled.color,
                KnotTextButtonVariation.secondary =>
                  KnotSemanticTextStyles.knotTextButtonSecondaryDisabled.color,
              };
            }
            return switch (variation) {
              KnotTextButtonVariation.primary =>
                KnotSemanticTextStyles.knotTextButtonPrimary.color,
              KnotTextButtonVariation.secondary =>
                KnotSemanticTextStyles.knotTextButtonSecondary.color,
            };
          },
        ),
        splashFactory: NoSplash.splashFactory,
        minimumSize: WidgetStateProperty.all(Size.zero),
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(KnotCoreSpacings.none),
        ),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
