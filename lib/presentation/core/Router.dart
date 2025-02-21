import 'package:flashcards_flutter/presentation/features/breedimages/widget/BreedImagesScreen.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/FavouritesScreen.dart';
import 'package:flashcards_flutter/presentation/features/home/widget/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/BottomNavigationView.dart';
import 'RoutePaths.dart';

final mainRouter = GoRouter(
  initialLocation: RoutePaths.Home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavigationView(child: child);
      },
      routes: [
        GoRoute(
          path: RoutePaths.Home,
          builder: (context, state) => HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: RoutePaths.BreedImages,
              builder:
                  (BuildContext context, GoRouterState state) =>
                      BreedImagesScreen(state.pathParameters['breedName']),
            ),
          ],
        ),
        GoRoute(
          path: RoutePaths.Favourites,
          builder: (context, state) => FavouritesScreen(),
        ),
      ],
    ),
  ],
);
