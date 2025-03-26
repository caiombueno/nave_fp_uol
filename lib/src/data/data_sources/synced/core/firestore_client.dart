import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

const String _idKey = 'id';

class FirestoreClient {
  const FirestoreClient(
    this._firestore,
  );

  final FirebaseFirestore _firestore;

  Stream<Either<Failure, List<T>>> watchCollection<T>({
    required String collection,
    required T Function(Map<String, dynamic> json) itemFromMap,
    // If the below is false, we won't assume there's no internet if the
    // collection doesn't exists. It's not ideal, but the Firestore API has no
    // reliable way for us to know if a request has failed due to lack of connection.
    required bool assumeCollectionExists,
  }) {
    return _firestore
        .collection(
          collection,
        )
        .toStream(
          itemFromMap: itemFromMap,
          assumeCollectionExists: assumeCollectionExists,
        );
  }

  Stream<Either<Failure, T>> watchDocument<T>({
    required String collection,
    required String documentId,
    required T Function(Map<String, dynamic> json) itemFromMap,
  }) {
    return _firestore
        .collection(
          collection,
        )
        .doc(
          documentId,
        )
        .toStream(
          itemFromMap: itemFromMap,
        );
  }

  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    await _firestore
        .collection(
          collection,
        )
        .doc(documentId)
        .delete();
  }

  Future<void> upsertDocument({
    required String collection,
    required Map<String, dynamic> data,
    required bool replaceEntireDocument,
  }) async {
    final id = data[_idKey];
    if (id != null) {
      await _firestore
          .collection(
            collection,
          )
          .doc(id)
          .set(
            data
              ..remove(
                _idKey,
              ),
            SetOptions(
              merge: !replaceEntireDocument,
            ),
          );
    } else {
      await _firestore.collection(collection).add(
            data
              ..remove(
                _idKey,
              ),
          );
    }
  }
}

extension on DocumentReference {
  Stream<Either<Failure, T>> toStream<T>({
    required T Function(Map<String, dynamic> json) itemFromMap,
  }) {
    return snapshots().map((snapshot) {
      if (!snapshot.exists) {
        // It means the function has a nullable type and is expecting a null
        // value for this scenario.
        if (null is T) {
          return right<Failure, T>(
            null as T,
          );
        }

        if (snapshot.metadata.isFromCache) {
          return left<Failure, T>(
            NoInternetFailure(),
          );
        }
      }

      return right<Failure, T>(
        itemFromMap({
          _idKey: snapshot.id,
          ...(snapshot.data() as Map<String, dynamic>),
        }),
      );
    }).parseFirestoreErrors();
  }
}

extension on CollectionReference {
  Stream<Either<Failure, List<T>>> toStream<T>({
    required T Function(Map<String, dynamic> json) itemFromMap,
    required bool assumeCollectionExists,
  }) {
    return snapshots().map((snapshot) {
      if (snapshot.docs.isEmpty &&
          snapshot.metadata.isFromCache &&
          assumeCollectionExists) {
        return left<Failure, List<T>>(
          NoInternetFailure(),
        );
      }

      return right<Failure, List<T>>(
        snapshot.docs.map(
          (docSnapshot) {
            return itemFromMap({
              _idKey: docSnapshot.id,
              ...(docSnapshot.data() as Map<String, dynamic>),
            });
          },
        ).toList(),
      );
    }).parseFirestoreErrors();
  }
}

extension<T> on Stream<Either<Failure, T>> {
  Stream<Either<Failure, T>> parseFirestoreErrors<T>() {
    return transform(
      StreamTransformer.fromHandlers(
        handleError: (exception, stackTrace, sink) {
          if (exception is FirebaseException &&
              exception.code == _FirestoreErrorCodes.permissionDenied) {
            sink.add(
              left(
                UnauthenticatedUserFailure(),
              ),
            );
          } else {
            sink.add(
              left(
                UnknownFailure(
                  underlyingException: exception,
                  underlyingStackTrace: stackTrace,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _FirestoreErrorCodes {
  static const String permissionDenied = 'permission-denied';
}
