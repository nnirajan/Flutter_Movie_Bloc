import 'package:dio/dio.dart';
import 'package:movie_bloc/core/logging/logger.dart';

abstract class NetworkClientManageable {
  // should return future with exception and json serialized model for both get and post request

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  void postRequest({required String path});
}

class NetworkClient implements NetworkClientManageable {
  final String _baseURL = "https://api.themoviedb.org/3/";

  final String _apiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZTdjYzRmMzRjM2JlMGRiMTI2YThjMWI1M2FkMjdiZSIsInN1YiI6IjY2NTU0YmI0Yzc0YWZlNzMyM2JiODQ4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cukwQkiOYZcEJdShYm0N8NZB8Swj71EzhAeCtXDBkEo";

  Options get _defaultOptions {
    Options options = Options(headers: {
      'accept': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    });

    return options;
  }

  final Dio _dio = Dio();

  // reference for creating singleton
  // https://stackoverflow.com/questions/12649573/how-do-you-build-a-singleton-in-dart

  // 1. Singleton Factory Constructor
  // static final NetworkClient _singleton = NetworkClient._internal();

  // NetworkClient._internal();

  // factory NetworkClient() => _singleton;

  // 2. Static Field
  // static final NetworkClient instance = NetworkClient._privateConstructor();

  // NetworkClient._privateConstructor();

  // 3. lazying loading
  static NetworkClient? _singleton;

  NetworkClient._privateConstructor();

  static NetworkClient get singleton =>
      _singleton ?? NetworkClient._privateConstructor();

  @override
  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final url = _baseURL + path;

      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _defaultOptions,
      );

      logger.d(response);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Something went wrong");
      }
    } on DioException catch (dioError) {
      logger.e(dioError.message);

      throw Exception(dioError.message);
    } catch (error) {
      logger.e(error.toString());

      throw Exception(error.toString());
    }
  }

  @override
  void postRequest({required String path}) {
    // TODO: implement postRequest
  }
}




// @freezed
// class NetworkResponse with _$NetworkResponse {
// // const factory NetworkResponse.empty() = Empty;

//   const factory NetworkResponse.json(Map<String, dynamic> data) = Json;
// }
