import 'package:flashcards_flutter/data/repository/data_repository.dart';
import 'package:flashcards_flutter/presentation/features/favourites/favourites_state.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../breedimages/model/breed_image_item.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final DataRepository repository;

  FavouritesCubit(this.repository) : super(Loading());

  static List<BreedImageItem> _favourites = [];
  static List<FilterItem> _filters = [];

  void init() {
    emit(Loading());
    getAllBreeds();
  }

  onFiltersSet(List<FilterItem> items) {
    final newFilters =
        _filters
            .map((item) => FilterItem(item.name, items.contains(item)))
            .toList();
    _filters = newFilters;

    if (items.isEmpty) {
      emit(Content(_favourites, _filters));
    } else {
      final filteredNames = items.map((item) => item.name).toList();
      emit(Content(getFilteredItems(filteredNames), _filters));
    }
  }

  List<BreedImageItem> getFilteredItems(List<String> filteredNames) {
    final filteredItems =
        _favourites.where((favourite) {
          return filteredNames.any((name) => favourite.imageUrl.contains(name));
        }).toList();
    return filteredItems;
  }

  onFavouriteItemTap(BreedImageItem changedItem) {
    if (state is! Content) return;
    final updatedItems =
        (state as Content).items.map((item) {
          if (item.imageUrl == changedItem.imageUrl) {
            updateFavouritesInStorage(changedItem);
            final updatedItem = BreedImageItem(
              imageUrl: changedItem.imageUrl,
              isFavourite: !changedItem.isFavourite,
            );
            return updatedItem;
          }
          return item;
        }).toList();

    _favourites =
        _favourites.map((item) {
          return (item == changedItem)
              ? item.copyWith(null, !changedItem.isFavourite)
              : item;
        }).toList();

    emit(Content(updatedItems, _filters));
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
    emit(Content(favourites, _filters));
  }

  Future<void> updateFavouritesInStorage(BreedImageItem item) async {
    if (item.isFavourite) {
      await repository.removeFromFavourite(item.imageUrl);
    } else {
      await repository.addToFavourite(item.imageUrl);
    }
  }
}
