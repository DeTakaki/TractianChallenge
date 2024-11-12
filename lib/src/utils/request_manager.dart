import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'labels.dart';

const String baseUrl = 'https://fake-api.tractian.com/';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class RequestManager {
  Future<Response> restRequest({
    required String url,
    required String method,
    bool hasToken = false,
    Map? headers,
    dynamic body,
    Map<String, dynamic>? parameters,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        {'content-type': 'application/json', 'accept': 'application/json'},
      );

    Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback = ((_, __, ___) => true);
        return client;
      },
    );

    // * In case we need to hold a auth token, for security
    if (hasToken) {
      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer token';
          return handler.next(options);
        },
      ));
    }
    final requestUrl = baseUrl + url;

    try {
      Response response = await dio.request(
        requestUrl,
        options: Options(headers: defaultHeaders, method: method),
        data: body,
        queryParameters: parameters,
      );
      return response;
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception(Labels.noInternet);
        case DioExceptionType.connectionError:
          throw Exception(Labels.connectionErrror);
        default:
          return error.response!;
      }
    }
  }
}
