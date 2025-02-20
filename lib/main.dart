import 'package:flashcards_flutter/presentation/core/Router.dart';
import 'package:flutter/material.dart';

import 'core/di/locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DoggyGram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      routerConfig: mainRouter,
    );
  }
}
