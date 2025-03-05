abstract class AnalyticsClient {
  Future<void> trackScreenView(String routeName, String action);
  Future<void> identifyUser(String userId);
  Future<void> resetUser();
}
