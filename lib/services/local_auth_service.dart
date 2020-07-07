import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService {
  final _auth = LocalAuthentication();

  bool _isAuthenticated = false;

  Future<bool> checkBiometrics() async => await _auth.canCheckBiometrics;

  Future getAvailableMethods() async {
    return await _auth.getAvailableBiometrics();
  }

  Future<bool> authenticate() async {
    try {
      _isAuthenticated = await _auth.authenticateWithBiometrics(
        // you can setup a localized string instead of this placeholder one
        localizedReason: 'I need your data',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      return _isAuthenticated;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
