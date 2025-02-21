import 'package:flashcards_flutter/presentation/features/breedimages/model/BreedImageItem.dart';

import 'model/BreedImageItem.dart';

sealed class BreedImagesUiState {}

class Loading extends BreedImagesUiState {}

class Content extends BreedImagesUiState {
  final List<BreedImageItem> breedImages;

  Content(this.breedImages);
}

class Error extends BreedImagesUiState {
  final String message;

  Error(this.message);
}
