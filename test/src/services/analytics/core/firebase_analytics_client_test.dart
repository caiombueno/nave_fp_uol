import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/services/analytics/core/firebase_analytics_client.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  late FirebaseAnalyticsClient analyticsClient;
  late MockFirebaseAnalytics mockFirebaseAnalytics;

  const testUserId = 'user-123';
  const testRouteName = 'home_screen';
  const testAction = 'opened_from_notification';

  setUp(() {
    mockFirebaseAnalytics = MockFirebaseAnalytics();
    analyticsClient = FirebaseAnalyticsClient(mockFirebaseAnalytics);
  });

  group(
    'FirebaseAnalyticsClient',
    () {
      group('identifyUser', () {
        test('sets user ID in Firebase Analytics', () async {
          // Arrange
          when(() => mockFirebaseAnalytics.setUserId(id: testUserId))
              .thenAnswer((_) async {});

          // Act
          await analyticsClient.identifyUser(testUserId);

          // Assert
          verify(() => mockFirebaseAnalytics.setUserId(id: testUserId))
              .called(1);
        });
      });

      group('resetUser', () {
        test('clears user ID in Firebase Analytics', () async {
          // Arrange
          when(() => mockFirebaseAnalytics.setUserId(id: null))
              .thenAnswer((_) async {});

          // Act
          await analyticsClient.resetUser();

          // Assert
          verify(() => mockFirebaseAnalytics.setUserId(id: null)).called(1);
        });
      });

      group('trackScreenView', () {
        test('logs screen view with correct parameters', () async {
          // Arrange
          when(() => mockFirebaseAnalytics.logScreenView(
                screenName: 'screen_view',
                parameters: {
                  'name': testRouteName,
                  'action': testAction,
                },
              )).thenAnswer((_) async {});

          // Act
          await analyticsClient.trackScreenView(testRouteName, testAction);

          // Assert
          verify(() => mockFirebaseAnalytics.logScreenView(
                screenName: 'screen_view',
                parameters: {
                  'name': testRouteName,
                  'action': testAction,
                },
              )).called(1);
        });
      });
    },
  );
}
