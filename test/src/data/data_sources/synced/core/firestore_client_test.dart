// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/firestore_client.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import '../../../../../mocks.dart';

void main() {
  late FirestoreClient firestoreClient;
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentReference;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockQueryDocumentSnapshot<Map<String, dynamic>>
      mockQueryDocumentSnapshot;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshot;
  late MockSnapshotMetadata mockSnapshotMetadata;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockQuerySnapshot = MockQuerySnapshot();
    mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockSnapshotMetadata = MockSnapshotMetadata();
    firestoreClient = FirestoreClient(mockFirestore);

    registerFallbackValue(SetOptions(merge: true));
    registerFallbackValue({});
  });

  void setupSuccessfulCollectionStream({
    required String collection,
    required String documentId,
    required Map<String, dynamic> documentData,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.snapshots())
        .thenAnswer((_) => Stream.value(mockQuerySnapshot));

    when(() => mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);

    when(() => mockQuerySnapshot.metadata).thenReturn(mockSnapshotMetadata);

    when(() => mockSnapshotMetadata.isFromCache).thenReturn(false);

    when(() => mockQueryDocumentSnapshot.id).thenReturn(documentId);

    when(() => mockQueryDocumentSnapshot.data()).thenReturn(documentData);
  }

  void setupEmptyCachedCollectionStream({
    required String collection,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.snapshots())
        .thenAnswer((_) => Stream.value(mockQuerySnapshot));

    when(() => mockQuerySnapshot.docs).thenReturn([]);

    when(() => mockQuerySnapshot.metadata).thenReturn(mockSnapshotMetadata);

    when(() => mockSnapshotMetadata.isFromCache).thenReturn(true);
  }

  void setupErrorCollectionStream({
    required String collection,
    required dynamic error,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.snapshots())
        .thenAnswer((_) => Stream.error(error));
  }

  void setupSuccessfulDocumentStream({
    required String collection,
    required String documentId,
    required Map<String, dynamic> documentData,
    bool exists = true,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.doc(any()))
        .thenReturn(mockDocumentReference);

    when(() => mockDocumentReference.snapshots())
        .thenAnswer((_) => Stream.value(mockDocumentSnapshot));

    when(() => mockDocumentSnapshot.exists).thenReturn(exists);

    when(() => mockDocumentSnapshot.id).thenReturn(documentId);

    when(() => mockDocumentSnapshot.data()).thenReturn(documentData);
  }

  void setupMissingDocumentStream({
    required String collection,
    required String documentId,
    required bool isFromCache,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.doc(any()))
        .thenReturn(mockDocumentReference);

    when(() => mockDocumentReference.snapshots())
        .thenAnswer((_) => Stream.value(mockDocumentSnapshot));

    when(() => mockDocumentSnapshot.exists).thenReturn(false);

    when(() => mockDocumentSnapshot.metadata).thenReturn(mockSnapshotMetadata);

    when(() => mockSnapshotMetadata.isFromCache).thenReturn(isFromCache);
  }

  void setupErrorDocumentStream({
    required String collection,
    required String documentId,
    required dynamic error,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.doc(any()))
        .thenReturn(mockDocumentReference);

    when(() => mockDocumentReference.snapshots())
        .thenAnswer((_) => Stream.error(error));
  }

  void setupSuccessfulDeleteDocument({
    required String collection,
    required String documentId,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.doc(any()))
        .thenReturn(mockDocumentReference);

    when(() => mockDocumentReference.delete()).thenAnswer((_) async {});
  }

  void setupErrorDeleteDocument({
    required String collection,
    required String documentId,
    required dynamic error,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    when(() => mockCollectionReference.doc(any()))
        .thenReturn(mockDocumentReference);

    when(() => mockDocumentReference.delete()).thenThrow(error);
  }

  void setupSuccessfulUpsertDocument({
    required String collection,
    required String? documentId,
    required bool replaceEntireDocument,
  }) {
    when(() => mockFirestore.collection(any()))
        .thenReturn(mockCollectionReference);

    if (documentId != null) {
      when(() => mockCollectionReference.doc(any()))
          .thenReturn(mockDocumentReference);

      when(() => mockDocumentReference.set(any(), any()))
          .thenAnswer((_) async {});
    }
  }

  Future<void> verifyCollectionStreamSuccess<T>({
    required Stream<Either<Failure, List<T>>> stream,
    required void Function(List<T> models) verifier,
  }) async {
    final result = await stream.first;

    expect(result.isRight(), isTrue,
        reason:
            'Expected Right but got Left: ${result.fold((l) => l, (r) => r)}');

    result.fold(
      (failure) => fail('Expected Right but got Left: $failure'),
      verifier,
    );
  }

  Future<void> verifyCollectionStreamFailure<Right, FailType>({
    required Stream<Either<Failure, List<Right>>> stream,
  }) async {
    final result = await stream.first;

    expect(result.isLeft(), isTrue, reason: 'Expected Left but got Right');

    result.fold(
      (failure) => expect(failure, isA<FailType>()),
      (_) => fail('Expected Left but got Right'),
    );
  }

  Future<void> verifyDocumentStreamSuccess<T>({
    required Stream<Either<Failure, T>> stream,
    required void Function(T model) verifier,
  }) async {
    final result = await stream.first;

    expect(result.isRight(), isTrue,
        reason:
            'Expected Right but got Left: ${result.fold((l) => l, (r) => r)}');

    result.fold(
      (failure) => fail('Expected Right but got Left: $failure'),
      verifier,
    );
  }

  Future<void> verifyDocumentStreamFailure<Right, FailType>({
    required Stream<Either<Failure, Right>> stream,
  }) async {
    final result = await stream.first;

    expect(result.isLeft(), isTrue, reason: 'Expected Left but got Right');

    result.fold(
      (failure) => expect(failure, isA<FailType>()),
      (_) => fail('Expected Left but got Right'),
    );
  }

  TestModel Function(Map<String, dynamic>) createFromMapFn() {
    return (Map<String, dynamic> json) => TestModel(
          id: json['id'],
          name: json['name'],
        );
  }

  group('FirestoreClient', () {
    group('watchCollection', () {
      test(
        'should return collection data when connection is successful',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final documentData = {'name': 'Test'};

          setupSuccessfulCollectionStream(
            collection: collection,
            documentId: documentId,
            documentData: documentData,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchCollection(
            collection: collection,
            itemFromMap: fromMap,
            assumeCollectionExists: true,
          );

          // Assert
          await verifyCollectionStreamSuccess<TestModel>(
            stream: stream,
            verifier: (models) {
              expect(models.length, 1);
              expect(models[0].id, documentId);
              expect(models[0].name, documentData['name']);
            },
          );
        },
      );

      test(
        'should return NoInternetFailure when collection is empty and from cache',
        () async {
          // Arrange
          final collection = 'test-collection';

          setupEmptyCachedCollectionStream(
            collection: collection,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchCollection(
            collection: collection,
            itemFromMap: fromMap,
            assumeCollectionExists: true,
          );

          // Assert
          await verifyCollectionStreamFailure<TestModel, NoInternetFailure>(
            stream: stream,
          );
        },
      );

      test(
        'should return UnknownFailure when general error occurs',
        () async {
          // Arrange
          final collection = 'test-collection';
          final error = Exception('test error');

          setupErrorCollectionStream(
            collection: collection,
            error: error,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchCollection(
            collection: collection,
            itemFromMap: fromMap,
            assumeCollectionExists: true,
          );

          // Assert
          await verifyCollectionStreamFailure<TestModel, UnknownFailure>(
            stream: stream,
          );
        },
      );

      test(
        'should return UnauthenticatedUserFailure when permission denied',
        () async {
          // Arrange
          final collection = 'test-collection';
          final error = FirebaseException(
            plugin: 'firestore',
            code: 'permission-denied',
            message: 'Permission denied',
          );

          setupErrorCollectionStream(
            collection: collection,
            error: error,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchCollection(
            collection: collection,
            itemFromMap: fromMap,
            assumeCollectionExists: true,
          );

          // Assert
          await verifyCollectionStreamFailure<TestModel,
              UnauthenticatedUserFailure>(
            stream: stream,
          );
        },
      );
    });

    group('watchDocument', () {
      test(
        'should return document data when document exists',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final documentData = {'name': 'Test'};

          setupSuccessfulDocumentStream(
            collection: collection,
            documentId: documentId,
            documentData: documentData,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchDocument(
            collection: collection,
            documentId: documentId,
            itemFromMap: fromMap,
          );

          // Assert
          await verifyDocumentStreamSuccess<TestModel>(
            stream: stream,
            verifier: (model) {
              expect(model.id, documentId);
              expect(model.name, documentData['name']);
            },
          );
        },
      );

      test(
        'should return null for non-existent document with nullable type',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';

          setupMissingDocumentStream(
            collection: collection,
            documentId: documentId,
            isFromCache: false,
          );

          // Function to convert map to nullable test object
          TestModel? fromMap(Map<String, dynamic> json) => TestModel(
                id: json['id'],
                name: json['name'],
              );

          // Act
          final stream = firestoreClient.watchDocument<TestModel?>(
            collection: collection,
            documentId: documentId,
            itemFromMap: fromMap,
          );

          // Assert
          final result = await stream.first;

          expect(result.isRight(), isTrue);

          result.fold(
            (failure) => fail('Expected Right(null) but got Left: $failure'),
            (model) => expect(model, isNull),
          );
        },
      );

      test(
        'should return NoInternetFailure when document missing and from cache',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';

          setupMissingDocumentStream(
            collection: collection,
            documentId: documentId,
            isFromCache: true,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchDocument<TestModel>(
            collection: collection,
            documentId: documentId,
            itemFromMap: fromMap,
          );

          // Assert
          await verifyDocumentStreamFailure<TestModel, NoInternetFailure>(
            stream: stream,
          );
        },
      );

      test(
        'should return UnauthenticatedUserFailure when permission denied',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final error = FirebaseException(
            plugin: 'firestore',
            code: 'permission-denied',
            message: 'Permission denied',
          );

          setupErrorDocumentStream(
            collection: collection,
            documentId: documentId,
            error: error,
          );

          final fromMap = createFromMapFn();

          // Act
          final stream = firestoreClient.watchDocument(
            collection: collection,
            documentId: documentId,
            itemFromMap: fromMap,
          );

          // Assert
          await verifyDocumentStreamFailure<TestModel,
              UnauthenticatedUserFailure>(
            stream: stream,
          );
        },
      );
    });

    group('deleteDocument', () {
      test(
        'should call Firestore delete with correct path and id',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';

          setupSuccessfulDeleteDocument(
            collection: collection,
            documentId: documentId,
          );

          // Act
          await firestoreClient.deleteDocument(
            collection: collection,
            documentId: documentId,
          );

          // Assert
          verify(() => mockFirestore.collection(collection)).called(1);
          verify(() => mockCollectionReference.doc(documentId)).called(1);
          verify(() => mockDocumentReference.delete()).called(1);
        },
      );

      test(
        'should propagate exceptions when delete operation fails',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final error = Exception('Delete failed');

          setupErrorDeleteDocument(
            collection: collection,
            documentId: documentId,
            error: error,
          );

          // Act & Assert
          expect(
            () => firestoreClient.deleteDocument(
              collection: collection,
              documentId: documentId,
            ),
            throwsA(error),
          );
        },
      );
    });

    group('upsertDocument', () {
      test(
        'should update existing document with merge when id exists',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final data = {'id': documentId, 'name': 'Test'};

          setupSuccessfulUpsertDocument(
            collection: collection,
            documentId: documentId,
            replaceEntireDocument: false,
          );

          // Act
          await firestoreClient.upsertDocument(
            collection: collection,
            data: data,
            replaceEntireDocument: false,
          );

          // Assert
          verify(() => mockFirestore.collection(collection)).called(1);
          verify(() => mockCollectionReference.doc(documentId)).called(1);
          verify(() => mockDocumentReference.set(
                any(that: predicate((data) => (data as Map)['name'] == 'Test')),
                any(
                    that: predicate(
                        (options) => (options as SetOptions).merge == true)),
              )).called(1);
        },
      );

      test(
        'should replace entire document when replaceEntireDocument is true',
        () async {
          // Arrange
          final collection = 'test-collection';
          final documentId = 'doc-id';
          final data = {'id': documentId, 'name': 'Test'};

          setupSuccessfulUpsertDocument(
            collection: collection,
            documentId: documentId,
            replaceEntireDocument: true,
          );

          // Act
          await firestoreClient.upsertDocument(
            collection: collection,
            data: data,
            replaceEntireDocument: true,
          );

          // Assert
          verify(() => mockFirestore.collection(collection)).called(1);
          verify(() => mockCollectionReference.doc(documentId)).called(1);
          verify(() => mockDocumentReference.set(
                any(that: predicate((data) => (data as Map)['name'] == 'Test')),
                any(
                    that: predicate(
                        (options) => (options as SetOptions).merge == false)),
              )).called(1);
        },
      );

      test(
        'should create new document when id is not provided',
        () async {
          // Arrange
          final collection = 'test-collection';
          final data = {'name': 'Test'};

          // Setup for add method
          when(() => mockFirestore.collection(any()))
              .thenReturn(mockCollectionReference);

          when(() => mockCollectionReference.add(any()))
              .thenAnswer((_) async => mockDocumentReference);

          // Act
          await firestoreClient.upsertDocument(
            collection: collection,
            data: data,
            replaceEntireDocument: false, // This value doesn't matter for add
          );

          // Assert
          verify(() => mockFirestore.collection(collection)).called(1);
          verify(() => mockCollectionReference.add(
                any(that: predicate((data) => (data as Map)['name'] == 'Test')),
              )).called(1);
        },
      );
    });
  });
}

@immutable
class TestModel {
  final String id;
  final String name;

  const TestModel({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'TestModel(id: $id, name: $name)';
}
