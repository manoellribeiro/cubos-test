import 'package:connectivity/connectivity.dart';
import 'package:cubos_test/app/core/network/network_info.dart';

class NetworkInfoImplementation implements NetworkInfo {
  
  final Connectivity connectivity;

  NetworkInfoImplementation({
    this.connectivity
    });

  @override
  Future<bool> get isConnected async {
    var connectivityResult =  await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

}