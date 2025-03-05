import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/auth_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/models/user_am.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/user.dart';

part 'user_repository_mappers.dart';

class UserRepository {
  const UserRepository(
    this._authDataSource,
  );

  final AuthDataSource _authDataSource;

  Future<Either<Failure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<Either<Failure, void>> sendPasswordResetEmail(
    String email,
  ) {
    return _authDataSource.sendPasswordResetEmail(
      email,
    );
  }

  Stream<User?> watchUser() {
    return _authDataSource.watchUser().map(
          (authUser) => authUser.toUser(),
        );
  }

  Future<void> signOut() {
    return _authDataSource.signOut();
  }
}
