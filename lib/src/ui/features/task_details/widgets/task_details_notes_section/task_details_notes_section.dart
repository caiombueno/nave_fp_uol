import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_notes_section/widgets/task_details_note_card.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_icons.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_spacings.dart';

class TaskDetailsNotesSection extends StatelessWidget {
  const TaskDetailsNotesSection({
    super.key,
    required this.notes,
  });
  final List<TaskDetailsNoteVM>? notes;

  @override
  Widget build(BuildContext context) {
    final notes = this.notes;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal:
                KnotSemanticSpacings.taskDetailsSectionHorizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(KnotIcons.comments),
                  const SizedBox(width: 4),
                  Text('Anotações'),
                ],
              ),
              IconButton(
                onPressed: () {},
                iconSize: 24,
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(0),
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
        ),
        if (notes != null) ...[
          const SizedBox(height: 8),
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
          key: ValueKey(index),
          content: content,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: notes.length,
    );
  }
}
