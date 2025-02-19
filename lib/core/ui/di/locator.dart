import 'package:dio/dio.dart';
import 'package:flashcards_flutter/core/ui/home/viewmodel/HomeViewModel.dart';
import 'package:get_it/get_it.dart';

import '../../data/ApiService.dart';
import '../../data/repository/DataRepository.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeViewModel>(() => HomeViewModel(getIt<DataRepository>()));

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<DataRepository>(() => DataRepositoryImpl(getIt<ApiService>()));
}
