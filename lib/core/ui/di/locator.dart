import 'package:flashcards_flutter/core/ui/home/viewmodel/HomeViewModel.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}


