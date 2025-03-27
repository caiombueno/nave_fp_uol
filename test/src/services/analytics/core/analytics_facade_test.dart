import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/services/analytics/core/analytics_facade.dart';

import '../../../../mocks.dart';

void main() {
  late AnalyticsFacade analyticsFacade;
  late MockAnalyticsClient mockClient1;
  late MockAnalyticsClient mockClient2;

  const testUserId = 'user-123';
  const testRouteName = 'home_screen';
  const testAction = 'view';

  setUp(() {
    mockClient1 = MockAnalyticsClient();
    mockClient2 = MockAnalyticsClient();

    analyticsFacade = AnalyticsFacade([mockClient1, mockClient2]);

    // Set up default behavior for mock clients
    when(() => mockClient1.trackScreenView(any(), any()))
        .thenAnswer((_) async {});
    when(() => mockClient2.trackScreenView(any(), any()))
        .thenAnswer((_) async {});
    when(() => mockClient1.identifyUser(any())).thenAnswer((_) async {});
    when(() => mockClient2.identifyUser(any())).thenAnswer((_) async {});
    when(() => mockClient1.resetUser()).thenAnswer((_) async {});
    when(() => mockClient2.resetUser()).thenAnswer((_) async {});
  });

  group(
    'AnalyticsFacade',
    () {
      group('trackScreenView', () {
        test('dispatches to all clients', () async {
          // Act
          await analyticsFacade.trackScreenView(testRouteName, testAction);

          // Assert
          verify(() => mockClient1.trackScreenView(testRouteName, testAction))
              .called(1);
          verify(() => mockClient2.trackScreenView(testRouteName, testAction))
              .called(1);
        });

        test('continues execution if one client fails', () async {
          // Arrange
          when(() => mockClient1.trackScreenView(any(), any()))
              .thenThrow(Exception('Analytics failure'));

          // Act
          await expectLater(
            () => analyticsFacade.trackScreenView(testRouteName, testAction),
            throwsException,
          );

          // Assert - verify that the first client was called
          verify(() => mockClient1.trackScreenView(testRouteName, testAction))
              .called(1);
          // The second client shouldn't be called since the first one failed
          verifyNever(() => mockClient2.trackScreenView(any(), any()));
        });
      });

      group('identifyUser', () {
        test('dispatches to all clients', () async {
          // Act
          await analyticsFacade.identifyUser(testUserId);

          // Assert
          verify(() => mockClient1.identifyUser(testUserId)).called(1);
          verify(() => mockClient2.identifyUser(testUserId)).called(1);
        });
      });

      group('resetUser', () {
        test('dispatches to all clients', () async {
          // Act
          await analyticsFacade.resetUser();

          // Assert
          verify(() => mockClient1.resetUser()).called(1);
          verify(() => mockClient2.resetUser()).called(1);
        });
      });

      test('handles empty client list', () async {
        // Arrange
        final emptyFacade = AnalyticsFacade([]);

        // Act & Assert - should not throw
        await emptyFacade.trackScreenView(testRouteName, testAction);
        await emptyFacade.identifyUser(testUserId);
        await emptyFacade.resetUser();
      });
    },
  );
}
