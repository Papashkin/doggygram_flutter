import 'package:flashcards_flutter/presentation/features/breedimages/model/BreedImageModel.dart';
import 'package:flutter/material.dart';

Widget BreedImagesListView(BuildContext context, List<BreedImageModel> data) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
    ),
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    itemCount: data.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            data[index].imageUrl,
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
            // errorBuilder:
            //     (context, error, stackTrace) =>
            //         Icon(Icons.error, size: 50, color: Colors.red),
          ),
        ),
      );
    },
  );
}
