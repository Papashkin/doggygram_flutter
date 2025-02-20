import '../model/AllBreedsApiModel.dart';

abstract class DataRepository {
  Future<AllBreedsApiModel> getBreeds();
}
