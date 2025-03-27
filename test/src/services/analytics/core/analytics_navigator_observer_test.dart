import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/services/analytics/core/analytics_navigator_observer.dart';

import '../../../../mocks.dart';

void main() {
  late AnalyticsNavigatorObserver observer;
  late MockAnalyticsClient mockAnalyticsClient;

  const testRouteName = '/home';

  setUp(() {
    mockAnalyticsClient = MockAnalyticsClient();
    observer = AnalyticsNavigatorObserver(mockAnalyticsClient);

    // Set up default behavior for analytics client
    when(() => mockAnalyticsClient.trackScreenView(any(), any()))
        .thenAnswer((_) async {});
  });

  group(
    'AnalyticsNavigatorObserver',
    () {
      group('didPush', () {
        test('tracks screen view with route name and push action', () {
          // Arrange
          final mockRoute = MockRoute();
          final mockSettings = MockRouteSettings();

          when(() => mockRoute.settings).thenReturn(mockSettings);
          when(() => mockSettings.name).thenReturn(testRouteName);

          // Act
          observer.didPush(mockRoute, null);

          // Assert
          verify(() =>
                  mockAnalyticsClient.trackScreenView(testRouteName, 'push'))
              .called(1);
        });

        test('does not track when route name is null', () {
          // Arrange
          final mockRoute = MockRoute();
          final mockSettings = MockRouteSettings();

          when(() => mockRoute.settings).thenReturn(mockSettings);
          when(() => mockSettings.name).thenReturn(null);

          // Act
          observer.didPush(mockRoute, null);

          // Assert
          verifyNever(() => mockAnalyticsClient.trackScreenView(any(), any()));
        });
      });

      group('didPop', () {
        test('tracks screen view with route name and pop action', () {
          // Arrange
          final mockRoute = MockRoute();
          final mockSettings = MockRouteSettings();

          when(() => mockRoute.settings).thenReturn(mockSettings);
          when(() => mockSettings.name).thenReturn(testRouteName);

          // Act
          observer.didPop(mockRoute, null);

          // Assert
          verify(() =>
                  mockAnalyticsClient.trackScreenView(testRouteName, 'pop'))
              .called(1);
        });
      });

      group('didReplace', () {
        test('tracks screen view with new route name and replace action', () {
          // Arrange
          final mockNewRoute = MockRoute();
          final mockSettings = MockRouteSettings();

          when(() => mockNewRoute.settings).thenReturn(mockSettings);
          when(() => mockSettings.name).thenReturn(testRouteName);

          // Act
          observer.didReplace(newRoute: mockNewRoute, oldRoute: null);

          // Assert
          verify(() =>
                  mockAnalyticsClient.trackScreenView(testRouteName, 'replace'))
              .called(1);
        });

        test('does not track when new route is null', () {
          // Act
          observer.didReplace(newRoute: null, oldRoute: null);

          // Assert
          verifyNever(() => mockAnalyticsClient.trackScreenView(any(), any()));
        });
      });
    },
  );
}
