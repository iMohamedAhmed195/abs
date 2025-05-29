import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_ilearn/config/extensions/extensions.dart';

import '../../../config/constants/app_prefs.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers[HttpHeaders.contentTypeHeader] = ContentType.json;
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('REQUEST[${options.method}] => PATH: ${options.data.toString()}');
    options.headers[HttpHeaders.acceptLanguageHeader] = AppPrefs.language;

    if (options.baseUrl.contains("google").isFalse && AppPrefs.token.isNotNull) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer ${AppPrefs.token}";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
