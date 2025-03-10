import 'package:equatable/equatable.dart';
import 'package:flashcards_flutter/core/presentation/error_type.dart';
import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';

import '../breedimages/model/breed_image_item.dart';

sealed class FavouritesState extends Equatable {}

class Loading extends FavouritesState {
  @override
  List<Object?> get props => [];
}

class Content extends FavouritesState {
  final Map<String, List<BreedImageItem>> items;
  final List<FilterItem> filters;

  Content(this.items, this.filters);

  @override
  List<Object?> get props => [items, filters];
}

class Error extends FavouritesState {
  final String message;
  final ErrorType type;

  Error(this.message, this.type);

  @override
  List<Object?> get props => [message, type];
}
