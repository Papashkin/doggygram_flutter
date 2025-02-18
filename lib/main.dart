import 'package:flashcards_flutter/core/ui/di/locator.dart';
import 'package:flashcards_flutter/core/ui/home/widget/HomeView.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoggyGram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeView(),
    );
  }
}
