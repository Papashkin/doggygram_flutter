import 'package:flashcards_flutter/presentation/features/breedimages/widget/breed_images_grid.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../breedimages/model/breed_image_item.dart';

class FavouritesScreenContent extends StatelessWidget {
  final List<BreedImageItem> items;
  final List<FilterItem> filters;
  final Function(BreedImageItem) onFavouriteIconTap;
  final Function(List<FilterItem>) onFiltersSet;

  const FavouritesScreenContent(
    this.items,
    this.filters,
    this.onFavouriteIconTap,
    this.onFiltersSet, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child:
              filters.isEmpty
                  ? null
                  : SizedBox(
                    width: double.infinity,
                    child: FilterBottomSheet(
                      filters,
                      (filter) => {onFiltersSet(filter)},
                    ),
                  ),
        ),
        Expanded(
          child: breedImagesGrid(
            context,
            items,
            (item) => {onFavouriteIconTap(item)},
          ),
        ),
      ],
    );
  }
}
