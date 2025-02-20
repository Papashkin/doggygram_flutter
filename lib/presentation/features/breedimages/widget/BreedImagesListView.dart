import 'package:flutter/material.dart';
import '../model/BreedImageItem.dart';

Widget BreedImagesListView(
  BuildContext context,
  List<BreedImageItem> items,
  Function(BreedImageItem) onFavouriteIconTap,
) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
    ),
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ImageViewWithFavouriteIcon(
            context,
            items[index],
            onFavouriteIconTap,
          ),
        ),
      );
    },
  );
}

Widget ImageViewWithFavouriteIcon(
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
                child: Center(child: CircularProgressIndicator()),
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
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
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
