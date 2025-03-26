import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nave_fp_uol/env/env.dart';
import 'package:nave_fp_uol/firebase_options.dart';
import 'package:nave_fp_uol/service_locator.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/field_value_mapper.dart';

import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';
import 'package:nave_fp_uol/src/services/analytics/core/analytics_navigator_observer.dart';
import 'package:nave_fp_uol/src/ui/features/router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _initDartMappable();

  initializeTimeZones();

  await loadServiceLocator();

  await _initSentry();

  runApp(
    SentryWidget(
      child: const MyApp(),
    ),
  );
}

void _initDartMappable() {
  MapperContainer.globals.use(
    FieldValueMapper(),
  );
}

Future<void> _initSentry() => SentryFlutter.init(
      (options) {
        options.dsn = Env.sentryDsn;
        options.environment = 'stg';
        // Improve stack traces in the dashboard
        options
          ..considerInAppFramesByDefault = false
          ..addInAppInclude('nave');
        options.beforeSend = (SentryEvent event, Hint hint) async {
          // Ignore events that are not from release builds
          if (!kReleaseMode) {
            return null;
          }
          // For all other events, return the event as is
          return event;
        };
      },
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: sl<AppRouter>().config(
        includePrefixMatches: true,
        navigatorObservers: () => [
          SentryNavigatorObserver(),
          AnalyticsNavigatorObserver(
            sl<AnalyticsClient>(),
          ),
        ],
      ),
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        FlutterQuillLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
