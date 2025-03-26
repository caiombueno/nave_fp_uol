import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_content_editor_modal_bottom_sheet.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_notes_section/widgets/task_details_note_card.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_sizings.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

class TaskDetailsNotesSection extends StatelessWidget {
  const TaskDetailsNotesSection({
    super.key,
    required this.notes,
  });
  final List<TaskDetailsNoteVM>? notes;

  @override
  Widget build(BuildContext context) {
    final notes = this.notes;

    final l10n = context.l10n;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal:
                KnotSemanticSpacings.taskDetailsSectionHorizontalPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        KnotIcons.comments,
                        color: KnotCoreColors.darkGrey,
                      ),
                      const SizedBox(
                        width: KnotSemanticSpacings
                            .taskDetailsNotesSectionHeaderLeadingGap,
                      ),
                      Text(
                        l10n.taskDetailsNotesSectionTitle,
                        style: TextStyle(color: KnotCoreColors.darkGrey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      TextContentEditorModalBottomSheet.show(
                        context,
                        title: l10n.taskDetailsNotesSectionAddNoteModalTitle,
                        hintText: l10n.taskDetailsNotesSectionAddNoteModalHint,
                        onConcluded: (content) {
                          final cubit = context.read<TaskDetailsCubit>();

                          cubit.createNote(content: content);
                        },
                      );
                    },
                    iconSize: KnotSemanticSizings
                        .taskDetailsLessonNotesSectionLeadingIcon,
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    icon: Icon(
                      Icons.add,
                      color: KnotCoreColors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (notes != null) ...[
          const SizedBox(
            height: KnotSemanticSpacings
                .taskDetailsLessonNotesSectionTitleContentGap,
          ),
          TaskDetailsNotesListView(notes: notes),
        ],
      ],
    );
  }
}

class TaskDetailsNotesListView extends StatelessWidget {
  const TaskDetailsNotesListView({super.key, required this.notes});
  final List<TaskDetailsNoteVM> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final note = notes[index];

        final content = note.content;

        if (content == null) return null;

        return TaskDetailsNoteCard(
          key: ValueKey(note),
          noteId: note.id,
          content: content,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: KnotSemanticSpacings.taskDetailsLessonNotesGap,
        );
      },
      itemCount: notes.length,
    );
  }
}
