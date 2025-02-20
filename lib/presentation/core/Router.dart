import 'package:flutter/material.dart';
import '../features/home/widget/HomeView.dart';
import 'RoutePaths.dart';

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
