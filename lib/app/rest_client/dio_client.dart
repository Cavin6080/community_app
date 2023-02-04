import 'dart:io';

import 'package:community_managment/app/rest_client/app_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class RestClient {
  Dio? _dio;

  RestClient() {
    _dio = Dio(BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      sendTimeout: 20000,
      baseUrl: 'https://q0hcp3n9.directus.app',
    ));

    // Attempt to fix `CERTIFICATE_VERIFY_FAILED` error
    (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio!.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AppInterceptor(),
    ]);
  }

  Dio? dio() => _dio;
}