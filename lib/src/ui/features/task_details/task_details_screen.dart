import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';

@RoutePage()
class TaskDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  const TaskDetailsScreen({
    super.key,
    @PathParam('taskId') required this.taskId,
    this.isUserTask = false,
  });
  final String taskId;
  final bool isUserTask;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskDetailsCubit(
        taskId: taskId,
        isUserTask: isUserTask,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
      builder: (context, state) {
        final taskTitle =
            (state is TaskDetailsLoaded) ? state.task.title : null;

        return Scaffold(
          backgroundColor: KnotSemanticColors.taskDetailsScreenBackground,
          appBar: AppBar(
            backgroundColor: KnotSemanticColors.taskDetailsScreenBackground,
            elevation: 0,
            centerTitle: false,
            title: (taskTitle != null) ? Text(taskTitle) : null,
          ),
          body: switch (state) {
            // TODO: create [TaskDetailsFailedView]
            TaskDetailsFailed _ => const Center(
                child: Text('Failed to load task details'),
              ),
            TaskDetailsLoaded state => TaskDetailsLoadedView(
                descriptionContent: state.task.descriptionContent,
                isUserTask: state.task.isUserTask,
                lessons: state.task.lessons,
                notes: state.task.notes,
              ),
            _ => KnotProgressIndicator(),
          },
          bottomNavigationBar: BottomAppBar(
            color: KnotCoreColors.white,
            elevation: 0,
            child: TaskDetailsNoteTextField(),
          ),
        );
      },
    );
  }
}

class TaskDetailsNoteTextField extends StatefulWidget {
  const TaskDetailsNoteTextField({super.key, this.focusNode});
  final FocusNode? focusNode;

  @override
  State<TaskDetailsNoteTextField> createState() =>
      _TaskDetailsNoteTextFieldState();
}

class _TaskDetailsNoteTextFieldState extends State<TaskDetailsNoteTextField> {
  late final quill.QuillController _controller;

  @override
  void initState() {
    _controller = quill.QuillController.basic();
    super.initState();
  }

  @override
  void dispose() {
    _controller = quill.QuillController.basic();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KnotCoreColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: KnotCoreColors.blue,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: quill.QuillEditor.basic(
        controller: _controller,
        focusNode: widget.focusNode,
        config: quill.QuillEditorConfig(
          detectWordBoundary: true,
          scrollable: true,
          maxHeight: 10,
          minHeight: 10,
          padding: EdgeInsets.zero,
          onTapOutside: (event, focusNode) {
            focusNode.unfocus();
          },
          expands: false,
          autoFocus: true,
        ),
      ),
    );
  }
}
