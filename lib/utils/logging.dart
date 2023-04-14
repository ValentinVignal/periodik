import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void setLogger() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.SEVERE;
  Logger.root.onRecord.listen((event) {
    // use `dumpErrorToConsole` for severe messages to ensure that severe
    // exceptions are formatted consistently with other Flutter examples and
    // avoids printing duplicate exceptions
    if (event.level >= Level.SEVERE) {
      final Object? error = event.error;
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(
          exception: error is Exception ? error : Exception(error),
          stack: event.stackTrace,
          library: event.loggerName,
          context: ErrorDescription(event.message),
        ),
      );
    } else {
      developer.log(
        event.message,
        time: event.time,
        sequenceNumber: event.sequenceNumber,
        level: event.level.value,
        name: event.loggerName,
        zone: event.zone,
        error: event.error,
        stackTrace: event.stackTrace,
      );
    }
  });
}
