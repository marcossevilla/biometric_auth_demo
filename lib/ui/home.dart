import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../blocs/local_auth_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocalAuthBloc(),
      child: Scaffold(
        body: Consumer<LocalAuthBloc>(
          builder: (context, bloc, _) {
            if (bloc.supportsBiometricAuth) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                    child: Text('Authenticate'),
                    onPressed: bloc.authenticate,
                  ),
                  Text(
                    '${bloc.isAuthenticated}',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${bloc.availableMethods}',
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Device doesn\'t support biometric auth'),
              );
            }
          },
        ),
      ),
    );
  }
}
