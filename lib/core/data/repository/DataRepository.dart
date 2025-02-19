import 'package:flashcards_flutter/core/data/ApiService.dart';
import 'package:flashcards_flutter/core/data/model/AllBreedsApiModel.dart';

abstract class DataRepository {
  Future<AllBreedsApiModel> getBreeds();
}

class DataRepositoryImpl implements DataRepository {
  final ApiService service;

  DataRepositoryImpl(this.service);

  @override
  Future<AllBreedsApiModel> getBreeds() async {
    return service.getAllBreeds();
  }
}