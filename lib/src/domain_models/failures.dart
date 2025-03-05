import 'package:dart_mappable/dart_mappable.dart';

part 'generated/failures.mapper.dart';

@MappableClass()
sealed class Failure with FailureMappable {
  const Failure();
}

@MappableClass()
class UnknownFailure extends Failure with UnknownFailureMappable {
  const UnknownFailure({
    required this.underlyingException,
    this.underlyingStackTrace,
  });

  final Object underlyingException;
  final StackTrace? underlyingStackTrace;
}

@MappableClass()
class NoInternetFailure extends Failure with NoInternetFailureMappable {
  const NoInternetFailure();
}

@MappableClass()
class UnauthenticatedUserFailure extends Failure
    with UnauthenticatedUserFailureMappable {
  const UnauthenticatedUserFailure();
}

@MappableClass()
sealed class SignInFailure extends Failure with SignInFailureMappable {
  const SignInFailure();
}

@MappableClass()
class InvalidCredentialsFailure extends SignInFailure
    with InvalidCredentialsFailureMappable {
  const InvalidCredentialsFailure();
}

@MappableClass()
class DisabledUserFailure extends SignInFailure
    with DisabledUserFailureMappable {
  const DisabledUserFailure();
}

@MappableClass()
class TooManySignInAttemptsFailure extends SignInFailure
    with TooManySignInAttemptsFailureMappable {
  const TooManySignInAttemptsFailure();
}
