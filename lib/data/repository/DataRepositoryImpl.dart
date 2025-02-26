
import 'package:flashcards_flutter/data/SessionStorage.dart';
import 'package:flashcards_flutter/data/model/BreedImageApiModel.dart';
import 'package:flashcards_flutter/data/service/FavoritesService.dart';

import '../service/ApiService.dart';
import '../model/AllBreedsApiModel.dart';
import 'DataRepository.dart';

class DataRepositoryImpl implements DataRepository {
  final ApiService apiService;
  final FavoritesService favoriteService;
  final SessionStorage sessionStorage;

  DataRepositoryImpl(this.apiService, this.favoriteService, this.sessionStorage);

  @override
  Future<AllBreedsApiModel> getAllBreedsRemote() async {
    final response = await apiService.getAllBreeds();
    setAllBreedsLocal(response);
    return response;
  }

  @override
  AllBreedsApiModel getAllBreedsLocal() {
    return sessionStorage.getData('all_breeds');
  }

  @override
  Future<void> setAllBreedsLocal(AllBreedsApiModel allBreeds) async {
    sessionStorage.setData('all_breeds', allBreeds);
  }

  @override
  Future<BreedImageApiModel> getImagesByBreed(String breedName) async {
    return await apiService.getImagesByBreed(breedName);
  }

  @override
  Future<void> addToFavourite(String image) async {
    return await favoriteService.addFavourite(image);
  }

  @override
  Future<void> removeFromFavourite(String image) async {
    return await favoriteService.removeFavourite(image);
  }

  @override
  Future<List<String>> getAllFavourites() async {
    return await favoriteService.getFavourites();
  }
}
