import 'package:flutter/material.dart';

import 'locator.dart';
import 'ui/home.dart';

void main() {
  initLocator();

  runApp(BiometricAuthDemo());
}

class BiometricAuthDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Auth App',
      home: HomeView(),
    );
  }
}
