import 'package:flashcards_flutter/presentation/core/Router.dart' as router;
import 'package:flutter/material.dart';
import 'presentation/core/RoutePaths.dart';
import 'presentation/features/home/widget/HomeScreen.dart';
import 'core/di/locator.dart';

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
      home: const HomeScreen(),
      initialRoute: RoutePaths.Home,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
