import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_state.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/widgets/task_details_loaded_view.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

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
            leading: BackButton(
              color: KnotSemanticColors.taskDetailsLessonBackButton,
            ),
            titleTextStyle: KnotSemanticTextStyles.taskDetailsScreenTitle,
            elevation: 0,
            centerTitle: false,
            title: (taskTitle != null) ? Text(taskTitle) : null,
          ),
          body: switch (state) {
            TaskDetailsFailed _ => Center(
                child: Text(context.l10n.taskDetailsScreenFailedMessage),
              ),
            TaskDetailsLoaded state => TaskDetailsLoadedView(
                descriptionContent: state.task.descriptionContent,
                isUserTask: state.task.isUserTask,
                lessons: state.task.lessons,
                notes: state.task.notes,
              ),
            _ => KnotProgressIndicator(),
          },
        );
      },
    );
  }
}
