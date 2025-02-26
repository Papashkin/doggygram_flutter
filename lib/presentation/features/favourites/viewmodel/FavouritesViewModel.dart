import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';
import 'package:flashcards_flutter/data/repository/DataRepository.dart';
import 'package:flashcards_flutter/presentation/features/favourites/FavouritesScreenUiState.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/FilterItem.dart';

import '../../breedimages/model/BreedImageItem.dart';

class FavouritesViewModel extends BaseViewModel {
  final DataRepository repository;

  FavouritesViewModel(this.repository);

  static FavouritesScreenUiState _state = Loading();
  static List<BreedImageItem> _favourites = [];
  static List<FilterItem> _filters = [];

  void init() {
    getAllBreeds();
  }

  FavouritesScreenUiState get state => _state;

  onFiltersSet(List<FilterItem> items) {
    final newFilters =
    _filters
        .map((item) => FilterItem(item.name, items.contains(item)))
        .toList();
    _filters = newFilters;

    if (items.isEmpty) {
      _state = Content(_favourites, _filters);
    } else {
      final filteredNames = items.map((item) => item.name).toList();
      _state = Content(getFilteredItems(filteredNames), _filters);
    }
    notifyListeners();
  }

  List<BreedImageItem> getFilteredItems(List<String> filteredNames) {
    final filteredItems =
        _favourites.where((favourite) {
          return filteredNames.any((name) => favourite.imageUrl.contains(name));
        }).toList();
    return filteredItems;
  }

  onFavouriteItemTap(BreedImageItem changedItem) {
    final filteredItems = (_state as Content).items;
    final index = filteredItems.indexOf(changedItem);

    updateFavouritesInStorage(filteredItems[index]);
    filteredItems[index] = BreedImageItem(
      imageUrl: changedItem.imageUrl,
      isFavourite: !changedItem.isFavourite,
    );

    _favourites =
        _favourites.map((item) {
          return (item == changedItem)
              ? item.copyWith(null, !changedItem.isFavourite)
              : item;
        }).toList();

    _state = Content(filteredItems, _filters);
    notifyListeners();
  }

  Future<void> getAllBreeds() async {
    try {
      final data = await repository.getAllBreedsLocal();
      _filters = data.breeds.map((breed) => FilterItem(breed, false)).toList();
    } catch (e) {
      _filters = [];
    } finally {
      getFavourites();
    }
  }

  Future<void> getFavourites() async {
    final data = await repository.getAllFavourites();
    final favourites =
        data
            .map((url) => BreedImageItem(imageUrl: url, isFavourite: true))
            .toList();
    _favourites = favourites;
    _state = Content(favourites, _filters);
    notifyListeners();
  }

  Future<void> updateFavouritesInStorage(BreedImageItem item) async {
    if (item.isFavourite) {
      repository.removeFromFavourite(item.imageUrl);
    } else {
      repository.addToFavourite(item.imageUrl);
    }
  }
}
