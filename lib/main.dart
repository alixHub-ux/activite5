// lib/main.dart

import 'package:flutter/material.dart';
import 'redacteur_interface.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Rédacteurs',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const RedacteursInterface(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// HomePage moved to lib/home_magazine.dart
