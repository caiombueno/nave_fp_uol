part of 'task_repository.dart';

extension on List<SystemTaskSM> {
  List<SystemTaskSummary> toDM(
    List<SystemTaskUserDataSM> taskUserDataList,
  ) {
    return sortedBy(
      (task) => task.defaultSortKey ?? double.infinity,
    ).map(
      (task) {
        final taskUserData = taskUserDataList.firstWhereOrNull(
          (taskUserData) => taskUserData.taskId == task.id,
        );

        return SystemTaskSummary(
          id: task.id,
          title: task.title,
          isFree: task.isFree,
          blockingTaskIds: task.blockingTaskIds,
          defaultSortKey: task.defaultSortKey,
          status: taskUserData?.status?.toDM() ?? TaskStatus.toDo,
          selectedSortKey: taskUserData?.selectedSortKey,
        );
      },
    ).toList();
  }
}

extension on List<LessonSM> {
  List<Lesson> toDM(
    List<LessonUserDataSM>? lessonsUserData,
  ) {
    return map(
      (lessonSm) {
        final lessonUserData = lessonsUserData?.firstWhereOrNull(
          (userData) => userData.lessonId == lessonSm.id,
        );

        return lessonSm.toDM(
          lessonUserData,
        );
      },
    ).toList();
  }
}

extension on LessonSM {
  Lesson toDM(
    LessonUserDataSM? lessonUserData,
  ) {
    final isCompleted = lessonUserData?.isCompleted ?? false;

    return switch (this) {
      TextLessonSM lesson => TextLesson(
          id: lesson.id,
          title: lesson.title,
          content: lesson.content,
          isCompleted: isCompleted,
        ),
      VideoLessonSM lesson => VideoLesson(
          id: lesson.id,
          title: lesson.title,
          filePath: lesson.filePath,
          isHorizontal: lesson.isHorizontal,
          isCompleted: isCompleted,
        ),
    };
  }
}

extension on SystemTaskSM {
  SystemTask toDM({
    required SystemTaskUserDataSM? taskUserData,
    required List<NoteSM>? notes,
    required List<Lesson>? allLessons,
  }) {
    final tzDateTime =
        taskUserData?.lastStatusUpdateDateTime?.toUtcTZDateTime();

    final lessons = lessonIds
        ?.map(
          (id) => allLessons?.firstWhereOrNull(
            (lesson) => lesson.id == id,
          ),
        )
        .whereType<Lesson>()
        .toList();
    return SystemTask(
      id: id,
      title: title,
      descriptionContent: descriptionContent,
      isFree: isFree,
      blockingTaskIds: blockingTaskIds,
      status: taskUserData?.status?.toDM() ?? TaskStatus.toDo,
      lastStatusUpdateDateTime: tzDateTime,
      lessons: lessons,
      notes: notes == null
          ? null
          : notes
              .sortedBy<num>(
                (note) => (((note.creationDateTime ?? note.lastUpdateDateTime)
                            ?.toUtcTZDateTime() ??
                        TZDateTime.utc(0)))
                    .millisecondsSinceEpoch,
              )
              .map(
                (note) => note.toDM(),
              )
              .toList(),
    );
  }
}

extension on UserTaskSM {
  UserTask toDM({
    required List<NoteSM>? notes,
  }) {
    final tzDateTime = lastStatusUpdateDateTime?.toUtcTZDateTime();

    return UserTask(
      id: id,
      title: title,
      descriptionContent: descriptionContent,
      status: status?.toDM() ?? TaskStatus.toDo,
      lastStatusUpdateDateTime: tzDateTime,
      notes: notes == null
          ? null
          : notes
              .sortedBy<num>(
                (note) => ((note.creationDateTime ??
                        note.lastUpdateDateTime ??
                        TZDateTime.utc(0)) as TZDateTime)
                    .millisecondsSinceEpoch,
              )
              .map(
                (note) => note.toDM(),
              )
              .toList(),
    );
  }
}

extension on List<UserTaskSM> {
  List<UserTaskSummary> toDM() {
    return map(
      (task) => UserTaskSummary(
        id: task.id,
        title: task.title,
        status: task.status?.toDM() ?? TaskStatus.toDo,
        selectedSortKey: task.selectedSortKey,
      ),
    ).toList();
  }
}

extension on TaskStatusSM {
  TaskStatus toDM() {
    return switch (this) {
      TaskStatusSM.toDo => TaskStatus.toDo,
      TaskStatusSM.inProgress => TaskStatus.inProgress,
      TaskStatusSM.done => TaskStatus.done,
    };
  }
}

extension on TaskStatus {
  TaskStatusSM toSM() {
    return switch (this) {
      TaskStatus.toDo => TaskStatusSM.toDo,
      TaskStatus.inProgress => TaskStatusSM.inProgress,
      TaskStatus.done => TaskStatusSM.done,
    };
  }
}

extension on NoteSM {
  Note toDM() {
    return Note(
      id: id,
      content: content,
      lastUpdateDateTime: lastUpdateDateTime?.toUtcTZDateTime(),
      creationDateTime: creationDateTime?.toUtcTZDateTime(),
    );
  }
}

extension on Timestamp? {
  static final utcLocation = getLocation('UTC');

  TZDateTime? toUtcTZDateTime() {
    final dateTime = this?.toDate();
    final tzDateTimeUtc = dateTime != null
        ? TZDateTime.from(
            dateTime,
            utcLocation,
          )
        : null;
    return tzDateTimeUtc;
  }
}
