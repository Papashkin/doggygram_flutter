import 'package:equatable/equatable.dart';
import 'package:flashcards_flutter/core/presentation/error_type.dart';

import 'model/breed_image_item.dart';

sealed class BreedImagesState extends Equatable {}

class Loading extends BreedImagesState {

  @override
  List<Object?> get props => [];
}

class Content extends BreedImagesState {
  final List<BreedImageItem> breedImages;

  Content(this.breedImages);

  @override
  List<Object?> get props => [breedImages];
}

class Error extends BreedImagesState {
  final String message;
  final ErrorType type;

  Error(this.message, this.type);

  @override
  List<Object?> get props => [message, type];
}
