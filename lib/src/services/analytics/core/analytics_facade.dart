import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';

// https://refactoring.guru/design-patterns/facade
class AnalyticsFacade implements AnalyticsClient {
  const AnalyticsFacade(this._clients);

  final List<AnalyticsClient> _clients;

  @override
  Future<void> trackScreenView(
    String routeName,
    String action,
  ) =>
      _dispatch(
        (c) => c.trackScreenView(
          routeName,
          action,
        ),
      );

  @override
  Future<void> identifyUser(String userId) => _dispatch(
        (c) => c.identifyUser(
          userId,
        ),
      );

  @override
  Future<void> resetUser() => _dispatch(
        (c) => c.resetUser(),
      );

  Future<void> _dispatch(
    Future<void> Function(AnalyticsClient client) work,
  ) async {
    for (var client in _clients) {
      await work(client);
    }
  }
}
