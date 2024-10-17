import 'package:book_review/src/core/network/endpoint.dart';
import 'package:book_review/src/core/network/server_exception.dart';
import 'package:book_review/src/shared/domain/model/error_model.dart';
import 'package:dio/dio.dart';

/// Class to hold both response, response failure model and error message
class ApiResponse<T> {
  final T? data;
  final String? error;

  ApiResponse({this.data, this.error});
}

/// A class responsible for making HTTP requests using Dio
class DioClient {
  /// Creating an instance of Dio with predefined options
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoint.baseUrl,
      headers: {
        "content-type": "application/json",
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));

  /// Sends a GET request to [url].
  ///
  /// [url]: The URL to send the GET request.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response, response failure model or error message.
  Future<ApiResponse<T>> get<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse(data: response.data);
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  /// Sends a Request method to [url].
  ///
  /// [url]: The URL to send the Request method.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response, response failure model or error message.
  Future<Response> request<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.request(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  /// Sends a POST request to [url].
  ///
  /// [url]: The URL to send the POST request.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response, response failure model or error message.
  Future<ApiResponse<T>> post<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse(data: response.data);
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  /// Sends a PUT request to [url].
  ///
  /// [url]: The URL to send the PUT request.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response, response failure model or error message.
  Future<ApiResponse<T>> put<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.put(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse(data: response.data);
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  /// Sends a DELETE request to [url].
  ///
  /// [url]: The URL to send the DELETE request.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response, response failure model or error message.
  Future<ApiResponse<T>> delete<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.delete(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse(data: response.data);
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  /// Sends a PATCH request to [url].
  ///
  /// [url]: The URL to send the PATCH request.
  /// [options]: Additional request options.
  /// [data]: Data to send with the request.
  /// [queryParameters]: Additional query parameters.
  ///
  /// Returns a [ApiResponse] object encapsulating the response or error.
  Future<ApiResponse<T>> patch<T>(
      {required String url,
      Options? options,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.patch(
        url,
        options: options,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse(data: response.data);
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  /// Handles dio exception based on the response in error.
  /// Required parameter: `error` of [DioException] type.
  ///
  /// Returns a [ApiResponse] object response failure model or error message.
  ApiResponse<T> _handleDioException<T>(DioException error) {
    try {
      final parsedJson = ErrorModel.fromJson(error.response?.data);
      if (parsedJson.error != null) {
        return ApiResponse(error: parsedJson.message);
      }
      return ApiResponse(
          error: 'An Unexpected Error Occured. Please try again later!');
    } catch (e) {
      String errorMessage = ServerException.getDioErrorMessage(error);
      return ApiResponse(error: errorMessage);
    }
  }
}
