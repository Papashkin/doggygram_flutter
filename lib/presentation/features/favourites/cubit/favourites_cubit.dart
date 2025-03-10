import 'package:flashcards_flutter/data/repository/data_repository.dart';
import 'package:flashcards_flutter/presentation/features/favourites/favourites_state.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../breedimages/model/breed_image_item.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final DataRepository repository;

  FavouritesCubit(this.repository) : super(Loading());

  static List<FilterItem> _filters = [];
  static final Map<String, List<BreedImageItem>> _favouritesWithHeaders = {};

  void init() {
    emit(Loading());
    getAllBreeds();
  }

  void onFiltersSet(List<FilterItem> items) {
    _filters = updateFilters(items);

    if (items.isEmpty) {
      emit(Content(_favouritesWithHeaders, _filters));
    } else {
      final filteredNames = items.map((item) => item.name).toList();
      emit(Content(getFilteredItems(filteredNames), _filters));
    }
  }

  void onFavouriteItemTap(String breed, BreedImageItem changedItem) {
    if (state is! Content) return;

    /** TODO THIS ONE WORKS 100%!
        final newItems = (state as Content).items.map((key, value) {
        if (key == breed) {
        var newEntry = value.map((entry) {
        if (entry.imageUrl == changedItem.imageUrl) {
        updateFavouritesInStorage(changedItem);
        return entry.copyWith(null, !entry.isFavourite);
        } else {
        return entry;
        };
        }).toList();
        return MapEntry(key, newEntry);
        } else {
        return MapEntry(key, value);
        }
        });
        emit(Content(newItems, _filters));
     */

    // /** ======= ANOTHER OPTION THAT WORKS =======
    final filteredItemsWithHeaders = (state as Content).items;
    final itemsByBreed = filteredItemsWithHeaders[breed];
    if (itemsByBreed == null) return;

    emit(Loading());
    final newItems =
        itemsByBreed.map((item) {
          if (item.imageUrl == changedItem.imageUrl) {
            updateFavouritesInStorage(changedItem);
            return item.copyWith(null, !item.isFavourite);
          } else {
            return item;
          }
        }).toList();

    filteredItemsWithHeaders[breed] = newItems;

    emit(Content(filteredItemsWithHeaders, _filters));
    // */
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
    final breedNames = _filters.map((item) => item.name).toList();
    for (var key in breedNames) {
      _favouritesWithHeaders[key] =
          favourites.where((item) => item.imageUrl.contains(key)).toList();
    }
    _favouritesWithHeaders.removeWhere((key, value) => value.isEmpty);
    emit(Content(_favouritesWithHeaders, _filters));
  }

  Future<void> updateFavouritesInStorage(BreedImageItem item) async {
    if (item.isFavourite) {
      await repository.removeFromFavourite(item.imageUrl);
    } else {
      await repository.addToFavourite(item.imageUrl);
    }
  }

  static List<FilterItem> updateFilters(List<FilterItem> items) {
    final newFilters =
        _filters
            .map((item) => FilterItem(item.name, items.contains(item)))
            .toList();
    newFilters.sort((a, b) {
      int selectedComparison = (b.isSelected ? 1 : 0) - (a.isSelected ? 1 : 0);
      if (selectedComparison != 0) return selectedComparison;
      return a.name.compareTo(b.name);
    });
    return newFilters;
  }

  static Map<String, List<BreedImageItem>> getFilteredItems(
    List<String> filteredNames,
  ) {
    final filteredFavouritesWithHeaders = Map.fromEntries(
      _favouritesWithHeaders.entries.where(
        (favourites) => filteredNames.contains(favourites.key),
      ),
    );
    return filteredFavouritesWithHeaders;
  }
}
