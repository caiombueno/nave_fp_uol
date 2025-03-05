import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';

class FirebaseAnalyticsClient implements AnalyticsClient {
  const FirebaseAnalyticsClient(
    this._analytics,
  );

  final FirebaseAnalytics _analytics;

  @override
  Future<void> identifyUser(String userId) async {
    await _analytics.setUserId(id: userId);
  }

  @override
  Future<void> resetUser() async {
    await _analytics.setUserId(id: null);
  }

  @override
  Future<void> trackScreenView(String routeName, String action) async {
    await _analytics.logScreenView(
      screenName: 'screen_view',
      parameters: {
        'name': routeName,
        'action': action,
      },
    );
  }
}
