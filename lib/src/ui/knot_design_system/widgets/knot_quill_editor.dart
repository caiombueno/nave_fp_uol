import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';

class KnotQuillEditor extends StatefulWidget {
  const KnotQuillEditor._({
    super.key,
    required this.controller,
    this.focusNode,
    this.scrollController,
    required this.readOnly,
    this.placeholder,
  });
  final quill.QuillController controller;
  final FocusNode? focusNode;
  final ScrollController? scrollController;
  final bool readOnly;
  final String? placeholder;

  KnotQuillEditor.view({
    required quill.QuillController controller,
    ScrollController? scrollController,
  }) : this._(
          controller: controller,
          scrollController: scrollController,
          focusNode: null,
          readOnly: true,
          placeholder: null,
        );

  KnotQuillEditor.edit({
    required quill.QuillController controller,
    ScrollController? scrollController,
    FocusNode? focusNode,
    String? placeholder,
    bool readOnly = false,
  }) : this._(
          controller: controller,
          scrollController: scrollController,
          focusNode: focusNode,
          readOnly: readOnly,
          placeholder: placeholder,
        );

  @override
  State<KnotQuillEditor> createState() => _KnotQuillEditorState();
}

class _KnotQuillEditorState extends State<KnotQuillEditor> {
  @override
  void initState() {
    widget.controller.readOnly = widget.readOnly;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return quill.QuillEditor.basic(
      scrollController: widget.scrollController,
      controller: widget.controller,
      focusNode: widget.focusNode,
      config: quill.QuillEditorConfig(
        placeholder: widget.placeholder,
        showCursor: !widget.readOnly,
        customStyles: const quill.DefaultStyles(
          paragraph: quill.DefaultTextBlockStyle(
            KnotSemanticTextStyles.quillEditorParagraph,
            quill.HorizontalSpacing.zero,
            quill.VerticalSpacing.zero,
            quill.VerticalSpacing.zero,
            null,
          ),
          placeHolder: quill.DefaultTextBlockStyle(
            KnotSemanticTextStyles.quillEditorHintText,
            quill.HorizontalSpacing.zero,
            quill.VerticalSpacing.zero,
            quill.VerticalSpacing.zero,
            null,
          ),
        ),
      ),
    );
  }
}
