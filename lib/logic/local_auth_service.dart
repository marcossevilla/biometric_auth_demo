part of 'local_auth_providers.dart';

/// Defines the methods to use for biometric authentication
class LocalAuthenticationService {
  /// Service to interact with local_auth package
  LocalAuthenticationService({
    @required LocalAuthentication auth,
  })  : _auth = auth,
        assert(auth != null);

  final LocalAuthentication _auth;

  /// Returns if device supports biometric authentication
  Future<bool> checkBiometrics() async => await _auth.canCheckBiometrics;

  /// Returns the available ways to biometric authorize
  Future<List<BiometricType>> getAvailableMethods() async {
    return await _auth.getAvailableBiometrics();
  }

  /// Returns wether the biometric authentication succeeds or fails
  Future<bool> authenticate() async {
    try {
      final isAuthenticated = await _auth.authenticateWithBiometrics(
        // you can setup a localized string instead of this placeholder one
        localizedReason: 'I need your data',
        useErrorDialogs: true,
        stickyAuth: true,
      );

      return isAuthenticated;
    } on PlatformException catch (e) {
      return _handleError(e.toString());
    } catch (e) {
      return _handleError(e);
    }
  }

  bool _handleError(String errorMessage) {
    debugPrint(errorMessage.toString());
    return false;
  }
}
