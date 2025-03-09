import 'package:equatable/equatable.dart';
import 'package:flashcards_flutter/core/presentation/error_type.dart';

import 'model/BreedItem.dart';

sealed class HomeScreenState extends Equatable {}

class Loading extends HomeScreenState {

  @override
  List<Object?> get props => [];
}

class Content extends HomeScreenState {
  final List<BreedItem> breedList;

  Content(this.breedList);

  @override
  List<Object?> get props => [breedList];
}

class Error extends HomeScreenState {
  final String message;
  final ErrorType type;

  Error(this.message, this.type);

  @override
  List<Object?> get props => [message, type];
}
