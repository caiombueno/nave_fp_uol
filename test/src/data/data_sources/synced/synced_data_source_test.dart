import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/field_value_mapper.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/lesson_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/note_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/system_task_user_data_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/task_status_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/models/user_task_sm.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/synced_data_source.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import '../../../../mocks.dart';

void main() {
  late SyncedDataSource dataSource;
  late MockFirestoreClient mockFirestoreClient;

  setUpAll(() {
    MapperContainer.globals.use(
      FieldValueMapper(),
    );
  });

  setUp(() {
    mockFirestoreClient = MockFirestoreClient();
    dataSource = SyncedDataSource(mockFirestoreClient);
  });

  group('SyncedDataSource', () {
    group(
      'watchSystemTaskList',
      () {
        test(
          'should request collection with correct path and parameters',
          () {
            // Arrange
            final expectedStream =
                Stream<Either<Failure, List<SystemTaskSM>>>.value(
              Right(const []),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTaskList();

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'systemTasks',
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: true,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when stream fails',
          () {
            // Arrange
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, List<SystemTaskSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTaskList();

            // Assert
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchSystemTask',
      () {
        test(
          'should request document with specified taskId',
          () {
            // Arrange
            final taskId = 'task-123';
            final expectedStream = Stream<Either<Failure, SystemTaskSM>>.value(
              Right(
                SystemTaskSM(
                  id: taskId,
                  title: null,
                  descriptionContent: null,
                  isFree: null,
                  blockingTaskIds: null,
                  defaultSortKey: null,
                  lessonIds: null,
                ),
              ),
            );
            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTask(taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'systemTasks',
                documentId: taskId,
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when document stream fails',
          () {
            // Arrange
            final taskId = 'task-123';
            final failure = NoInternetFailure();
            final expectedStream = Stream<Either<Failure, SystemTaskSM>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTask(taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'systemTasks',
                documentId: taskId,
                itemFromMap: any<SystemTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchUserTaskList',
      () {
        test(
          'should use correct user-specific collection path',
          () {
            // Arrange
            final userId = 'user-123';
            final expectedStream =
                Stream<Either<Failure, List<UserTaskSM>>>.value(
              Right([]),
            );
            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer(
              (_) => expectedStream,
            );

            // Act
            final result = dataSource.watchUserTaskList(userId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/tasks',
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should handle empty collection by returning empty list',
          () {
            // Arrange
            final userId = 'user-123';
            final emptyList = <UserTaskSM>[];
            final expectedStream =
                Stream<Either<Failure, List<UserTaskSM>>>.value(
              Right(emptyList),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchUserTaskList(userId);

            // Assert
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, List<UserTaskSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchUserTaskList(userId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/tasks',
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchUserTask',
      () {
        test(
          'should request specific task document from user tasks collection',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final expectedStream = Stream<Either<Failure, UserTaskSM>>.value(
              Right(
                UserTaskSM(
                  id: taskId,
                  title: null,
                  descriptionContent: null,
                  status: null,
                  lastStatusUpdateDateTime: null,
                  selectedSortKey: null,
                ),
              ),
            );
            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer(
              (_) => expectedStream,
            );

            // Act
            final result = dataSource.watchUserTask(
              userId: userId,
              taskId: taskId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/tasks',
                documentId: taskId,
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when document stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final failure = NoInternetFailure();
            final expectedStream = Stream<Either<Failure, UserTaskSM>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchUserTask(
              userId: userId,
              taskId: taskId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/tasks',
                documentId: taskId,
                itemFromMap: any<UserTaskSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchSystemTaskUserDataList',
      () {
        test('should use correct user-specific collection path', () {
          // Arrange
          final userId = 'user-123';
          final expectedStream =
              Stream<Either<Failure, List<SystemTaskUserDataSM>>>.value(
            Right([]),
          );
          when(
            () => mockFirestoreClient.watchCollection(
              collection: any(named: 'collection'),
              assumeCollectionExists: any(named: 'assumeCollectionExists'),
              itemFromMap:
                  any<SystemTaskUserDataSM Function(Map<String, dynamic>)>(
                named: 'itemFromMap',
              ),
            ),
          ).thenAnswer(
            (_) => expectedStream,
          );

          // Act
          final result = dataSource.watchSystemTaskUserDataList(userId);

          // Assert
          verify(
            () => mockFirestoreClient.watchCollection(
              collection: 'users/$userId/systemTaskUserData',
              assumeCollectionExists: false,
              itemFromMap:
                  any<SystemTaskUserDataSM Function(Map<String, dynamic>)>(
                named: 'itemFromMap',
              ),
            ),
          ).called(1);
          expect(result, expectedStream);
        });

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, List<SystemTaskUserDataSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap:
                    any<SystemTaskUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTaskUserDataList(userId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/systemTaskUserData',
                assumeCollectionExists: false,
                itemFromMap:
                    any<SystemTaskUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchSystemTaskUserData',
      () {
        test(
          'should retrieve document using correct taskId',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final expectedStream =
                Stream<Either<Failure, SystemTaskUserDataSM?>>.value(
              Right(
                SystemTaskUserDataSM(
                  taskId: taskId,
                  status: null,
                  lastStatusUpdateDateTime: null,
                  selectedSortKey: null,
                ),
              ),
            );
            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap:
                    any<SystemTaskUserDataSM? Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer(
              (_) => expectedStream,
            );

            // Act
            final result = dataSource.watchSystemTaskUserData(
              userId: userId,
              taskId: taskId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/systemTaskUserData',
                documentId: taskId,
                itemFromMap:
                    any<SystemTaskUserDataSM? Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should return null for non-existent document',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'non-existent-task';
            final expectedStream =
                Stream<Either<Failure, SystemTaskUserDataSM?>>.value(
              Right(null),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap:
                    any<SystemTaskUserDataSM? Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTaskUserData(
              userId: userId,
              taskId: taskId,
            );

            // Assert
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when document stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, SystemTaskUserDataSM?>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap:
                    any<SystemTaskUserDataSM? Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchSystemTaskUserData(
              userId: userId,
              taskId: taskId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/systemTaskUserData',
                documentId: taskId,
                itemFromMap:
                    any<SystemTaskUserDataSM? Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchSystemTaskNotes',
      () {
        test(
          'should use nested collection path with userId and taskId',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final expectedStream = Stream<Either<Failure, List<NoteSM>>>.value(
              Right([]),
            );
            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result =
                dataSource.watchSystemTaskNotes(userId: userId, taskId: taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/systemTaskUserData/$taskId/notes',
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final failure = NoInternetFailure();
            final expectedStream = Stream<Either<Failure, List<NoteSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result =
                dataSource.watchSystemTaskNotes(userId: userId, taskId: taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/systemTaskUserData/$taskId/notes',
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchUserTaskNotes',
      () {
        test(
          'should access notes subcollection with correct path',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final expectedStream = Stream<Either<Failure, List<NoteSM>>>.value(
              Right([]),
            );
            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result =
                dataSource.watchUserTaskNotes(userId: userId, taskId: taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/tasks/$taskId/notes',
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final taskId = 'task-123';
            final failure = NoInternetFailure();
            final expectedStream = Stream<Either<Failure, List<NoteSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result =
                dataSource.watchUserTaskNotes(userId: userId, taskId: taskId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/tasks/$taskId/notes',
                itemFromMap: any<NoteSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
                assumeCollectionExists: false,
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchLessonList',
      () {
        test(
          'should request lessons collection with assumeExists flag',
          () {
            // Arrange
            final expectedStream =
                Stream<Either<Failure, List<LessonSM>>>.value(
              Right([]),
            );
            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonList();

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'lessons',
                assumeCollectionExists: true,
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, List<LessonSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonList();

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'lessons',
                assumeCollectionExists: true,
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchLesson',
      () {
        test(
          'should request specific lesson document',
          () {
            // Arrange
            const lessonId = 'lesson-123';
            final expectedStream = Stream<Either<Failure, LessonSM>>.value(
              Right(
                VideoLessonSM(
                  id: lessonId,
                  title: null,
                  filePath: null,
                  isHorizontal: null,
                ),
              ),
            );
            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLesson(lessonId);

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'lessons',
                documentId: lessonId,
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when document stream fails',
          () {
            // Arrange
            const lessonId = 'lesson-123';
            final failure = NoInternetFailure();
            final expectedStream = Stream<Either<Failure, LessonSM>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLesson(lessonId);

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'lessons',
                documentId: lessonId,
                itemFromMap: any<LessonSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchLessonUserData',
      () {
        test(
          'should access user-specific lesson data document',
          () {
            // Arrange
            final userId = 'user-123';
            final lessonId = 'lesson-123';
            final expectedStream =
                Stream<Either<Failure, LessonUserDataSM>>.value(
              Right(
                LessonUserDataSM(
                  lessonId: lessonId,
                  isCompleted: null,
                ),
              ),
            );
            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonUserData(
              userId: userId,
              lessonId: lessonId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/lessonUserData',
                documentId: lessonId,
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when document stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final lessonId = 'lesson-123';
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, LessonUserDataSM>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonUserData(
              userId: userId,
              lessonId: lessonId,
            );

            // Assert
            verify(
              () => mockFirestoreClient.watchDocument(
                collection: 'users/$userId/lessonUserData',
                documentId: lessonId,
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group(
      'watchLessonUserDataList',
      () {
        test(
          'should use correct user-specific collection path',
          () {
            // Arrange
            final userId = 'user-123';
            final expectedStream =
                Stream<Either<Failure, List<LessonUserDataSM>>>.value(
              Right([]),
            );
            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonUserDataList(userId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/lessonUserData',
                assumeCollectionExists: false,
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );

        test(
          'should propagate Left(Failure) when collection stream fails',
          () {
            // Arrange
            final userId = 'user-123';
            final failure = NoInternetFailure();
            final expectedStream =
                Stream<Either<Failure, List<LessonUserDataSM>>>.value(
              Left(failure),
            );

            when(
              () => mockFirestoreClient.watchCollection(
                collection: any(named: 'collection'),
                assumeCollectionExists: any(named: 'assumeCollectionExists'),
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).thenAnswer((_) => expectedStream);

            // Act
            final result = dataSource.watchLessonUserDataList(userId);

            // Assert
            verify(
              () => mockFirestoreClient.watchCollection(
                collection: 'users/$userId/lessonUserData',
                assumeCollectionExists: false,
                itemFromMap:
                    any<LessonUserDataSM Function(Map<String, dynamic>)>(
                  named: 'itemFromMap',
                ),
              ),
            ).called(1);
            expect(result, expectedStream);
          },
        );
      },
    );

    group('createUserTask', () {
      test(
        'should create new task document with provided data',
        () async {
          // Arrange
          final userId = 'user-123';
          final title = 'Test Task';
          final selectedSortKey = 1.0;
          final status = TaskStatusSM.toDo;

          when(
            () => mockFirestoreClient.upsertDocument(
              collection: any(named: 'collection'),
              data: any(named: 'data'),
              replaceEntireDocument: any(named: 'replaceEntireDocument'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // Act
          await dataSource.createUserTask(
            userId: userId,
            title: title,
            selectedSortKey: selectedSortKey,
            status: status,
          );

          // Assert
          verify(
            () => mockFirestoreClient.upsertDocument(
              collection: 'users/$userId/tasks',
              data: any(named: 'data'),
              replaceEntireDocument: true,
            ),
          ).called(1);
        },
      );

      test(
        'should throw exception when Firestore operation fails',
        () async {
          // Arrange
          final userId = 'user-123';
          final title = 'Test Task';
          final selectedSortKey = 1.0;
          final status = TaskStatusSM.toDo;
          final error = Exception('Firestore error');

          when(
            () => mockFirestoreClient.upsertDocument(
              collection: any(named: 'collection'),
              data: any(named: 'data'),
              replaceEntireDocument: any(named: 'replaceEntireDocument'),
            ),
          ).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.createUserTask(
              userId: userId,
              title: title,
              selectedSortKey: selectedSortKey,
              status: status,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('upsertSystemTaskNote', () {
      test(
        'should create new note when noteId is null',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final content = 'Note content';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.upsertSystemTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: null,
            content: content,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/systemTaskUserData/$taskId/notes',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should update existing note when noteId is provided',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final noteId = 'note-123';
          final content = 'Updated note content';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.upsertSystemTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: noteId,
            content: content,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/systemTaskUserData/$taskId/notes',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final content = 'Note content';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.upsertSystemTaskNote(
              userId: userId,
              taskId: taskId,
              noteId: null,
              content: content,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('upsertUserTaskNote', () {
      test(
        'should create new note when noteId is null',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final content = 'Note content';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.upsertUserTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: null,
            content: content,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks/$taskId/notes',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final content = 'Note content';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.upsertUserTaskNote(
              userId: userId,
              taskId: taskId,
              noteId: null,
              content: content,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );

      test(
        'should update existing note when noteId is provided',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final noteId = 'note-123';
          final content = 'Updated note content';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.upsertUserTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: noteId,
            content: content,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks/$taskId/notes',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );
    });

    group('updateSystemTaskPlacement', () {
      test(
        'should update status when didUpdateStatus is true',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final status = TaskStatusSM.inProgress;
          final selectedSortKey = 100.0;
          when(
            () => mockFirestoreClient.upsertDocument(
              collection: any(named: 'collection'),
              data: any(named: 'data'),
              replaceEntireDocument: any(named: 'replaceEntireDocument'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // Act
          await dataSource.updateSystemTaskPlacement(
            userId: userId,
            taskId: taskId,
            status: status,
            selectedSortKey: selectedSortKey,
            didUpdateStatus: true,
          );

          // Assert
          verify(
            () => mockFirestoreClient.upsertDocument(
              collection: 'users/$userId/systemTaskUserData',
              data: any(named: 'data'),
              replaceEntireDocument: false,
            ),
          ).called(1);
        },
      );

      test(
        'should only update sortKey when didUpdateStatus is false',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final status = TaskStatusSM.inProgress;
          final selectedSortKey = 100.0;
          when(
            () => mockFirestoreClient.upsertDocument(
              collection: any(named: 'collection'),
              data: any(named: 'data'),
              replaceEntireDocument: any(named: 'replaceEntireDocument'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // Act
          await dataSource.updateSystemTaskPlacement(
            userId: userId,
            taskId: taskId,
            status: status,
            selectedSortKey: selectedSortKey,
            didUpdateStatus: false,
          );

          // Assert
          verify(
            () => mockFirestoreClient.upsertDocument(
              collection: 'users/$userId/systemTaskUserData',
              data: any(named: 'data'),
              replaceEntireDocument: false,
            ),
          ).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final status = TaskStatusSM.inProgress;
          final selectedSortKey = 1.0;
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.updateSystemTaskPlacement(
              userId: userId,
              taskId: taskId,
              status: status,
              selectedSortKey: selectedSortKey,
              didUpdateStatus: true,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('updateUserTaskPlacement', () {
      test(
        'should use correct task collection path',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final status = TaskStatusSM.inProgress;
          final selectedSortKey = 1.0;
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer(
            (_) async {},
          );

          // Act
          await dataSource.updateUserTaskPlacement(
            userId: userId,
            taskId: taskId,
            status: status,
            selectedSortKey: selectedSortKey,
            didUpdateStatus: false,
          );

          // Assert
          verify(
            () => mockFirestoreClient.upsertDocument(
              collection: 'users/$userId/tasks',
              data: any(named: 'data'),
              replaceEntireDocument: false,
            ),
          ).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final status = TaskStatusSM.inProgress;
          final selectedSortKey = 1.0;
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.updateUserTaskPlacement(
              userId: userId,
              taskId: taskId,
              status: status,
              selectedSortKey: selectedSortKey,
              didUpdateStatus: true,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('updateUserTaskTitle', () {
      test(
        'should send update with only title field',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final newTitle = 'Updated Title';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.updateUserTaskTitle(
            userId: userId,
            taskId: taskId,
            newTitle: newTitle,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should handle empty title string',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final newTitle = '';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.updateUserTaskTitle(
            userId: userId,
            taskId: taskId,
            newTitle: newTitle,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final newTitle = 'Updated Title';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.updateUserTaskTitle(
              userId: userId,
              taskId: taskId,
              newTitle: newTitle,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('updateUserTaskDescription', () {
      test(
        'should send update with only description field',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final newContent = 'Updated description';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.updateUserTaskDescription(
            userId: userId,
            taskId: taskId,
            newContent: newContent,
          );

          // Assert
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          const userId = 'user-123';
          const taskId = 'task-123';
          const newContent = 'Updated description';
          when(() => mockFirestoreClient.upsertDocument(
                collection: any(named: 'collection'),
                data: any(named: 'data'),
                replaceEntireDocument: any(named: 'replaceEntireDocument'),
              )).thenThrow(Exception('Firestore error'));

          // Act & Assert
          expect(
              () => dataSource.updateUserTaskDescription(
                    userId: userId,
                    taskId: taskId,
                    newContent: newContent,
                  ),
              throwsException);
          verify(() => mockFirestoreClient.upsertDocument(
                collection: 'users/$userId/tasks',
                data: any(named: 'data'),
                replaceEntireDocument: false,
              )).called(1);
        },
      );
    });

    group('deleteSystemTaskNote', () {
      test(
        'should call deleteDocument with correct path and id',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final noteId = 'note-123';
          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.deleteSystemTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: noteId,
          );

          // Assert
          verify(() => mockFirestoreClient.deleteDocument(
                collection: 'users/$userId/systemTaskUserData/$taskId/notes',
                documentId: noteId,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final noteId = 'note-123';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.deleteSystemTaskNote(
              userId: userId,
              taskId: taskId,
              noteId: noteId,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });

    group('deleteUserTaskNote', () {
      test(
        'should remove note from user task notes collection',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final noteId = 'note-123';
          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.deleteUserTaskNote(
            userId: userId,
            taskId: taskId,
            noteId: noteId,
          );

          // Assert
          verify(() => mockFirestoreClient.deleteDocument(
                collection: 'users/$userId/tasks/$taskId/notes',
                documentId: noteId,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.deleteUserTaskNote(
              userId: userId,
              taskId: taskId,
              noteId: 'note-123',
            ),
            throwsA(isA<Exception>()),
          );

          verify(() => mockFirestoreClient.deleteDocument(
                collection: 'users/$userId/tasks/$taskId/notes',
                documentId: 'note-123',
              )).called(1);
        },
      );
    });

    group('deleteUserTask', () {
      test(
        'should remove task document from user tasks collection',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenAnswer((_) async {});

          // Act
          await dataSource.deleteUserTask(
            userId: userId,
            taskId: taskId,
          );

          // Assert
          verify(() => mockFirestoreClient.deleteDocument(
                collection: 'users/$userId/tasks',
                documentId: taskId,
              )).called(1);
        },
      );

      test(
        'should propagate exceptions from Firestore',
        () async {
          // Arrange
          final userId = 'user-123';
          final taskId = 'task-123';
          final error = Exception('Firestore error');

          when(() => mockFirestoreClient.deleteDocument(
                collection: any(named: 'collection'),
                documentId: any(named: 'documentId'),
              )).thenThrow(error);

          // Act & Assert
          expect(
            () => dataSource.deleteUserTask(
              userId: userId,
              taskId: taskId,
            ),
            throwsA(isA<Exception>()),
          );
        },
      );
    });
  });
}
