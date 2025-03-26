import 'package:flutter/material.dart';

enum KnotIconButtonSize {
  small,
  medium,
  large,
}

class KnotIconButton extends StatelessWidget {
  const KnotIconButton({
    super.key,
    required this.icon,
    this.color,
    this.onPressed,
    this.size = KnotIconButtonSize.medium,
  });
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final KnotIconButtonSize size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: Size(0, 0),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
      ),
      icon: Icon(
        icon,
        color: color,
        size: switch (size) {
          KnotIconButtonSize.small => 20,
          KnotIconButtonSize.medium => 24,
          KnotIconButtonSize.large => 32,
        },
      ),
      onPressed: onPressed,
    );
  }
}
