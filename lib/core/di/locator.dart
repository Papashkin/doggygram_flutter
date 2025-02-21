import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/viewmodel/BreedImagesViewModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/repository/DataRepository.dart';
import '../../data/repository/DataRepositoryImpl.dart';
import '../../data/service/ApiService.dart';
import '../../data/service/FavoritesService.dart';
import '../../presentation/features/favourites/viewmodel/FavouritesViewModel.dart';
import '../../presentation/features/home/viewmodel/HomeViewModel.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  setupHive();

  getIt.registerLazySingleton<Dio>(() {
    final options = CacheOptions(
      policy: CachePolicy.forceCache,
      maxStale: Duration(days: 1),
      store: MemCacheStore(),
      hitCacheOnErrorExcept: [],
      priority: CachePriority.high,
    );
    final Dio dio = Dio();
    dio.interceptors.add(DioCacheInterceptor(options: options));
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        responseBody: kDebugMode,
        requestHeader: kDebugMode,
        responseHeader: kDebugMode,
        error: kDebugMode,
      ),
    );
    dio.options.baseUrl = BASE_URL;
    return dio;
  });

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerSingleton<FavoritesService>(FavoritesService());

  getIt.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(getIt<ApiService>(), getIt<FavoritesService>()),
  );

  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<BreedImagesViewModel>(
    () => BreedImagesViewModel(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<FavouritesViewModel>(
    () => FavouritesViewModel(getIt<DataRepository>()),
  );
}

void setupHive() {
  Hive.initFlutter();
}
