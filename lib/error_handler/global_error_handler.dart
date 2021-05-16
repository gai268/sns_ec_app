import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class GlobalErrorHandler {
  final log = Logger("GlobalErrorHandler");

  void onError({FlutterErrorDetails details, Object error, StackTrace stack}) {
    if (details != null) {
      log.severe(details.exceptionAsString(), details.stack);
    } else {
      log.severe(error.toString(), stack);
    }
  }
}
