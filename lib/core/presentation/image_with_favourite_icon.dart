import 'package:flashcards_flutter/presentation/features/breedimages/model/breed_image_item.dart';
import 'package:flutter/material.dart';

Widget imageViewWithFavouriteIcon(
  BuildContext context,
  BreedImageItem item,
  Function(BreedImageItem) onFavouriteIconTap,
) {
  return InkWell(
    onTap: () => {onFavouriteIconTap(item)},
    child: Stack(
      fit: StackFit.passthrough,
      children: [
        Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Container(
                color: Colors.grey[100],
                child: const Center(child: CircularProgressIndicator()),
              );
            }
          },
          errorBuilder:
              (context, error, stackTrace) =>
                  Icon(Icons.error, size: 50, color: Colors.red[300]),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              key: ValueKey(item.imageUrl.hashCode),
              item.isFavourite ? Icons.favorite : Icons.favorite_outline,
              color: item.isFavourite ? Colors.red : Colors.grey,
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
