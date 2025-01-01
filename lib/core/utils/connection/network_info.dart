import 'package:connectivity_plus/connectivity_plus.dart';

mixin NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl with NetworkInfo {
  NetworkInfoImpl();

  @override
  Future<bool> isConnected() async {
    final connectivity = await Connectivity().checkConnectivity();

    return connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi);
  }
}
