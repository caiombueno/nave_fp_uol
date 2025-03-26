import 'package:cloud_functions/cloud_functions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

class CdnDataSource {
  const CdnDataSource(
    this._firebaseFunctions,
  );

  final FirebaseFunctions _firebaseFunctions;

  Future<Either<Failure, String>> getVideoUrl({
    required String path,
  }) async {
    try {
      final result =
          await _firebaseFunctions.httpsCallable('getVideoUrl').call({
        'path': path,
      });

      return right(
        result.data['url'] as String,
      );
    } catch (exception, stackTrace) {
      if (exception is FirebaseFunctionsException) {
        if (exception.code == '-1009') {
          return left(
            NoInternetFailure(),
          );
        } else if (exception.code == 'unauthenticated') {
          return left(
            UnauthenticatedUserFailure(),
          );
        }
      }

      return left(
        UnknownFailure(
          underlyingException: exception,
          underlyingStackTrace: stackTrace,
        ),
      );
    }
  }
}
