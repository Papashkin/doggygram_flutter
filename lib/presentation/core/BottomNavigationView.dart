import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'RoutePaths.dart';

class BottomNavigationView extends StatelessWidget {
  final Widget child;

  const BottomNavigationView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar:
          _isBottomNavBarVisible(context)
              ? BottomNavigationBar(
                currentIndex: _getSelectedIndex(context),
                onTap: (index) {
                  final path = _getRouteForIndex(index);
                  context.go(path);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favourites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info_outline),
                    label: 'About',
                  ),
                ],
              )
              : null,
    );
  }

  bool _isBottomNavBarVisible(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return allFromBottomNav.contains(location);
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case RoutePaths.Home:
        return 0;
      case RoutePaths.Favourites:
        return 1;
      case RoutePaths.About:
        return 2;
      default:
        return 0;
    }
  }

  String _getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return RoutePaths.Home;
      case 1:
        return RoutePaths.Favourites;
      case 2:
        return RoutePaths.About;
      default:
        return RoutePaths.Home;
    }
  }

  List<String> get allFromBottomNav => [
    RoutePaths.Home,
    RoutePaths.Favourites,
    RoutePaths.About,
  ];
}
