import 'package:dio/dio.dart';

/// A class to handle server exceptions and provide appropriate error messages
class ServerException {
  /// Method to get error message from DioException
  static String getDioErrorMessage(DioException error) {
    String errorMessage = '';
    int statuscode = error.response?.statusCode ?? 0;
    switch (error.type) {
      case DioExceptionType.badResponse:
        switch (statuscode) {
          case 400:
            errorMessage = '$statuscode Invalid Syntax';
            break;

          case 401:
            errorMessage = '$statuscode Unauthorized';
            break;

          case 403:
            errorMessage = '$statuscode Forbidden';
            break;

          case 404:
            errorMessage = '$statuscode Page Not Found';
            break;

          case 500:
            errorMessage = '$statuscode Internal Server Error';
            break;

          case 502:
            errorMessage = '$statuscode Bad Gateway';
            break;

          case 503:
            errorMessage = '$statuscode Service Unavailable';
            break;

          default:
            errorMessage = 'Unknown Error';
        }
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
        break;

      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
        break;

      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
        break;

      case DioExceptionType.badCertificate:
        errorMessage = 'Send timeout';
        break;

      case DioExceptionType.cancel:
        errorMessage = 'Request to the server has been canceled';
        break;

      case DioExceptionType.connectionError:
        errorMessage = 'Connection Error';
        break;

      case DioExceptionType.unknown:
        errorMessage = 'Unexpected Error';
        break;

      default:
        errorMessage = 'Unknown Error';
    }
    return errorMessage;
  }
}
