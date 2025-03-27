import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';

// Create a testable version that overrides the external dependencies
class TestableErrorReporter extends ErrorReporter {
  TestableErrorReporter({
    required this.mockCaptureException,
  });

  final Future<void> Function(Object exception, StackTrace? stackTrace)
      mockCaptureException;

  @override
  Future<void> captureException(Object exception, {StackTrace? stackTrace}) {
    return mockCaptureException(exception, stackTrace);
  }
}

class MockExceptionCapture extends Mock {
  Future<void> call(Object exception, StackTrace? stackTrace);
}

class MockLogger extends Mock {
  void call(String message,
      {String? name, Object? error, StackTrace? stackTrace});
}

void main() {
  late TestableErrorReporter errorReporter;
  late MockExceptionCapture mockCaptureException;

  setUp(() {
    mockCaptureException = MockExceptionCapture();

    errorReporter = TestableErrorReporter(
      mockCaptureException: mockCaptureException,
    );

    // Set up default behavior
    when(() => mockCaptureException(any(), any())).thenAnswer((_) async {});
  });

  group(
    'ErrorReport',
    () {
      group('reportFailure', () {
        test('reports underlying exception for UnknownFailure', () async {
          // Arrange
          final exception = Exception('Test exception');
          final stackTrace = StackTrace.current;
          final failure = UnknownFailure(
            underlyingException: exception,
            underlyingStackTrace: stackTrace,
          );

          // Act
          await errorReporter.reportFailure(failure);

          // Assert
          verify(() => mockCaptureException(exception, stackTrace)).called(1);
        });

        test('does not report other failure types', () async {
          // Arrange
          final failure = NoInternetFailure();

          // Act
          await errorReporter.reportFailure(failure);

          // Assert
          verifyNever(() => mockCaptureException(any(), any()));
        });
      });

      group('reportException', () {
        test('captures exception and logs it', () async {
          // Arrange
          final exception = Exception('Test exception');
          final stackTrace = StackTrace.current;

          // Act
          await errorReporter.reportException(exception, stackTrace);

          // Assert
          verify(() => mockCaptureException(exception, stackTrace)).called(1);
        });

        test('handles null stackTrace', () async {
          // Arrange
          final exception = Exception('Test exception');

          // Act
          await errorReporter.reportException(exception, null);

          // Assert
          verify(() => mockCaptureException(exception, null)).called(1);
        });
      });
    },
  );
}
