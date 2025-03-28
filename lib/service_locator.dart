import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/auth_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/cdn_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/firestore_client.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/synced_data_source.dart';
import 'package:nave_fp_uol/src/data/repositories/file_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';
import 'package:nave_fp_uol/src/services/analytics/core/analytics_facade.dart';
import 'package:nave_fp_uol/src/services/analytics/core/firebase_analytics_client.dart';
import 'package:nave_fp_uol/src/services/analytics/core/logger_analytics_client.dart';
import 'package:nave_fp_uol/src/services/analytics/core/mixpanel_analytics_client.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/router.dart';
import 'package:nave_fp_uol/src/utils/params/chewie_controller_params.dart';

import 'package:video_player/video_player.dart';

import 'env/env.dart';

final sl = GetIt.instance;

Future<void> loadServiceLocator() async {
  // The order of the below function calls is important, e.g., you can't
  // register the repositories before registering the data sources.
  sl.registerSingleton<AppRouter>(
    AppRouter(),
  );

  await _registerServices();
  _registerClients();
  _registerDataSources();
  _registerRepositories();
  _registerControllers();
}

Future<void> _registerServices() async {
  final mixpanel = await Mixpanel.init(
    Env.mixpanelProjectToken,
    trackAutomaticEvents: true,
  );

  sl.registerSingleton<AnalyticsClient>(
    AnalyticsFacade(
      [
        if (!kReleaseMode) LoggerAnalyticsClient(),
        MixpanelAnalyticsClient(
          mixpanel,
        ),
        FirebaseAnalyticsClient(
          FirebaseAnalytics.instance,
        ),
      ],
    ),
  );

  sl.registerSingleton<ErrorReporter>(
    ErrorReporter(),
  );
}

void _registerClients() {
  sl.registerSingleton<FirestoreClient>(
    FirestoreClient(
      FirebaseFirestore.instance,
    ),
  );
}

void _registerDataSources() {
  sl.registerSingleton<SyncedDataSource>(
    SyncedDataSource(
      sl<FirestoreClient>(),
    ),
  );

  sl.registerSingleton<AuthDataSource>(
    AuthDataSource(
      FirebaseAuth.instance,
    ),
  );

  sl.registerSingleton<CdnDataSource>(
    CdnDataSource(
      FirebaseFunctions.instance,
    ),
  );
}

void _registerRepositories() {
  sl.registerSingleton<UserRepository>(
    UserRepository(
      sl<AuthDataSource>(),
    ),
  );

  sl.registerSingleton<TaskRepository>(
    TaskRepository(
      syncedDataSource: sl<SyncedDataSource>(),
      authDataSource: sl<AuthDataSource>(),
    ),
  );

  sl.registerSingleton<FileRepository>(
    FileRepository(
      sl<CdnDataSource>(),
    ),
  );
}

void _registerControllers() {
  sl.registerFactoryParam<VideoPlayerController, String, void>(
    (url, _) => VideoPlayerController.networkUrl(Uri.parse(url)),
  );

  sl.registerFactoryParam<ChewieController, ChewieControllerParams, void>(
    (params, _) => ChewieController(
      videoPlayerController: params.videoPlayerController,
      aspectRatio: params.aspectRatio,
      maxScale: params.maxScale,
      allowedScreenSleep: params.allowedScreenSleep,
      autoInitialize: params.autoInitialize,
      deviceOrientationsOnEnterFullScreen:
          params.deviceOrientationsOnEnterFullScreen,
      deviceOrientationsAfterFullScreen:
          params.deviceOrientationsAfterFullScreen,
      materialProgressColors: params.materialProgressColors,
    ),
  );
}
