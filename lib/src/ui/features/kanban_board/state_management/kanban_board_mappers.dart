part of 'kanban_board_cubit.dart';

/// Sistema de ordenação para SystemTasks e UserTasks baseado em números flutuantes.
///
/// O sistema usa números de ponto flutuante (`double`) para definir a posição das tarefas.
/// Isso permite inserir novas tasks em qualquer posição sem precisar reordenar todas as existentes,
/// já que sempre podemos calcular um valor intermediário entre duas tasks.
///
/// **Por que esse sistema é eficiente (e necessário)?**
/// Diferente de abordagens que usam índices inteiros e exigem a atualização de todas as tasks ao mover uma delas,
/// esse sistema evita ter que atualizar todas as tasks no Firestore sempre que uma task é rearranjada.
/// Isso reduz ao máxima a quantidade de escritas no banco, o que é essencial no Firestore,
/// onde operações de escrita podem ser caras.
///
/// - `selectedSortKey`: Definido quando uma tarefa já foi movida manualmente pelo usuário.
/// - `defaultSortKey`: Definido para SystemTasks e responsável por garantir uma ordenação inicial
///   entre elas (exemplo: tasks de identidade visual vêm antes das de convite). O código também
///   está preparado para lidar com casos em que `defaultSortKey` esteja ausente.
/// - `fallbackSortKey`: Aplicado a UserTasks que ainda não foram movidas manualmente.
///   Em tese, todas as UserTasks deveriam ter `selectedSortKey` assim que criadas, já que o usuário
///   sempre escolhe uma posição para elas. No entanto, esse fallback existe para evitar inconsistências,
///   garantindo que uma UserTask sem `selectedSortKey` ainda tenha um valor previsível.
///
/// Os valores são propositalmente altos (`500.000`, `10.000.000`) para reduzir a chance de
/// colisões e evitar problemas ao inserir tarefas em posições intermediárias.

const double _sortKeyIncrement = 500000.0; // Incremento usado para criar espaço entre tasks ao mover
const double _userTaskBaseSortKey = 10000000.0; // Base alta para UserTasks, garantindo que fiquem abaixo das SystemTasks inicialmente
const double _userTaskIncrement = 1000.0; // Incremento usado para ordenar UserTasks antes de serem movidas

/// Ordena a lista de tasks com base nos valores usados para definir sua posição.
extension on List<TaskSummaryVM> {
  List<TaskSummaryVM> sortedBySortKeys() {
    return sorted((a, b) =>
        a._selectedOrDefaultSortKey.compareTo(b._selectedOrDefaultSortKey));
  }
}

/// Calcula um novo `selectedSortKey` ao mover uma task para uma nova posição.
///
/// - Se a task for para o topo, recebe um valor menor que a primeira existente.
/// - Se for para o final, recebe um valor maior que a última existente.
/// - Se for colocada entre duas tasks, recebe um valor intermediário entre elas.
///
/// Isso evita a necessidade de reindexação completa e mantém a ordenação estável.
extension on List<TaskSummaryVM> {
  double computeSelectedSortKey(int newIndex, String movedTaskId) {
    if (isEmpty) return _sortKeyIncrement;

    // Remove a task que está sendo movida para evitar interferências no cálculo
    final adjustedList = where((task) => task.id != movedTaskId).toList();

    if (adjustedList.isEmpty) return _sortKeyIncrement;

    if (newIndex == 0) {
      // Se for para o topo, recebe um valor menor que a primeira existente
      final newSortKey = adjustedList.first._selectedOrDefaultSortKey / 2;
      return newSortKey < 1.0 ? 1.0 : newSortKey; // Evita valores muito baixos
    }

    if (newIndex >= adjustedList.length) {
      // Se for para o final, recebe um valor maior que a última existente
      return adjustedList.last._selectedOrDefaultSortKey + _sortKeyIncrement;
    }

    // Se estiver entre duas tasks, recebe um valor intermediário entre elas
    final prevSortKey = adjustedList[newIndex - 1]._selectedOrDefaultSortKey;
    final nextSortKey = adjustedList[newIndex]._selectedOrDefaultSortKey;

    return (prevSortKey + nextSortKey) / 2;
  }
}

/// Retorna o valor usado para definir a posição final de uma task, considerando as regras de fallback.
///
/// - `selectedSortKey` sempre tem prioridade (presente apenas quando a task já foi movida manualmente).
/// - `defaultSortKey` é usada para definir a ordenação inicial das SystemTasks.
///   Se não estiver presente, a posição é baseada no `index`, garantindo um fallback seguro.
/// - Para UserTasks sem `selectedSortKey`, um valor base alto (`fallbackSortKey`) é atribuído para garantir
///   que fiquem abaixo das SystemTasks inicialmente, mas ainda possam ser movidas livremente.
extension on TaskSummaryVM {
  double get _selectedOrDefaultSortKey {
    if (selectedSortKey != null) return selectedSortKey!;

    if (this is SystemTaskSummaryVM) {
      final systemTask = this as SystemTaskSummaryVM;
      return (systemTask.defaultSortKey ?? systemTask.index * _sortKeyIncrement)
          .toDouble();
    }

    if (this is UserTaskSummaryVM) {
      return (this as UserTaskSummaryVM)._fallbackSortKey;
    }

    return _userTaskBaseSortKey;
  }
}

/// Define um valor base para UserTasks que ainda não foram movidas manualmente.
///
/// Como UserTasks começam abaixo das SystemTasks, esse valor garante uma ordenação inicial,
/// mas permite que as tarefas sejam reordenadas manualmente sem perder estabilidade.
extension on UserTaskSummaryVM {
  double get _fallbackSortKey =>
      _userTaskBaseSortKey + (index.toDouble() * _userTaskIncrement);
}

/// Converte uma lista de `TaskSummary` para `TaskSummaryVM`, garantindo que
/// SystemTasks e UserTasks sejam tratadas corretamente.
///
/// - As SystemTasks possuem `defaultSortKey` para garantir uma ordenação inicial estruturada.
/// - Se `defaultSortKey` não estiver presente, o código usa `index` como fallback para manter a ordem.
/// - O `index` também é passado para UserTasks, garantindo que tenham um valor previsível antes de serem movidas.
extension on List<TaskSummary> {
  List<TaskSummaryVM> toVM(
      List<SystemTaskSummary> systemTaskList, bool isUserAuthenticated) {
    return mapIndexed((index, task) {
      if (task is SystemTaskSummary) {
        final blockingTaskTitles = task.blockingTaskIds
            ?.map((taskId) =>
        systemTaskList.firstWhereOrNull((t) => t.id == taskId)?.title)
            .whereType<String>()
            .toList();

        return SystemTaskSummaryVM(
          id: task.id,
          title: task.title,
          isLockedByPayment: !isUserAuthenticated && (task.isFree == false),
          blockingTaskTitles: blockingTaskTitles,
          selectedSortKey: task.selectedSortKey,
          defaultSortKey: task.defaultSortKey,
          index: index, // Usado como fallback caso `defaultSortKey` esteja ausente
        );
      }

      return UserTaskSummaryVM(
        id: task.id,
        title: task.title,
        selectedSortKey: task.selectedSortKey,
        index: index, // Garante que UserTasks tenham um valor inicial previsível antes de serem movidas
      );
    }).toList();
  }
}