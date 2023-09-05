import 'package:dio/dio.dart';

import '../../data/local/LocalDataManger.dart';

class ApiConfig {
  ApiConfig._();

  static const baseUrl = "https://jsonplaceholder.typicode.com/";
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}

abstract class NetworkModule {
  static Dio provideDao(LocalDataManagerImpl localDataManagerImpl) {
    final dio = Dio();
    dio
      ..options.baseUrl = ApiConfig.baseUrl
      ..options.connectTimeout = const Duration(minutes: 2)
      ..options.receiveTimeout = const Duration(minutes: 2)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await localDataManagerImpl.token;

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }
            return handler.next(options);
          },
        ),
      );
    return dio;
  }
}
