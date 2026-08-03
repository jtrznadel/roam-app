import 'package:dio/dio.dart';

import '../config/app_config.dart';

class DioFactory {
  static Dio create({List<Interceptor> interceptors = const []}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.apiUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll(interceptors);

    if (AppConfig.instance.enableLogs) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: false,
        ),
      );
    }

    return dio;
  }
}
