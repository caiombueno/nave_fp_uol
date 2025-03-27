import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

void main() {
  group('Failure', () {
    group('UnknownFailure', () {
      test('initializes with required parameters', () {
        // Arrange
        final exception = Exception('Test exception');
        final stackTrace = StackTrace.current;

        // Act
        final failure = UnknownFailure(
          underlyingException: exception,
          underlyingStackTrace: stackTrace,
        );

        // Assert
        expect(failure, isA<Failure>());
        expect(failure.underlyingException, equals(exception));
        expect(failure.underlyingStackTrace, equals(stackTrace));
      });

      test('initializes with null stackTrace', () {
        // Arrange
        final exception = Exception('Test exception');

        // Act
        final failure = UnknownFailure(
          underlyingException: exception,
        );

        // Assert
        expect(failure.underlyingException, equals(exception));
        expect(failure.underlyingStackTrace, isNull);
      });
    });

    group('NoInternetFailure', () {
      test('initializes correctly', () {
        // Arrange & Act
        const failure = NoInternetFailure();

        // Assert
        expect(failure, isA<Failure>());
      });
    });

    group('UnauthenticatedUserFailure', () {
      test('initializes correctly', () {
        // Arrange & Act
        const failure = UnauthenticatedUserFailure();

        // Assert
        expect(failure, isA<Failure>());
      });
    });

    group('SignInFailure subclasses', () {
      test('InvalidCredentialsFailure initializes correctly', () {
        // Arrange & Act
        const failure = InvalidCredentialsFailure();

        // Assert
        expect(failure, isA<Failure>());
        expect(failure, isA<SignInFailure>());
      });

      test('DisabledUserFailure initializes correctly', () {
        // Arrange & Act
        const failure = DisabledUserFailure();

        // Assert
        expect(failure, isA<Failure>());
        expect(failure, isA<SignInFailure>());
      });

      test('TooManySignInAttemptsFailure initializes correctly', () {
        // Arrange & Act
        const failure = TooManySignInAttemptsFailure();

        // Assert
        expect(failure, isA<Failure>());
        expect(failure, isA<SignInFailure>());
      });
    });

    group('Pattern matching', () {
      test('correctly identifies failure types in switch statements', () {
        // Arrange
        const noInternet = NoInternetFailure();
        const invalidCredentials = InvalidCredentialsFailure();
        final unknown = UnknownFailure(underlyingException: Exception());

        // Act & Assert
        String failureType(Failure failure) {
          return switch (failure) {
            NoInternetFailure() => 'network',
            SignInFailure() => 'authentication',
            UnknownFailure() => 'unknown',
            UnauthenticatedUserFailure() => 'unauthenticated',
          };
        }

        expect(failureType(noInternet), equals('network'));
        expect(failureType(invalidCredentials), equals('authentication'));
        expect(failureType(unknown), equals('unknown'));
      });

      test('correctly identifies specific SignInFailure subtypes', () {
        // Arrange
        const invalidCredentials = InvalidCredentialsFailure();
        const disabledUser = DisabledUserFailure();
        const tooManyAttempts = TooManySignInAttemptsFailure();

        // Act & Assert
        String signInFailureType(SignInFailure failure) {
          return switch (failure) {
            InvalidCredentialsFailure() => 'invalid_credentials',
            DisabledUserFailure() => 'disabled_user',
            TooManySignInAttemptsFailure() => 'too_many_attempts',
          };
        }

        expect(signInFailureType(invalidCredentials),
            equals('invalid_credentials'));
        expect(signInFailureType(disabledUser), equals('disabled_user'));
        expect(signInFailureType(tooManyAttempts), equals('too_many_attempts'));
      });
    });

    group('Mapping functionality', () {
      test('NoInternetFailure serializes and deserializes correctly', () {
        // Arrange
        const failure = NoInternetFailure();

        // Act
        final map = failure.toMap();
        final restored = FailureMapper.fromMap(map);

        // Assert
        expect(restored, isA<NoInternetFailure>());
      });

      test('SignInFailure subclasses serialize and deserialize correctly', () {
        // Arrange
        const failure = InvalidCredentialsFailure();

        // Act
        final map = failure.toMap();
        final restored = FailureMapper.fromMap(map);

        // Assert
        expect(restored, isA<InvalidCredentialsFailure>());
        expect(restored, isA<SignInFailure>());
      });
    });
  });
}
