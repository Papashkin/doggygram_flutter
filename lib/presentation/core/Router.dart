import 'package:flashcards_flutter/presentation/features/breedimages/widget/BreedImagesScreen.dart';
import 'package:flashcards_flutter/presentation/features/home/widget/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'RoutePaths.dart';

final mainRouter = GoRouter(
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
  ],
);
