import 'package:flashcards_flutter/presentation/features/breedimages/model/BreedImageItem.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/FilterItem.dart';

sealed class FavouritesScreenUiState {}

class Loading extends FavouritesScreenUiState {}

class Content extends FavouritesScreenUiState {
  final List<BreedImageItem> items;
  final List<FilterItem> filters;

  Content(this.items, this.filters);
}

class Error extends FavouritesScreenUiState {
  final String message;

  Error(this.message);
}
