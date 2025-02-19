import 'package:flashcards_flutter/core/ui/core/RoutePaths.dart';
import 'package:flashcards_flutter/core/ui/home/widget/HomeView.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final path = settings.name;
    switch (path) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
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
