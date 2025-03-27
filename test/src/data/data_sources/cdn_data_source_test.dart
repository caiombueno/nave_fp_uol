import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/cdn_data_source.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import '../../../fakes.dart';
import '../../../mocks.dart';

void main() {
  late CdnDataSource cdnDataSource;
  late MockFirebaseFunctions mockFirebaseFunctions;
  late MockHttpsCallable mockHttpsCallable;

  const testPath = 'videos/test-video.mp4';
  const testVideoUrl = 'https://cdn.example.com/videos/test-video.mp4';

  setUp(() {
    mockFirebaseFunctions = MockFirebaseFunctions();
    mockHttpsCallable = MockHttpsCallable();
    cdnDataSource = CdnDataSource(mockFirebaseFunctions);

    when(() => mockFirebaseFunctions.httpsCallable('getVideoUrl'))
        .thenReturn(mockHttpsCallable);
  });

  group('getVideoUrl', () {
    test('returns URL when Firebase function call succeeds', () async {
      // Arrange
      when(() => mockHttpsCallable.call({
            'path': testPath,
          })).thenAnswer(
        (_) async => FakeHttpCallableResult(data: {
          'url': 'https://cdn.example.com/videos/test-video.mp4',
        }),
      );

      // Act
      final result = await cdnDataSource.getVideoUrl(path: testPath);

      // Assert
      expect(result, right(testVideoUrl));
      verify(() => mockFirebaseFunctions.httpsCallable('getVideoUrl'))
          .called(1);
      verify(() => mockHttpsCallable.call({'path': testPath})).called(1);
    });

    test('returns NoInternetFailure when Firebase returns network error',
        () async {
      // Arrange
      when(() => mockHttpsCallable.call({
            'path': testPath,
          })).thenThrow(
        FirebaseFunctionsException(
          message: 'Network error',
          code: '-1009',
        ),
      );

      // Act
      final result = await cdnDataSource.getVideoUrl(path: testPath);

      // Assert
      expect(result, left(NoInternetFailure()));
    });

    test('returns UnauthenticatedUserFailure when Firebase returns auth error',
        () async {
      // Arrange
      when(() => mockHttpsCallable.call({
            'path': testPath,
          })).thenThrow(
        FirebaseFunctionsException(
          message: 'Unauthenticated',
          code: 'unauthenticated',
        ),
      );

      // Act
      final result = await cdnDataSource.getVideoUrl(path: testPath);

      // Assert
      expect(result, left(UnauthenticatedUserFailure()));
    });

    test('returns UnknownFailure for other Firebase exceptions', () async {
      // Arrange
      final exception = FirebaseFunctionsException(
        message: 'Unknown error',
        code: 'unknown',
      );

      when(() => mockHttpsCallable.call(any())).thenThrow(exception);

      // Act
      final result = await cdnDataSource.getVideoUrl(path: testPath);

      // Assert
      expect(
        result,
        isA<Left<Failure, String>>().having(
          (left) => left.value,
          'is UnknownFailure',
          isA<UnknownFailure>(),
        ),
      );
    });

    test('returns UnknownFailure for non-Firebase exceptions', () async {
      // Arrange
      final exception = Exception('Something went wrong');

      when(() => mockHttpsCallable.call({
            'path': testPath,
          })).thenThrow(exception);

      // Act
      final result = await cdnDataSource.getVideoUrl(path: testPath);

      // Assert
      expect(
        result,
        isA<Left<Failure, String>>().having(
          (left) => left.value,
          'is UnknownFailure',
          isA<UnknownFailure>(),
        ),
      );
    });
  });
}
