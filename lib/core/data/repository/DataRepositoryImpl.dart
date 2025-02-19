
import '../ApiService.dart';
import '../model/AllBreedsApiModel.dart';
import 'DataRepository.dart';

class DataRepositoryImpl implements DataRepository {
  final ApiService service;

  DataRepositoryImpl(this.service);

  @override
  Future<AllBreedsApiModel> getBreeds() async {
    return service.getAllBreeds();
  }
}
