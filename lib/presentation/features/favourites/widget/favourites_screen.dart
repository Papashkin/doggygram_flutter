import 'package:flashcards_flutter/core/presentation/constant_components.dart';
import 'package:flashcards_flutter/presentation/features/favourites/cubit/favourites_cubit.dart';
import 'package:flashcards_flutter/presentation/features/favourites/favourites_state.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/favourites_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/presentation/error_view.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouritesScreen> {
  final FavouritesCubit _cubit = getIt.get<FavouritesCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("favourites"))),
      body: Center(
        child: BlocBuilder<FavouritesCubit, FavouritesState>(
          bloc: _cubit,
          builder: (context, state) {
            switch (state) {
              case Loading():
                return loadingView;
              case Content():
                return FavouritesScreenContent(
                  state.items,
                  state.filters,
                  (item) => _cubit.onFavouriteItemTap(item),
                  (filterItems) => _cubit.onFiltersSet(filterItems),
                );
              case Error():
                return ErrorView(state.type);
            }
          },
        ),
      ),
    );
  }
}

