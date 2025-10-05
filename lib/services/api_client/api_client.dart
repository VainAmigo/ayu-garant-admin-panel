import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@immutable
final class ApiClient {
  const ApiClient._(this._dio);

  factory ApiClient({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
  }) {
    final dio = Dio();
    
    dio.options.baseUrl = baseUrl ?? 'https://api.example.com';
    dio.options.connectTimeout = connectTimeout ?? const Duration(seconds: 30);
    dio.options.receiveTimeout = receiveTimeout ?? const Duration(seconds: 30);
    
    // Заголовки по умолчанию
    dio.options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?headers,
    });

    // Интерцепторы для логирования (только в debug режиме)
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }

    // Интерцептор для обработки ошибок
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        // Здесь можно добавить обработку ошибок
        handler.next(error);
      },
    ));

    return ApiClient._(dio);
  }

  final Dio _dio;

  /// GET запрос
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// POST запрос
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// PUT запрос
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// DELETE запрос
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  /// Обработка ошибок Dio
  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Ошибка таймаута: ${e.message}');
      case DioExceptionType.badResponse:
        return Exception('Ошибка сервера: ${e.response?.statusCode}');
      case DioExceptionType.cancel:
        return Exception('Запрос отменен');
      case DioExceptionType.connectionError:
        return Exception('Ошибка подключения: ${e.message}');
      case DioExceptionType.badCertificate:
        return Exception('Ошибка сертификата');
      case DioExceptionType.unknown:
        return Exception('Неизвестная ошибка: ${e.message}');
    }
  }

  /// Закрытие клиента
  void close() {
    _dio.close();
  }
}