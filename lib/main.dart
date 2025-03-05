import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nave_fp_uol/env/env.dart';
import 'package:nave_fp_uol/firebase_options.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/field_value_mapper.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:timezone/data/latest_all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _initDartMappable();

  initializeTimeZones();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _initSentry();

  runApp(const MainApp()
      // SentryWidget(
      //   child: const MainApp(),
      // ),
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
