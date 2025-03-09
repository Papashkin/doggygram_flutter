
import 'package:flashcards_flutter/presentation/features/about/about_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/service/app_version_service.dart';

class AboutCubit extends Cubit<AboutState> {
  final AppVersionService service;

  AboutCubit(this.service) : super(Loading()) {
    getData();
  }

  void getData() async {
    final version = await service.getAppVersion();
    emit(Content(version));
  }
}