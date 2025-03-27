import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/services/analytics/core/mixpanel_analytics_client.dart';

import '../../../../mocks.dart';

void main() {
  late MixpanelAnalyticsClient analyticsClient;
  late MockMixpanel mockMixpanel;

  const testUserId = 'user-123';
  const testRouteName = 'home_screen';
  const testAction = 'opened_from_notification';

  setUp(() {
    mockMixpanel = MockMixpanel();
    analyticsClient = MixpanelAnalyticsClient(mockMixpanel);
  });

  group(
    'MixpanelAnalyticsClient',
    () {
      group('identifyUser', () {
        test('identifies user in Mixpanel', () async {
          // Arrange
          when(() => mockMixpanel.identify(testUserId))
              .thenAnswer((_) async {});

          // Act
          await analyticsClient.identifyUser(testUserId);

          // Assert
          verify(() => mockMixpanel.identify(testUserId)).called(1);
        });
      });

      group('resetUser', () {
        test('resets user in Mixpanel', () async {
          // Arrange
          when(() => mockMixpanel.reset()).thenAnswer((_) async {});

          // Act
          await analyticsClient.resetUser();

          // Assert
          verify(() => mockMixpanel.reset()).called(1);
        });
      });

      group('trackScreenView', () {
        test('tracks screen view with correct parameters', () async {
          // Arrange
          when(() => mockMixpanel.track(
                'Screen View',
                properties: {
                  'name': testRouteName,
                  'action': testAction,
                },
              )).thenAnswer((_) async {});

          // Act
          await analyticsClient.trackScreenView(testRouteName, testAction);

          // Assert
          verify(() => mockMixpanel.track(
                'Screen View',
                properties: {
                  'name': testRouteName,
                  'action': testAction,
                },
              )).called(1);
        });
      });
    },
  );
}
