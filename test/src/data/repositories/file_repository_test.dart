import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/repositories/file_repository.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

import '../../../mocks.dart';

void main() {
  late FileRepository fileRepository;
  late MockCdnDataSource mockCdnDataSource;

  const testPath = 'videos/test-video.mp4';
  const testVideoUrl = 'https://cdn.example.com/videos/test-video.mp4';

  setUp(() {
    mockCdnDataSource = MockCdnDataSource();
    fileRepository = FileRepository(mockCdnDataSource);
  });

  group(
    'FileRepository',
    () {
      group('getVideoUrl', () {
        test('returns video URL when CDN data source succeeds', () async {
          // Arrange
          when(() => mockCdnDataSource.getVideoUrl(path: testPath))
              .thenAnswer((_) async => right(testVideoUrl));

          // Act
          final result = await fileRepository.getVideoUrl(path: testPath);

          // Assert
          expect(result, right(testVideoUrl));
          verify(() => mockCdnDataSource.getVideoUrl(path: testPath)).called(1);
        });

        test('returns failure when CDN data source fails', () async {
          // Arrange
          final failure = NoInternetFailure();

          when(() => mockCdnDataSource.getVideoUrl(path: testPath))
              .thenAnswer((_) async => left(failure));

          // Act
          final result = await fileRepository.getVideoUrl(path: testPath);

          // Assert
          expect(result, left(failure));
          verify(() => mockCdnDataSource.getVideoUrl(path: testPath)).called(1);
        });

        test('handles empty path correctly', () async {
          // Arrange
          const emptyPath = '';
          final failure = NoInternetFailure();

          when(() => mockCdnDataSource.getVideoUrl(path: emptyPath))
              .thenAnswer((_) async => left(failure));

          // Act
          final result = await fileRepository.getVideoUrl(path: emptyPath);

          // Assert
          expect(result, left(failure));
          verify(() => mockCdnDataSource.getVideoUrl(path: emptyPath))
              .called(1);
        });
      });
    },
  );
}
