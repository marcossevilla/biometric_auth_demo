/* 
  This is the service locator for the app,
  for dependency injection, you manage your
  services right here
*/

import 'package:get_it/get_it.dart';

import 'services/local_auth_service.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton(() => LocalAuthenticationService());
}
