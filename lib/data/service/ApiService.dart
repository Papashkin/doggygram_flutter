import 'package:dio/dio.dart';
import 'package:flashcards_flutter/data/model/BreedImageApiModel.dart';
import 'package:retrofit/http.dart';
import '../model/AllBreedsApiModel.dart';

part 'ApiService.g.dart';

const String BASE_URL = 'https://dog.ceo/api';

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/breeds/list/all")
  Future<AllBreedsApiModel> getAllBreeds();

  @GET("/breed/{breedName}/images/random/20")
  Future<BreedImageApiModel> getImagesByBreed(@Path() String breedName);
}

class ParseErrorLogger {
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    print("❌ Error occurred: $error");
    print("📌 StackTrace: $stackTrace");
    print("🔗 Request URL: ${options.uri}");
  }
}
