import 'model/BreedItem.dart';

sealed class HomeViewUiState {}

class Loading extends HomeViewUiState {}

class Content extends HomeViewUiState {
  final List<BreedItem> breedList;

  Content(this.breedList);
}

class Error extends HomeViewUiState {
  final String message;

  Error(this.message);
}
