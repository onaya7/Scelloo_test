import 'package:dio/dio.dart';
import 'package:scelloo_test/core/network/api_client.dart';
import 'package:scelloo_test/core/network/api_interceptor.dart';

import '../../utils/constants/api_constants.dart';

class DioClient implements ApiClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future<Response> get(String path,
      {Map<String, String>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(path, data: data);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.patch(path, data: data);
      if (response.statusCode == 200) {
        return response;
      }
      throw 'An unexpected error occurred';
    } catch (e) {
      rethrow;
    }
  }

  @override
  void addAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}


