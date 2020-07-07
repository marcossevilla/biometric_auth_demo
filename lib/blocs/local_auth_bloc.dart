/*
  This can be any BLoC that consumes the
  LocalAuthService
*/

import 'package:flutter/material.dart';

import '../locator.dart';
import '../services/local_auth_service.dart';

class LocalAuthBloc with ChangeNotifier {
  LocalAuthBloc() {
    getAvailableMethods();
  }

  // using our service
  final _localAuth = locator<LocalAuthenticationService>();

  // handle auth state
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  // just for the example, show all the available methods
  List _availableMethods = [];
  List get availableMethods => _availableMethods;

  // our methods that consume the service
  void getAvailableMethods() async {
    _availableMethods = await _localAuth.getAvailableMethods();
    notifyListeners();
  }

  void authenticate() async {
    _isAuthenticated = await _localAuth.authenticate();
    notifyListeners();
  }
}
