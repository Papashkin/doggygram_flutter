import 'package:flashcards_flutter/core/presentation/image_with_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../../breedimages/model/breed_image_item.dart';

Widget breedImagesGridWithHeaders(
  BuildContext context,
  Map<String, List<BreedImageItem>> items,
  Function(String, BreedImageItem) onFavouriteIconTap,
) {
  return CustomScrollView(
    slivers:
        items.entries.map((entry) {
          return SliverStickyHeader(
            header: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 48.0,
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                entry.key,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: entry.value.length,
                (context, index) {
                  var item = entry.value[index];
                  return Padding(
                    key: ValueKey(item.imageUrl),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: imageViewWithFavouriteIcon(
                        context,
                        entry.value[index],
                        (item) => {onFavouriteIconTap(entry.key, item)},
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
  );
}
