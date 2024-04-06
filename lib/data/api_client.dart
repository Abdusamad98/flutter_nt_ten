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
      queryParameters: {},
      baseUrl: AppConstants.currenciesBaseUrl,
      receiveTimeout: const Duration(seconds: 5),
      // headers: {
      //   "Authorization": "Bearer erjfjrbjrfbh",
      //   "Content-Type": "application/Json"
      // },
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
}
