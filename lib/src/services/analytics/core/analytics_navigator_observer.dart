import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';
import 'dart:developer';

class AnalyticsNavigatorObserver extends AutoRouterObserver {
  AnalyticsNavigatorObserver(
    this._analyticsClient,
  );

  final AnalyticsClient _analyticsClient;

  static const _name = 'Navigation';

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'pop');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) {
      _logNavigation(newRoute.settings.name, 'replace');
    }
  }

  void _logNavigation(String? routeName, String action) {
    if (routeName != null) {
      _analyticsClient.trackScreenView(routeName, action);
    } else {
      log('Route name is missing', name: _name);
    }
  }
}
