import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/core/RoutePaths.dart';

class BottomNavigationView extends StatelessWidget {
  final Widget child;

  const BottomNavigationView({required this.child});

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
                ],
              )
              : null,
    );
  }

  bool _isBottomNavBarVisible(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return location == RoutePaths.Home || location == RoutePaths.Favourites;
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case RoutePaths.Home:
        return 0;
      case RoutePaths.Favourites:
        return 1;
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
      default:
        return RoutePaths.Home;
    }
  }
}
