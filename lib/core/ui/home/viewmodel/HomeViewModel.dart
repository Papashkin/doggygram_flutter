import 'package:flashcards_flutter/core/ui/home/HomeViewUiState.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/DataRepository.dart';

class HomeViewModel extends ChangeNotifier {
  final DataRepository repository;

  HomeViewModel(this.repository);

  HomeViewUiState _state = HomeViewUiState(true, List.empty());

  HomeViewUiState get state => _state;

  init() {
    getBreeds();
  }

  Future<void> getBreeds() async {
    _state.isLoading = true;
    notifyListeners();

    try {
      final response = await repository.getBreeds();
      if (response.isSuccessful()) {
        _state.breedList = response.mapToBreedItems();
      } else {
        _state.breedList = List.empty();
      }
    } catch(e) {
      print("❌ Error occurred: $e");
    } finally {
      _state.isLoading = false;
      notifyListeners();
    }
  }
}
