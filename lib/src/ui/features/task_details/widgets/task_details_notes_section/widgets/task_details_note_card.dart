import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class TaskDetailsNoteCard extends StatefulWidget {
  const TaskDetailsNoteCard({
    super.key,
    required this.content,
  });
  final quill.Document content;

  @override
  State<TaskDetailsNoteCard> createState() => _TaskDetailsNoteCardState();
}

class _TaskDetailsNoteCardState extends State<TaskDetailsNoteCard> {
  late final quill.QuillController _controller;

  @override
  void initState() {
    _controller = quill.QuillController(
      document: widget.content,
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KnotSemanticColors.taskDetailsSectionBackground,
      padding: const EdgeInsets.symmetric(
        vertical: KnotSemanticSpacings.taskDetailsSectionVerticalPadding,
        horizontal: KnotSemanticSpacings.taskDetailsSectionHorizontalPadding,
      ),
      child: quill.QuillEditor.basic(
        controller: _controller,
      ),
    );
  }
}
