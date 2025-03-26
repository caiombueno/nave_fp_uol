import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/state_management/kanban_board_state.dart';
import 'package:nave_fp_uol/src/ui/features/kanban_board/widgets/kanban_board/kanban_board.dart';
import 'package:nave_fp_uol/src/ui/features/router.gr.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_colors.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_alert_dialog.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_progress_indicator.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

@RoutePage()
class KanbanBoardScreen extends StatelessWidget implements AutoRouteWrapper {
  const KanbanBoardScreen({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<KanbanBoardCubit>(
      create: (_) => KanbanBoardCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: KnotSemanticColors.kanbanBoardScreenBackground,
      body: SafeArea(
        child: BlocConsumer<KanbanBoardCubit, KanbanBoardState>(
          listener: (context, state) {
            if (state is KanbanBoardLoaded) {
              if (state.updateTaskPlacementFailure
                  is UnauthenticatedUserFailure) {
                final l10n = context.l10n;
                _showSignInPrompt(
                  context,
                  message: l10n.kanbanBoardSignInPromptForTaskMoveDialogMessage,
                );

                final cubit = context.read<KanbanBoardCubit>();
                // This is needed to reset the updateTaskStatusFailure property and
                // guarantee if another state is emitted we won't be opening the
                // Sign In screen again.
                cubit.resetTaskStatusFailure();
              } else if (state.createUserTaskFailure
                  is UnauthenticatedUserFailure) {
                _showSignInPrompt(
                  context,
                  message:
                      l10n.kanbanBoardSignInPromptForTaskCreationDialogMessage,
                );

                final cubit = context.read<KanbanBoardCubit>();
                cubit.resetTaskCreationFailure();
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              KanbanBoardLoading _ => KnotProgressIndicator(
                  color: KnotSemanticColors.kanbanBoardScreenProgressIndicator,
                ),
              KanbanBoardLoaded state => KanbanBoard(
                  toDoTaskSummaryList: state.toDoTaskSummaryList,
                  inProgressTaskSummaryList: state.inProgressTaskSummaryList,
                  doneTaskSummaryList: state.doneTaskSummaryList,
                  toDoColumnTitle: l10n.kanbanBoardToDoColumnTitle,
                  inProgressColumnTitle: l10n.kanbanBoardInProgressColumnTitle,
                  doneColumnTitle: l10n.kanbanBoardCompletedColumnTitle,
                  layoutMode: kIsWeb
                      ? KanbanLayoutMode.continuous
                      : KanbanLayoutMode.pageView,
                  onTaskMove: (taskId, targetStatus, targetIndex) async {
                    if (taskId == null) return;
                    final cubit = context.read<KanbanBoardCubit>();
                    await cubit.updateTaskPlacement(
                      taskId: taskId,
                      status: targetStatus,
                      index: targetIndex,
                    );
                  },
                  onTaskTapped: (taskId) {
                    if (taskId == null) return;
                    context.router.push(TaskDetailsRoute(taskId: taskId));
                  },
                  onCreateTask: (status, title) async {
                    final cubit = context.read<KanbanBoardCubit>();
                    await cubit.createUserTask(
                      title: title,
                      status: status,
                    );
                  },
                ),
              _ => Center(
                  child: Text(
                    l10n.kanbanBoardScreenFailedMessage,
                    style: KnotSemanticTextStyles.kanbanBoardScreenErrorMessage,
                    textAlign: TextAlign.center,
                  ),
                ),
            };
          },
        ),
      ),
    );
  }

  Future<void> _showSignInPrompt(
    BuildContext context, {
    required String message,
  }) async {
    final l10n = context.l10n;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => KnotAlertDialog(
        context: context,
        title: l10n.kanbanBoardSignInPromptDialogTitle,
        message: message,
        ctaLabel: l10n.kanbanBoardSignInPromptDialogCta,
        onCtaPressed: () {
          // This `maybePop()` is imperative, otherwise the user is closed in a
          // loop since he can't dismiss the dialog by tapping outside.
          context.router.maybePop();
          context.router.push(
            SignInRoute(),
          );
        },
      ),
    );
  }
}
