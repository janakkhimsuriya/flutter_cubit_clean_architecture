import 'dart:async';

import 'package:flutter/widgets.dart';

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(Stream<dynamic> stream) : _stream = stream {
    _subscription = _stream.listen((_) {
      notifyListeners();
    });
  }

  final Stream<dynamic> _stream;
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
