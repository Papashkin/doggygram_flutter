import 'package:flashcards_flutter/core/presentation/error_view.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/breed_image_grid_with_headers.dart';
import 'package:flashcards_flutter/presentation/features/favourites/widget/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../breedimages/model/breed_image_item.dart';

Widget favouritesScreenContent(
  BuildContext context,
  Map<String, List<BreedImageItem>> items,
  List<FilterItem> filters,
  Function(String, BreedImageItem) onFavouriteIconTap,
  Function(List<FilterItem>) onFiltersSet,
) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child:
            filters.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                  width: double.infinity,
                  child: FilterBottomSheet(
                    filters,
                    (filter) => {onFiltersSet(filter)},
                  ),
                ),
      ),
      Expanded(
        child:
            items.isEmpty
                ? Center(child: ErrorView("There is no items"))
                : breedImagesGridWithHeaders(
                  context,
                  items,
                  (breed, item) => {onFavouriteIconTap(breed, item)},
                ),
      ),
    ],
  );
}
