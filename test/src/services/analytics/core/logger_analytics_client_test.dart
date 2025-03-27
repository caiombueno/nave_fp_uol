import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/services/analytics/core/logger_analytics_client.dart';

// Create a testable version of the class for testing
class TestableLoggerAnalyticsClient extends LoggerAnalyticsClient {
  TestableLoggerAnalyticsClient(this.logFunction);

  final void Function(String message, {String? name}) logFunction;

  @override
  void log(String message, {String? name}) {
    logFunction(message, name: name);
  }
}

class MockLogFunction extends Mock {
  void call(String message, {String? name});
}

void main() {
  late TestableLoggerAnalyticsClient analyticsClient;
  late MockLogFunction mockLog;

  const testUserId = 'user-123';
  const testRouteName = 'home_screen';
  const testAction = 'opened_from_notification';

  setUp(() {
    mockLog = MockLogFunction();
    analyticsClient = TestableLoggerAnalyticsClient(mockLog);
  });

  group(
    'LoggerAnalyticsClient',
    () {
      group('identifyUser', () {
        test('logs user identification with correct parameters', () async {
          // Act
          await analyticsClient.identifyUser(testUserId);

          // Assert
          verify(() => mockLog('identifyUser($testUserId)', name: 'Event'))
              .called(1);
        });
      });

      group('resetUser', () {
        test('logs user reset with correct parameters', () async {
          // Act
          await analyticsClient.resetUser();

          // Assert
          verify(() => mockLog('resetUser', name: 'Event')).called(1);
        });
      });

      group('trackScreenView', () {
        test('logs screen view with correct parameters', () async {
          // Act
          await analyticsClient.trackScreenView(testRouteName, testAction);

          // Assert
          verify(() => mockLog('trackScreenView($testRouteName, $testAction)',
              name: 'Navigation')).called(1);
        });
      });
    },
  );
}
