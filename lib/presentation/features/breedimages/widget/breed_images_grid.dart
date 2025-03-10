import 'package:flashcards_flutter/core/presentation/image_with_favourite_icon.dart';
import 'package:flutter/material.dart';

import '../model/breed_image_item.dart';

Widget breedImagesGrid(
  BuildContext context,
  List<BreedImageItem> items,
  Function(BreedImageItem) onFavouriteIconTap,
) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
    ),
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Padding(
        key: ValueKey(items[index].imageUrl),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: imageViewWithFavouriteIcon(
            context,
            items[index],
            onFavouriteIconTap,
          ),
        ),
      );
    },
  );
}

