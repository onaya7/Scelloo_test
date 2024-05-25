import 'package:dio/dio.dart';

import '../instance/logger.dart';

class ApiInterceptor extends InterceptorsWrapper {
  ApiInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('Request: ${options.method} ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        'Response: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}');
    logger.i(response.data);

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('Error occured: ${err.message}');
    logger
        .d('Entered onError method. Status code: ${err.response?.statusCode}');

    handler.next(err);
  }
}
