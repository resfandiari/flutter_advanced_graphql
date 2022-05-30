import 'package:connectivity/connectivity.dart';

class InternetConnectionService {
  static Future<bool> get isConnected async {
    final ConnectivityResult connectionType =
        await Connectivity().checkConnectivity();
    return connectionType != ConnectivityResult.none;
  }
}
