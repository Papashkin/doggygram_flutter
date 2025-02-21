import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';
import 'package:flashcards_flutter/data/repository/DataRepository.dart';
import 'package:flashcards_flutter/presentation/features/favourites/FavouritesScreenUiState.dart';

import '../../breedimages/model/BreedImageItem.dart';

class FavouritesViewModel extends BaseViewModel {
  final DataRepository repository;

  FavouritesViewModel(this.repository);

  static FavouritesScreenUiState _state = Loading();

  void init() {
    getFavourites();
  }

  FavouritesScreenUiState get state => _state;

  onFavouriteItemTap(BreedImageItem item) {
    final breedImageItems = (_state as Content).items;
    final index = breedImageItems.indexOf(item);

    updateFavourites(breedImageItems[index]);
    breedImageItems[index] = BreedImageItem(
      imageUrl: item.imageUrl,
      isFavourite: !item.isFavourite,
    );
    _state = Content(breedImageItems);
    notifyListeners();
  }

  Future<void> getFavourites() async {
    final data = await repository.getAllFavourites();
    final favourites =
        data
            .map((url) => BreedImageItem(imageUrl: url, isFavourite: true))
            .toList();
    _state = Content(favourites);
    notifyListeners();
  }

  Future<void> updateFavourites(BreedImageItem item) async {
    if (item.isFavourite) {
      repository.removeFromFavourite(item.imageUrl);
    } else {
      repository.addToFavourite(item.imageUrl);
    }
  }
}
