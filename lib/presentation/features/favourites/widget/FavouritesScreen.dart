import 'package:flashcards_flutter/presentation/features/favourites/viewmodel/FavouritesViewModel.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/FavouritesScreenContent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<StatefulWidget> createState() => FavouritesScreenState();
}

class FavouritesScreenState extends State<FavouritesScreen> {
  final FavouritesViewModel viewModel = getIt.get<FavouritesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavouritesViewModel>.value(
      value: viewModel,
      child: Consumer<FavouritesViewModel>(
        builder: (context, userViewModel, child) {
          return Scaffold(
            appBar: AppBar(title: Center(child: Text("Favourites"))),
            body: FavouritesScreenContent(
                viewModel.state,
                  (item) => { viewModel.onFavouriteItemTap(item)},
                  (filterItems) => { viewModel.onFiltersSet(filterItems)},
            ),
          );
        },
      ),
    );
  }

}
