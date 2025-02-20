import 'package:flashcards_flutter/core/presentation/BaseViewModel.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/model/BreedImageModel.dart';

import '../../../../data/repository/DataRepository.dart';
import '../BreedImagesUiState.dart';

class BreedImagesViewModel extends BaseViewModel {
  final DataRepository repository;

  BreedImagesViewModel(this.repository);

  static BreedImagesUiState _state = Loading();

  BreedImagesUiState get state => _state;

  void init(String? breedName) {
    if (breedName != null) {
      getBreedImages(breedName);
    }
  }

  Future<void> getBreedImages(String breedName) async {
    updateStateWithNotification(action: () => {_state = Loading()});
    try {
      var response = await repository.getImagesByBreed(breedName);
      if (response.isSuccessful()) {
        onGetBreedImagesSuccessResult(response.message);
      } else {
        onGetBreedImagesErrorResult(response.message.first);
      }
    } catch (e) {
      onGetBreedImagesErrorResult(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void onGetBreedImagesSuccessResult(List<String> data) {
    final breedImageItems =
        data.map((item) => BreedImageModel(imageUrl: item)).toList();
    _state = Content(breedImageItems);
  }

  void onGetBreedImagesErrorResult(String? error) {
    _state = Error(error ?? 'Failed to load breed images');
  }
}
