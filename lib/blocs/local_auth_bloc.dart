/*
  This can be any BLoC that consumes the
  LocalAuthService
*/

import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/local_auth_service.dart';

class LocalAuthBloc with ChangeNotifier {
  LocalAuthBloc() {
    checkBiometricSupport();
  }

  // using our service
  final _localAuth = locator<LocalAuthenticationService>();

  // checks if auth is supported
  bool _supportsBiometricAuth = false;
  bool get supportsBiometricAuth => _supportsBiometricAuth;

  // handle auth state
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  // just for the example, show all the available methods
  List _availableMethods = [];
  List get availableMethods => _availableMethods;

  // our methods that consume the service
  Future<void> checkBiometricSupport() async {
    _supportsBiometricAuth = await _localAuth.checkBiometrics();
    notifyListeners();

    // this is an extra just to show available method, you can omit it
    if (_supportsBiometricAuth) getAvailableMethods();
  }

  Future<void> getAvailableMethods() async {
    _availableMethods = await _localAuth.getAvailableMethods();
    notifyListeners();
  }

  Future<void> authenticate() async {
    _isAuthenticated = await _localAuth.authenticate();
    notifyListeners();
  }
}
