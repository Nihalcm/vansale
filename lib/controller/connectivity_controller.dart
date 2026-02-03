import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetConnectionController extends GetxController {
  var isConnected = true.obs;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen((_) async {
      isConnected.value = await hasNetworkAccess();
    });
    super.onInit();
  }

  Future<void> _checkInitialConnection() async {
    isConnected.value = await hasNetworkAccess();
  }

  Future<bool> hasNetworkAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
