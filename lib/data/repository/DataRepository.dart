import 'package:flashcards_flutter/data/model/BreedImageApiModel.dart';

import '../model/AllBreedsApiModel.dart';

abstract class DataRepository {
  Future<AllBreedsApiModel> getAllBreeds();
  Future<BreedImageApiModel> getImagesByBreed(String breedName);
}
