import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ErrorReporter {
  const ErrorReporter();

  @visibleForTesting
  Future<void> captureException(
    Object exception, {
    StackTrace? stackTrace,
  }) async =>
      Sentry.captureException(exception, stackTrace: stackTrace);

  Future<void> reportFailure(Failure failure) async {
    if (failure is UnknownFailure) {
      await reportException(
        failure.underlyingException,
        failure.underlyingStackTrace,
      );
    }
  }

  Future<void> reportException(
    Object exception,
    StackTrace? stackTrace,
  ) async {
    await captureException(
      exception,
      stackTrace: stackTrace,
    );

    if (!kReleaseMode) {
      log(
        exception.toString(),
        name: 'Exception',
        error: exception,
        stackTrace: stackTrace,
      );
    }
  }
}
