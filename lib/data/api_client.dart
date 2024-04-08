import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_nt_ten/utils/constants/app_constants.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  void _init() {
    dio = Dio();

    dio.options = BaseOptions(
      headers: _getHeaders(),
      baseUrl: AppConstants.baseUrl,
      receiveTimeout: const Duration(seconds: 5),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint("REQUEST ga KIRDI:${options.uri}");
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          debugPrint("RESPONSE ga KIRDI:${response.data}");
          return handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler handler,
        ) {
          debugPrint("ERROR ga KIRDI:${error.message}");
          return handler.next(error);
        },
      ),
    );
  }

  Map<String, String> _getHeaders() {
    return {
      "Authorization": "Bearer ${AppConstants.token}",
      "Content-Type": "application/json",
    };
  }
}
