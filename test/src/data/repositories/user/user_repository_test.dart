import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/models/user_am.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/domain_models/user.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../mocks.dart';

void main() {
  late UserRepository userRepository;
  late MockAuthDataSource mockAuthDataSource;
  late BehaviorSubject<UserAM?> userSubject;

  const testEmail = 'test@example.com';
  const testPassword = 'password123';

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    userRepository = UserRepository(mockAuthDataSource);
    userSubject = BehaviorSubject<UserAM?>();

    when(() => mockAuthDataSource.watchUser())
        .thenAnswer((_) => userSubject.stream);
  });

  tearDown(() {
    userSubject.close();
  });

  group('signInWithEmailAndPassword', () {
    test('returns success when auth data source succeeds', () async {
      // Arrange
      when(() => mockAuthDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenAnswer((_) async => right(null));

      // Act
      final result = await userRepository.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, right(null));
      verify(() => mockAuthDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).called(1);
    });

    test('returns failure when auth data source fails', () async {
      // Arrange
      final failure = UnauthenticatedUserFailure();

      when(() => mockAuthDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          )).thenAnswer((_) async => left(failure));

      // Act
      final result = await userRepository.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      );

      // Assert
      expect(result, left(failure));
    });
  });

  group('sendPasswordResetEmail', () {
    test('returns success when auth data source succeeds', () async {
      // Arrange
      when(() => mockAuthDataSource.sendPasswordResetEmail(testEmail))
          .thenAnswer((_) async => right(null));

      // Act
      final result = await userRepository.sendPasswordResetEmail(testEmail);

      // Assert
      expect(result, right(null));
      verify(() => mockAuthDataSource.sendPasswordResetEmail(testEmail))
          .called(1);
    });

    test('returns failure when auth data source fails', () async {
      // Arrange
      final failure = UnauthenticatedUserFailure();

      when(() => mockAuthDataSource.sendPasswordResetEmail(testEmail))
          .thenAnswer((_) async => left(failure));

      // Act
      final result = await userRepository.sendPasswordResetEmail(testEmail);

      // Assert
      expect(result, left(failure));
    });
  });

  group('watchUser', () {
    test('maps authenticated user to domain user', () {
      // Arrange
      final authUser = UserAM(
        id: 'user-123',
      );

      // Act
      userSubject.add(authUser);
      final result = userRepository.watchUser();

      // Assert
      expect(
        result,
        emits(
          isA<User>().having((user) => user.id, 'id', 'user-123'),
        ),
      );
    });

    test('emits null when user is not authenticated', () {
      // Arrange
      userSubject.add(null);

      // Act
      final result = userRepository.watchUser();

      // Assert
      expect(result, emits(null));
    });
  });

  group('signOut', () {
    test('calls signOut on auth data source', () async {
      // Arrange
      when(() => mockAuthDataSource.signOut()).thenAnswer((_) async {});

      // Act
      await userRepository.signOut();

      // Assert
      verify(() => mockAuthDataSource.signOut()).called(1);
    });
  });
}
