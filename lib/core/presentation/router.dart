import 'package:flashcards_flutter/core/presentation/bottom_navigation_view.dart';
import 'package:flashcards_flutter/core/presentation/route_paths.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/widget/breed_images_screen.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/favourites_screen.dart';
import 'package:flashcards_flutter/presentation/features/home/widget/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/about/widget/about_screen.dart';

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
        GoRoute(
          path: RoutePaths.About,
          builder: (context, state) => AboutScreen(),
        ),
      ],
    ),
  ],
);
