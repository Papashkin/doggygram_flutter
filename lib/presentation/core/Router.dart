import 'package:flashcards_flutter/presentation/features/home/widget/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'RoutePaths.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final path = settings.name;
    switch (path) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
