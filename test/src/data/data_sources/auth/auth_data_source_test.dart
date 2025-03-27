import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/auth_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/models/user_am.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import '../../../../fakes.dart';
import '../../../../mocks.dart';

void main() {
  late AuthDataSource authDataSource;
  late MockFirebaseAuth mockFirebaseAuth;

  const testEmail = 'test@example.com';
  const testPassword = 'password123';
  const testUserId = 'user-123';

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();

    authDataSource = AuthDataSource(mockFirebaseAuth);
  });

  group('signInWithEmailAndPassword', () {
    test('returns success when Firebase sign-in succeeds', () async {
      // Arrange
      final mockCredential = MockUserCredential();
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenAnswer((_) async => mockCredential);

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, right(null));
      verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).called(1);
    });

    test('returns InvalidCredentialsFailure for invalid credentials error',
        () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(
        auth.FirebaseAuthException(
          code: 'invalid-credential',
          message: 'Invalid credentials',
        ),
      );

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, left(InvalidCredentialsFailure()));
    });

    test('returns DisabledUserFailure for disabled user error', () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(
        auth.FirebaseAuthException(
          code: 'user-disabled',
          message: 'User disabled',
        ),
      );

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, left(DisabledUserFailure()));
    });

    test('returns TooManySignInAttemptsFailure for too many requests error',
        () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(
        auth.FirebaseAuthException(
          code: 'too-many-requests',
          message: 'Too many sign-in attempts',
        ),
      );

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, left(TooManySignInAttemptsFailure()));
    });

    test('returns NoInternetFailure for network error', () async {
      // Arrange
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(
        auth.FirebaseAuthException(
          code: 'network-request-failed',
          message: 'Network error',
        ),
      );

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, left(NoInternetFailure()));
    });

    test('returns UnknownFailure for other Firebase auth exceptions', () async {
      // Arrange
      final exception = auth.FirebaseAuthException(
        code: 'unknown',
        message: 'Unknown error',
      );

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(exception);

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(
        result,
        isA<Left<Failure, void>>().having(
          (left) => left.value,
          'is UnknownFailure',
          isA<UnknownFailure>(),
        ),
      );
    });

    test('returns UnknownFailure for non-Firebase exceptions', () async {
      // Arrange
      final exception = Exception('Something went wrong');

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenThrow(exception);

      // Act
      final result = await authDataSource.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(
        result,
        isA<Left<Failure, void>>().having(
          (left) => left.value,
          'is UnknownFailure',
          isA<UnknownFailure>(),
        ),
      );
    });
  });

  group('sendPasswordResetEmail', () {
    test('returns success when Firebase reset email succeeds', () async {
      // Arrange
      when(() => mockFirebaseAuth.sendPasswordResetEmail(
            email: testEmail,
          )).thenAnswer((_) async {});

      // Act
      final result = await authDataSource.sendPasswordResetEmail(testEmail);

      // Assert
      expect(result, right(null));
      verify(() => mockFirebaseAuth.sendPasswordResetEmail(
            email: testEmail,
          )).called(1);
    });

    test('returns NoInternetFailure for network error', () async {
      // Arrange
      when(() => mockFirebaseAuth.sendPasswordResetEmail(
            email: testEmail,
          )).thenThrow(
        auth.FirebaseAuthException(
          code: 'network-request-failed',
          message: 'Network error',
        ),
      );

      // Act
      final result = await authDataSource.sendPasswordResetEmail(testEmail);

      // Assert
      expect(result, left(NoInternetFailure()));
    });

    test('returns UnknownFailure for other Firebase auth exceptions', () async {
      // Arrange
      final exception = auth.FirebaseAuthException(
        code: 'unknown',
        message: 'Unknown error',
      );

      when(() => mockFirebaseAuth.sendPasswordResetEmail(
            email: testEmail,
          )).thenThrow(exception);

      // Act
      final result = await authDataSource.sendPasswordResetEmail(testEmail);

      // Assert
      expect(
        result,
        isA<Left<Failure, void>>().having(
          (left) => left.value,
          'is UnknownFailure',
          isA<UnknownFailure>(),
        ),
      );
    });
  });

  group('watchUser', () {
    test('maps Firebase user to UserAM when authenticated', () {
      // Arrange
      when(() => mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.value(FakeFirebaseAuthUser(
                uid: testUserId,
              )));

      // Act
      final result = authDataSource.watchUser();

      // Assert
      expect(
        result,
        emits(
          isA<UserAM>().having((user) => user.id, 'id', testUserId),
        ),
      );
    });

    test('emits null when user is not authenticated', () {
      // Arrange
      when(() => mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.value(null));

      // Act
      final result = authDataSource.watchUser();

      // Assert
      expect(result, emits(null));
    });
  });

  group('watchUserId', () {
    test('returns user ID when authenticated', () {
      // Arrange
      when(() => mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.value(FakeFirebaseAuthUser(
                uid: testUserId,
              )));

      // Act
      final result = authDataSource.watchUserId();

      // Assert
      expect(result, emits(testUserId));
    });

    test('emits null when user is not authenticated', () {
      // Arrange
      when(() => mockFirebaseAuth.authStateChanges())
          .thenAnswer((_) => Stream.value(null));

      // Act
      final result = authDataSource.watchUserId();

      // Assert
      expect(result, emits(null));
    });
  });

  group('getUserId', () {
    test('returns user ID when authenticated', () async {
      // Arrange
      when(() => mockFirebaseAuth.currentUser)
          .thenReturn(FakeFirebaseAuthUser(uid: testUserId));

      // Act
      final result = await authDataSource.getUserId();

      // Assert
      expect(result, testUserId);
    });

    test('returns null when user is not authenticated', () async {
      // Arrange
      when(() => mockFirebaseAuth.currentUser).thenReturn(null);

      // Act
      final result = await authDataSource.getUserId();

      // Assert
      expect(result, null);
    });
  });

  group('signOut', () {
    test('calls signOut on Firebase auth', () async {
      // Arrange
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});

      // Act
      await authDataSource.signOut();

      // Assert
      verify(() => mockFirebaseAuth.signOut()).called(1);
    });
  });
}
