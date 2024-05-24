import 'package:dio/dio.dart';

import '../../utils/constants/api_constants.dart';
import 'api_interceptor.dart';

class DioClient {
  DioClient._() {
    dio.interceptors.add(ApiInterceptor());
    // dio.interceptors.add(DioCacheInterceptor(options: options));
  }

  static final instance = DioClient._();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );
}
