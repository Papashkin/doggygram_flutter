import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';
import '../../../../data/repository/DataRepository.dart';
import '../HomeViewUiState.dart';

class HomeViewModel extends BaseViewModel {
  final DataRepository repository;

  HomeViewModel(this.repository);

  final HomeViewUiState _state = HomeViewUiState(true, List.empty());

  HomeViewUiState get state => _state;

  init() {
    getBreeds();
  }

  Future<void> getBreeds() async {
    updateStateWithNotification(action: () => {_state.isLoading = true});

    try {
      final response = await repository.getBreeds();
      if (response.isSuccessful()) {
        _state.breedList = response.mapToBreedItems();
      } else {
        _state.breedList = List.empty();
      }
    } catch (e) {
      print("❌ Error occurred: $e");
    } finally {
      updateStateWithNotification(action: () => {_state.isLoading = false});
    }
  }
}
