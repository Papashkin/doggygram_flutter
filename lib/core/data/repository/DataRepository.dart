import 'package:flashcards_flutter/core/data/model/AllBreedsApiModel.dart';

abstract class DataRepository {
  Future<AllBreedsApiModel> getBreeds();
}
