import 'dart:async';

import 'package:flutter/foundation.dart';

class AppRouterRefreshListenable extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  AppRouterRefreshListenable(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
