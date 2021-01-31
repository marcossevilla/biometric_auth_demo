import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/home.dart';

void main() {
  runApp(ProviderScope(child: BiometricAuthDemo()));
}

/// Starting point of the app
class BiometricAuthDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Auth App',
      home: HomePage(),
    );
  }
}
