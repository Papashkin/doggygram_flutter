import 'model/BreedItem.dart';

class HomeViewUiState {
  bool _isLoading = true;
  List<BreedItem> _breedList = [];

  HomeViewUiState(this._isLoading, this._breedList);

  bool get isLoading => _isLoading;
  List<BreedItem> get breedList => _breedList;
  set isLoading(bool isLoading) => _isLoading = isLoading;
  set breedList(List<BreedItem> breedList) => _breedList = breedList;
}
