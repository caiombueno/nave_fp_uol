import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/widgets.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';

class LoggerAnalyticsClient implements AnalyticsClient {
  const LoggerAnalyticsClient();

  static const _name = 'Event';

  @visibleForTesting
  void log(String message, {String? name}) {
    dev.log('$name: $message');
  }

  @override
  Future<void> trackScreenView(String routeName, String action) async {
    log('trackScreenView($routeName, $action)', name: 'Navigation');
  }

  @override
  Future<void> identifyUser(String userId) async {
    log('identifyUser($userId)', name: _name);
  }

  @override
  Future<void> resetUser() async {
    log('resetUser', name: _name);
  }
}
