import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class TaskDetailsDescription extends StatefulWidget {
  const TaskDetailsDescription({
    super.key,
    required this.descriptionContent,
    required this.isUserTask,
  });
  final quill.Document descriptionContent;
  final bool isUserTask;

  @override
  State<TaskDetailsDescription> createState() => _TaskDetailsDescriptionState();
}

class _TaskDetailsDescriptionState extends State<TaskDetailsDescription> {
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void initState() {
    // The user can't edit the description of a system task
    _controller.readOnly = !widget.isUserTask;

    _controller.document = widget.descriptionContent;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            KnotIcons.menu,
            color: KnotCoreColors.black,
            size: 22,
          ),
          const SizedBox(width: KnotCoreSpacings.xSmall),
          Expanded(
            child: quill.QuillEditor.basic(
              controller: _controller,
              config: quill.QuillEditorConfig(
                textSelectionThemeData: TextSelectionThemeData(
                  cursorColor: KnotCoreColors.blue,
                  selectionColor: KnotCoreColors.blue.withValues(alpha: 0.3),
                  selectionHandleColor: KnotCoreColors.blue,
                ),
                showCursor: false,
                padding: EdgeInsets.zero,
                customStyles: quill.DefaultStyles(
                  paragraph: quill.DefaultTextBlockStyle(
                    TextStyle(fontSize: 16, color: Colors.black),
                    quill.HorizontalSpacing(8, 0),
                    quill.VerticalSpacing(0, 0),
                    quill.VerticalSpacing(0, 0),
                    null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
