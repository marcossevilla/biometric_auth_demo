import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/local_auth_providers.dart';

/// Entry point page for the app
class HomePage extends StatelessWidget {
  /// Static named route for page
  static const String route = 'Home';

  /// Static method to return the widget as a PageRoute
  static Route go() => MaterialPageRoute<void>(builder: (_) => HomePage());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _AuthenticationState(),
            const SizedBox(height: 20),
            const _BiometricMethods(),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: const Text('Log me in'),
              onPressed: () => context.read(authenticateUser),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthenticationState extends ConsumerWidget {
  const _AuthenticationState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isAuthenticated = watch(isAuthenticatedProvider);

    return Text(
      '${isAuthenticated.state}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _BiometricMethods extends ConsumerWidget {
  const _BiometricMethods({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(biometricMethodsProvider).when(
      data: (List<BiometricType> data) => Text(
        '$data',
        style: Theme.of(context).textTheme.headline4,
      ),
      loading: () => const LinearProgressIndicator(),
      error: (error, _) => Text(error.toString()),
    );
  }
}
