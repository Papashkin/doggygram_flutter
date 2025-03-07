import 'package:flashcards_flutter/presentation/features/home/home_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/AllBreedsApiModel.dart';
import '../../../../data/repository/data_repository.dart';
import '../../../../core/presentation/error_type.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeScreenState> {
  DataRepository repository;

  HomeCubit(this.repository) : super(Loading()) {
    getData();
  }

  Future<void> getData() async {
    try {
      final data = await repository.getAllBreedsRemote();
      onGetDataSuccessResult(data);
    } on DioException catch (e) {
      onGetDataErrorResult(e, ErrorType.network);
    } catch (e) {
      onGetDataErrorResult(e, ErrorType.unknown);
    }
  }

  void onGetDataSuccessResult(AllBreedsApiModel data) {
    final allBreedItems = data.mapToBreedItems();
    emit(Content(allBreedItems));
  }

  void onGetDataErrorResult(Object e, ErrorType type) {
    emit(Error(e.toString(), type));
  }
}