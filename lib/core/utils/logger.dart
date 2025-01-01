import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void initLogger({
  bool writeLog = !kReleaseMode,
  bool togglePrintMode = false,
}) {
  if (!writeLog) {
    Logger.root.level = Level.OFF;
  } else {
    if (togglePrintMode) {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen(
        (event) {
          // ignore: avoid_print
          print('[${event.loggerName}] ${event.message} ${event.error ?? ""}');
        },
      );
    } else {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen(
        (event) {
          log(
            event.message,
            time: event.time,
            sequenceNumber: event.sequenceNumber,
            level: event.level.value,
            name: event.loggerName,
            zone: event.zone,
            error: event.error,
            stackTrace: event.stackTrace,
          );
        },
      );
    }
  }
}
