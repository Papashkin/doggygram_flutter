import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'model/AllBreedsApiModel.dart';

part 'ApiService.g.dart';

@RestApi(baseUrl: 'https://images.dog.ceo')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/breeds/list/all")
  Future<AllBreedsApiModel> getAllBreeds();
}

class ParseErrorLogger {

  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    print("❌ Error occurred: $error");
    print("📌 StackTrace: $stackTrace");
    print("🔗 Request URL: ${options.uri}");
  }
}
