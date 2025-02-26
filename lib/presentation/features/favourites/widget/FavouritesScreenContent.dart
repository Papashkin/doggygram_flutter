import 'package:flashcards_flutter/presentation/features/favourites/FavouritesScreenUiState.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/FilterItem.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/FilterBottomSheetView.dart';
import 'package:flutter/material.dart';

import '../../breedimages/model/BreedImageItem.dart';
import '../../breedimages/widget/BreedImagesListView.dart';

class FavouritesScreenContent extends StatefulWidget {
  final FavouritesScreenUiState state;
  final Function(BreedImageItem) onFavouriteIconTap;
  final Function(List<FilterItem>) onFiltersSet;

  const FavouritesScreenContent(
    this.state,
    this.onFavouriteIconTap,
    this.onFiltersSet, {
    super.key,
  });

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
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child:
                  (widget.state as Content).filters.isEmpty
                      ? null
                      : SizedBox(
                        width: double.infinity,
                        child: FilterBottomSheetView(
                          (widget.state as Content).filters,
                          (filter) => {widget.onFiltersSet(filter)},
                        ),
                      ),
            ),
            Expanded(
              child: BreedImagesListView(
                context,
                (widget.state as Content).items,
                (item) => {widget.onFavouriteIconTap(item)},
              ),
            ),
          ],
        );
      case Error:
        return Center(
          child: Text("Error occurred:\n${(widget.state as Error).message}"),
        );
      default:
        return Center(child: Text("Unknown state"));
    }
  }
}
