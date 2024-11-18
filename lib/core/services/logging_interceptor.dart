import 'package:currency_exchanger/core/utils/logger.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger
      ..i('Response: [${response.statusCode}] ${response.requestOptions.path}')
      ..d('Response Body: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger
      ..i('Request: [${options.method}] ${options.path}')
      ..d('Headers: ${options.headers}');
    if (options.data != null) {
      logger.d('Request Body: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('Error: [${err.response?.statusCode}] ${err.message}');
    if (err.response != null) {
      logger.e('Response Data: ${err.response?.data}');
    }
    super.onError(err, handler);
  }
}
