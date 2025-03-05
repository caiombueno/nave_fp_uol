part of 'user_repository.dart';

extension on UserAM? {
  User? toUser() {
    final user = this;
    return user != null ? User(id: user.id) : null;
  }
}
