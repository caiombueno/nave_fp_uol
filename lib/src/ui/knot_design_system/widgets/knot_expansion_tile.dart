import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';

class KnotExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget child;
  final Widget? leading;
  final double? leadingGap;

  const KnotExpansionTile({
    required this.title,
    required this.child,
    this.leading,
    this.leadingGap,
    super.key,
  });

  @override
  _KnotExpansionTileState createState() => _KnotExpansionTileState();
}

class _KnotExpansionTileState extends State<KnotExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late final AnimationController _controller;

  late final Animation<double> _iconFlipAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _iconFlipAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleExpansion() {
    setState(
      () {
        _isExpanded = !_isExpanded;

        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leading = widget.leading;
    final leadingWidth = widget.leadingGap;

    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          // Wrap with [Material] so that gestures are detected in between items in the [Row].
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (leading != null) leading,
                    if (leadingWidth != null) SizedBox(width: leadingWidth),
                    widget.title,
                  ],
                ),
                RotationTransition(
                  turns: _iconFlipAnimation,
                  child: const Icon(
                    Icons.expand_more,
                    color:
                        KnotSemanticColors.knotExpansionTileDefaultTrailingIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _isExpanded ? widget.child : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class CKnotSemanticColors {}
