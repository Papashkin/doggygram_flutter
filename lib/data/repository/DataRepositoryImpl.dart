
import 'package:flashcards_flutter/data/model/BreedImageApiModel.dart';

import '../ApiService.dart';
import '../model/AllBreedsApiModel.dart';
import 'DataRepository.dart';

class DataRepositoryImpl implements DataRepository {
  final ApiService service;

  DataRepositoryImpl(this.service);

  @override
  Future<AllBreedsApiModel> getAllBreeds() async {
    return service.getAllBreeds();
  }

  @override
  Future<BreedImageApiModel> getImagesByBreed(String breedName) {
    return service.getImagesByBreed(breedName);
  }


}
