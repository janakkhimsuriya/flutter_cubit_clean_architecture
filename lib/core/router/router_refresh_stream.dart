import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RouterRefreshStream<T> extends ChangeNotifier {
  RouterRefreshStream(Stream<T> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  final _log = Logger('RouterRefreshStream');

  late final StreamSubscription<T> _subscription;

  @override
  void dispose() {
    try {
      _subscription.cancel();
    } catch (e) {
      _log.severe('Error disposing RouterRefreshStream: $e');
    }
    super.dispose();
  }
}
