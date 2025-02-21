import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';
import 'package:flashcards_flutter/data/model/AllBreedsApiModel.dart';
import '../../../../data/repository/DataRepository.dart';
import '../HomeViewUiState.dart';

class HomeViewModel extends BaseViewModel {
  final DataRepository repository;

  HomeViewModel(this.repository);

  static HomeViewUiState _state = Loading();

  HomeViewUiState get state => _state;

  void init() {
    if (_state is Content) {
      return;
    } else {
      getBreeds();
    }
  }

  Future<void> getBreeds() async {
    updateStateWithNotification(action: () => {_state = Loading()});

    try {
      final response = await repository.getAllBreeds();
      if (response.isSuccessful()) {
        onGetAllBreedsSuccessResult(response);
      } else {
        onGetAllBreedsErrorResult(response.message.toString());
      }
    } catch (e) {
      onGetAllBreedsErrorResult(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void onGetAllBreedsSuccessResult(AllBreedsApiModel data) {
    final allBreedItems = data.mapToBreedItems();
    _state = Content(allBreedItems);
  }

  void onGetAllBreedsErrorResult(String? error) {
    _state = Error(error ?? 'Failed to load breed images');
  }
}
