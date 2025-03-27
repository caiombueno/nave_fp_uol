import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_icon_button.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_quill_editor.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_text_button.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

class TextContentEditorModalBottomSheet extends StatefulWidget {
  const TextContentEditorModalBottomSheet({
    super.key,
    required this.title,
    this.hintText,
    required this.delta,
    required this.onConcluded,
  });

  final String title;
  final String? hintText;
  final quill.Delta? delta;
  final void Function(List<Map<String, dynamic>> content) onConcluded;

  static void show(
    BuildContext context, {
    required String title,
    String? hintText,
    quill.Delta? delta,
    required void Function(List<Map<String, dynamic>> content) onConcluded,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) {
        return TextContentEditorModalBottomSheet(
          title: title,
          delta: delta,
          hintText: hintText,
          onConcluded: onConcluded,
        );
      },
    );
  }

  @override
  State<TextContentEditorModalBottomSheet> createState() =>
      _TextContentEditorModalBottomSheetState();
}

class _TextContentEditorModalBottomSheetState
    extends State<TextContentEditorModalBottomSheet> {
  final quill.QuillController _controller = quill.QuillController.basic();
  final FocusNode _focusNode = FocusNode();

  bool _isEditing = false;

  @override
  void initState() {
    final delta = widget.delta;
    if (delta != null) {
      final document = delta.toDocumentOrNull();
      if (document != null) {
        _controller.document = document;
      }
    }

    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus != _isEditing) {
          setState(
            () {
              _isEditing = _focusNode.hasFocus;
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (_isEditing)
            ? (MediaQuery.maybeViewInsetsOf(context)?.bottom ?? 0.0)
            : 0.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: KnotIconButton(
                            icon: Icons.close,
                            color: KnotCoreColors.blue,
                            onPressed: () => Navigator.of(context).pop(),
                            size: KnotIconButtonSize.small,
                          ),
                        ),
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: KnotTextButton.secondary(
                            label: context.l10n.done,
                            onPressed: () {
                              widget.onConcluded(
                                _controller.document.toJson(),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: KnotQuillEditor.edit(
                      controller: _controller,
                      focusNode: _focusNode,
                      readOnly: false,
                      placeholder: widget.hintText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isEditing)
            Container(
              color: KnotCoreColors.lightGrey,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: quill.QuillSimpleToolbar(
                  controller: _controller,
                  config: quill.QuillSimpleToolbarConfig(
                    showFontFamily: false,
                    showFontSize: false,
                    showColorButton: false,
                    showBackgroundColorButton: false,
                    showLink: false,
                    showSearchButton: false,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
