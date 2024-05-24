import 'package:dio/dio.dart';

import '../../injection_container.dart';
import '../../utils/constants/api_constants.dart';
import 'dio_client.dart';

class ApiClient {
  ApiClient();
  String baseUrl = ApiConstants.baseUrl;
  Dio dio = getIt<DioClient>().dio;

  Future<Response> get(String path,
      {required Map<String, String> queryParameters}) async {
    try {
      final response =
          await dio.get('$baseUrl$path', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post('$baseUrl$path', data: data);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.put('$baseUrl$path', data: data);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete('$baseUrl$path');
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> request(
      {required String method,
      required String path,
      required dynamic data}) async {
    try {
      final response = await dio.request('$baseUrl$path',
          data: data, options: Options(method: method));
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

//  additional helper methods for authentication, headers,
  void addAuthToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void removeAuthToken() {
    dio.options.headers.remove('Authorization');
  }
}
