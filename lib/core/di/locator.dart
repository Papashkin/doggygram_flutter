import 'package:dio/dio.dart';
import 'package:flashcards_flutter/presentation/features/breedimages/cubit/breed_images_cubit.dart';
import 'package:flashcards_flutter/presentation/features/home/cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/SessionStorage.dart';
import '../../data/repository/data_repository.dart';
import '../../data/repository/data_repository_impl.dart';
import '../../data/service/ApiService.dart';
import '../../data/service/FavoritesService.dart';
import '../../presentation/features/favourites/cubit/favourites_cubit.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  setupHive();

  getIt.registerLazySingleton<Dio>(() {
    final Dio dio = Dio();
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
    () => DataRepositoryImpl(
      getIt<ApiService>(),
      getIt<FavoritesService>(),
      getIt<SessionStorage>(),
    ),
  );

  getIt.registerLazySingleton<SessionStorage>(() => SessionStorage());

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<BreedImagesCubit>(
    () => BreedImagesCubit(getIt<DataRepository>()),
  );

  getIt.registerLazySingleton<FavouritesCubit>(
    () => FavouritesCubit(getIt<DataRepository>()),
  );
}

void setupHive() {
  Hive.initFlutter();
}
