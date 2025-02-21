import 'package:flashcards_flutter/presentation/features/breedimages/model/BreedImageItem.dart';

sealed class FavouritesScreenUiState {}

class Loading extends FavouritesScreenUiState {}

class Content extends FavouritesScreenUiState {
  final List<BreedImageItem> items;

  Content(this.items);
}

class Error extends FavouritesScreenUiState {
  final String message;

  Error(this.message);
}
