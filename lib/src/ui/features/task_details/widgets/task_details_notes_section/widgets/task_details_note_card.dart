import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_content_editor_modal_bottom_sheet.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_notes_section/widgets/task_details_note_pop_up_menu_button.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_quill_editor.dart';
import 'package:nave_fp_uol/src/utils/extensions/flutter_quill_extensions.dart';

class TaskDetailsNoteCard extends StatefulWidget {
  const TaskDetailsNoteCard({
    super.key,
    required this.noteId,
    required this.content,
  });
  final String noteId;
  final quill.Delta content;

  @override
  State<TaskDetailsNoteCard> createState() => _TaskDetailsNoteCardState();
}

class _TaskDetailsNoteCardState extends State<TaskDetailsNoteCard> {
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void initState() {
    final document = widget.content.toDocumentOrNull();

    _controller.document = document ?? quill.Document();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openEditNoteModal(BuildContext context) {
    TextContentEditorModalBottomSheet.show(
      context,
      title: 'Editar anotação',
      hintText: 'Escreva sua anotação',
      delta: _controller.document.toDelta(),
      onConcluded: (content) {
        final taskDetailsCubit = context.read<TaskDetailsCubit>();

        taskDetailsCubit.editNote(
          noteId: widget.noteId,
          content: content,
        );
      },
    );
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
        children: [
          Expanded(
            child: KnotQuillEditor.view(controller: _controller),
          ),
          TaskDetailsNotePopUpMenuButton(
            onDeleteNote: (context) {
              final taskDetailsCubit = context.read<TaskDetailsCubit>();

              taskDetailsCubit.deleteNote(noteId: widget.noteId);
            },
            onEditNote: _openEditNoteModal,
          ),
        ],
      ),
    );
  }
}
