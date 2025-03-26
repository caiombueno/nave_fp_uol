import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_quill_editor.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

class TextLessonLoadedView extends StatefulWidget {
  const TextLessonLoadedView({
    super.key,
    required this.lessonContent,
  });
  final quill.Delta lessonContent;

  @override
  State<TextLessonLoadedView> createState() => _TextLessonLoadedViewState();
}

class _TextLessonLoadedViewState extends State<TextLessonLoadedView> {
  final _quillController = quill.QuillController.basic();

  @override
  void initState() {
    _quillController.document =
        widget.lessonContent.toDocumentOrNull() ?? quill.Document();

    _quillController.formatText(
      0,
      _quillController.document.length,
      quill.Attribute.justifyAlignment,
    );

    super.initState();
  }

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(
          top: KnotSemanticSpacings.textLessonLoadedViewVerticalPadding,
          left: KnotSemanticSpacings.textLessonLoadedViewHorizontalPadding,
          right: KnotSemanticSpacings.textLessonLoadedViewHorizontalPadding,
        ),
        child: KnotQuillEditor.view(
          controller: _quillController,
        ),
      ),
    );
  }
}
