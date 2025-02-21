import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';

import '../../../../data/repository/DataRepository.dart';
import '../BreedImagesUiState.dart';
import '../model/BreedImageItem.dart';

class BreedImagesViewModel extends BaseViewModel {
  final DataRepository repository;

  BreedImagesViewModel(this.repository);

  static BreedImagesUiState _state = Loading();
  static List<String> _favourites = [];

  BreedImagesUiState get state => _state;

  void init(String? breedName) {
    getFavourites();
    if (breedName != null) {
      getBreedImages(breedName);
    }
  }

  Future<void> getBreedImages(String breedName) async {
    updateStateWithNotification(action: () => {_state = Loading()});
    try {
      var response = await repository.getImagesByBreed(breedName);
      if (response.isSuccessful()) {
        onGetBreedImagesSuccessResult(response.message);
      } else {
        onGetBreedImagesErrorResult(response.message.first);
      }
    } catch (e) {
      onGetBreedImagesErrorResult(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void onFavouriteIconTap(BreedImageItem item) {
    final breedImageItems = (_state as Content).breedImages;
    final index = breedImageItems.indexOf(item);
    breedImageItems[index] = BreedImageItem(
      imageUrl: item.imageUrl,
      isFavourite: !item.isFavourite,
    );
    updateFavourites(breedImageItems[index]);
    _state = Content(breedImageItems);
    notifyListeners();
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
    _state = Content(breedImageItems);
  }

  void onGetBreedImagesErrorResult(String? error) {
    _state = Error(error ?? 'Failed to load breed images');
  }

  void updateFavourites(BreedImageItem item) {
    if (item.isFavourite) {
      repository.addToFavourite(item.imageUrl);
    } else {
      repository.removeFromFavourite(item.imageUrl);
    }
  }

  Future<void> getFavourites() async {
    _favourites = await repository.getAllFavourites();
  }
}
