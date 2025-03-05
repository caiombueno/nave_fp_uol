import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';

class MixpanelAnalyticsClient implements AnalyticsClient {
  const MixpanelAnalyticsClient(this._mixpanel);

  final Mixpanel _mixpanel;

  @override
  Future<void> identifyUser(String userId) async {
    await _mixpanel.identify(userId);
  }

  @override
  Future<void> resetUser() async {
    await _mixpanel.reset();
  }

  @override
  Future<void> trackScreenView(String routeName, String action) async {
    await _mixpanel.track(
      'Screen View',
      properties: {
        'name': routeName,
        'action': action,
      },
    );
  }
}
