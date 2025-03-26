import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/models/user_am.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

class AuthDataSource {
  const AuthDataSource(
    this._firebaseAuth,
  );

  final FirebaseAuth _firebaseAuth;

  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(null);
    } catch (error, stackTrace) {
      if (error is FirebaseAuthException) {
        final errorCode = error.code;
        final failure = switch (errorCode) {
          _FirebaseAuthErrorCodes.invalidCredentials =>
            InvalidCredentialsFailure(),
          _FirebaseAuthErrorCodes.disabledUser => DisabledUserFailure(),
          _FirebaseAuthErrorCodes.tooManyRequests =>
            TooManySignInAttemptsFailure(),
          _FirebaseAuthErrorCodes.networkRequestFailed => NoInternetFailure(),
          _ => UnknownFailure(
              underlyingException: error,
              underlyingStackTrace: stackTrace,
            ),
        };

        return left(
          failure,
        );
      } else {
        return left(
          UnknownFailure(
            underlyingException: error,
            underlyingStackTrace: stackTrace,
          ),
        );
      }
    }
  }

  Future<Either<Failure, void>> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
        // TODO: Specify the actionCodeSettings parameter for deep linking from the email.
      );

      return right(null);
    } catch (error, stackTrace) {
      if (error is FirebaseAuthException) {
        final errorCode = error.code;
        final failure = switch (errorCode) {
          _FirebaseAuthErrorCodes.networkRequestFailed => NoInternetFailure(),
          _ => UnknownFailure(
              underlyingException: error,
              underlyingStackTrace: stackTrace,
            ),
        };

        return left(
          failure,
        );
      } else {
        return left(
          UnknownFailure(
            underlyingException: error,
            underlyingStackTrace: stackTrace,
          ),
        );
      }
    }
  }

  Stream<UserAM?> watchUser() {
    return _firebaseAuth.authStateChanges().map(
          (firebaseUser) => firebaseUser != null
              ? UserAM(
                  id: firebaseUser.uid,
                )
              : null,
        );
  }

  Stream<String?> watchUserId() {
    return watchUser().map(
      (user) => user?.id,
    );
  }

  Future<String?> getUserId() async {
    return _firebaseAuth.currentUser?.uid;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}

abstract class _FirebaseAuthErrorCodes {
  static const String invalidCredentials = 'invalid-credential';
  static const String disabledUser = 'user-disabled';
  static const String tooManyRequests = 'too-many-requests';
  static const String networkRequestFailed = 'network-request-failed';
}
