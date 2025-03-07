import 'package:flashcards_flutter/core/presentation/error_type.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/breed_images_state.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/model/breed_image_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository/data_repository.dart';

class BreedImagesCubit extends Cubit<BreedImagesState> {
  final DataRepository repository;

  static List<String> _favourites = [];

  BreedImagesCubit(this.repository) : super(Loading());

  void init(String? breedName) {
    emit(Loading());
    if (breedName != null) {
      getFavourites(breedName);
    }
  }

  void onFavouriteIconTap(BreedImageItem clickedItem) {
    if (state is! Content) return;
    final breedImageItems = (state as Content).breedImages;
    // final index = breedImageItems.indexOf(clickedItem);
    final updatedItems =
        breedImageItems.map((item) {
          if (item.imageUrl == clickedItem.imageUrl) {
            updateFavourites(clickedItem);
            final updatedItem = BreedImageItem(
              imageUrl: clickedItem.imageUrl,
              isFavourite: !clickedItem.isFavourite,
            );
            return updatedItem;
          }
          return item;
        }).toList();
    // updateFavourites(updatedItems[index]);
    emit(Content(updatedItems));
  }

  Future<void> getFavourites(String name) async {
    _favourites = await repository.getAllFavourites();
    getBreedImages(name);
  }

  Future<void> getBreedImages(String breedName) async {
    try {
      var response = await repository.getImagesByBreed(breedName);
      if (response.isSuccessful()) {
        onGetBreedImagesSuccessResult(response.message);
      } else {
        onGetBreedImagesErrorResult(response.message.first);
      }
    } catch (e) {
      onGetBreedImagesErrorResult(e.toString());
    }
  }

  void onGetBreedImagesSuccessResult(List<String> data) {
    final breedImageItems =
        data
            .map(
              (item) => BreedImageItem(
                imageUrl: item,
                isFavourite: _favourites.contains(item),
              ),
            )
            .toList();
    emit(Content(breedImageItems));
  }

  void onGetBreedImagesErrorResult(String? error) {
    emit(Error(error ?? 'Failed to load breed images', ErrorType.unknown));
  }

  void updateFavourites(BreedImageItem item) {
    if (item.isFavourite) {
      repository.removeFromFavourite(item.imageUrl);
    } else {
      repository.addToFavourite(item.imageUrl);
    }
  }
}
