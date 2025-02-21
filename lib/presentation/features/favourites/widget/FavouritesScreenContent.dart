
import 'package:flashcards_flutter/presentation/features/favourites/FavouritesScreenUiState.dart';
import 'package:flutter/material.dart';

import '../../breedimages/model/BreedImageItem.dart';
import '../../breedimages/widget/BreedImagesListView.dart';

class FavouritesScreenContent extends StatefulWidget {
  final FavouritesScreenUiState state;
  final Function(BreedImageItem) onFavouriteIconTap;

  const FavouritesScreenContent(this.state, this.onFavouriteIconTap, {super.key});

  @override
  State<FavouritesScreenContent> createState() =>
      FavouritesScreenContentState();
}

class FavouritesScreenContentState extends State<FavouritesScreenContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state.runtimeType) {
      case Loading:
        return Center(child: CircularProgressIndicator());
      case Content:
        return BreedImagesListView(
            context,
            (widget.state as Content).items,
                (item) => {
              widget.onFavouriteIconTap(item),
            }
        );
      case Error:
        return Center(
          child: Text("Error occurred: ${(widget.state as Error).message}"),
        );
      default:
        return Center(child: Text("Unknown state"));
    }
  }
}