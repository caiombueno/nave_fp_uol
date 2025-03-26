import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_quill_editor.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

class TaskDetailsDescription extends StatefulWidget {
  const TaskDetailsDescription({
    super.key,
    required this.descriptionContent,
    required this.isUserTask,
  });
  final quill.Delta descriptionContent;
  final bool isUserTask;

  @override
  State<TaskDetailsDescription> createState() => _TaskDetailsDescriptionState();
}

class _TaskDetailsDescriptionState extends State<TaskDetailsDescription> {
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void initState() {
    final document = widget.descriptionContent.toDocumentOrNull();

    if (document != null) {
      _controller.document = document;
    }

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
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: const Icon(
              KnotIcons.menu,
              color: KnotCoreColors.darkGrey,
              size: 22,
            ),
          ),
          const SizedBox(width: KnotCoreSpacings.xSmall),
          Expanded(
            child: KnotQuillEditor.view(controller: _controller),
          ),
        ],
      ),
    );
  }
}
