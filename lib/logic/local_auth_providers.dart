import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

export 'package:local_auth/local_auth.dart' show BiometricType;

part 'local_auth_service.dart';

/// Provider to handle biometric authentication
final _localAuthProvider = Provider<LocalAuthenticationService>(
  (_) => LocalAuthenticationService(auth: LocalAuthentication()),
);

/// StateProvider that manages if user is authenticated via biometrics
final isAuthenticatedProvider = StateProvider<bool>((_) => false);

/// FutureProvider that modifies the isAuthenticatedProvider's state
final authenticateUser = FutureProvider<void>(
  (ref) async {
    final authResult = await ref.read(_localAuthProvider).authenticate();
    ref.read(isAuthenticatedProvider).state = authResult;
  },
);

/// FutureProvider that returns the list of methods
/// the device supports for biometric authentication
final biometricMethodsProvider = FutureProvider<List<BiometricType>>(
  (ref) async {
    final methods = await ref.read(_localAuthProvider).getAvailableMethods();
    return methods;
  },
);
