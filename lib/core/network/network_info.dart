import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return 'Mobile network available.';
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return 'Wi-Fi is available.';
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return 'Ethernet connection available.';
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return 'Vpn connection active.';
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      return 'Bluetooth connection available.';
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return 'Connected to a network which is not in the above mentioned networks.';
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return 'No available network types.';
    }

    return 'Unknown connectivity status.';
  }
}
