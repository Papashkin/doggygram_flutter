import 'package:dio/dio.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/viewmodel/BreedImagesViewModel.dart';
import 'package:get_it/get_it.dart';
import '../../data/ApiService.dart';
import '../../data/repository/DataRepository.dart';
import '../../data/repository/DataRepositoryImpl.dart';
import '../../presentation/features/home/viewmodel/HomeViewModel.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<BreedImagesViewModel>(
    () => BreedImagesViewModel(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(getIt<ApiService>()),
  );
}
