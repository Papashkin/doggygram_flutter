import 'package:flashcards_flutter/data/model/BreedImageApiModel.dart';

import '../model/AllBreedsApiModel.dart';

abstract class DataRepository {
  Future<AllBreedsApiModel> getAllBreedsRemote();
  AllBreedsApiModel getAllBreedsLocal();
  Future<void> setAllBreedsLocal(AllBreedsApiModel allBreeds);
  Future<BreedImageApiModel> getImagesByBreed(String breedName);
  Future<void> addToFavourite(String image);
  Future<void> removeFromFavourite(String image);
  Future<List<String>> getAllFavourites();
}
