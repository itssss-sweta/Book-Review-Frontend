import 'package:book_review/src/core/network/dio_client.dart';
import 'package:book_review/src/features/authentication/domain/models/login_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/login_response_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_response_model.dart';

class AuthenticationService {
  final DioClient _dioClient = DioClient();

  /// Future method that calls post method for signing up user
  /// Takes [RegisterRequestModel] as a paramater.
  /// On response, decodes the response data and return decoded data or error message.
  Future<ApiResponse<RegisterResponseModel>> signUp(
      {required RegisterRequestModel registerModel}) async {
    final ApiResponse<Map<String, dynamic>> response =
        await _dioClient.post(url: 'auth/signup', data: registerModel.toJson());
    if (response.data != null) {
      final jsonDecode = RegisterResponseModel.fromJson(response.data!);
      return ApiResponse(data: jsonDecode);
    }
    return ApiResponse(error: response.error);
  }

  /// Future method that calls post method for login
  /// Takes [LoginRequestModel] as a paramater.
  /// On response, decodes the response data and return decoded data or error message.
  Future<ApiResponse<LoginResponseModel>> login(
      {required LoginRequestModel loginModel}) async {
    final ApiResponse<Map<String, dynamic>> response =
        await _dioClient.post(url: 'auth/login', data: loginModel.toJson());
    if (response.data != null) {
      final jsonDecode = LoginResponseModel.fromJson(response.data!);
      return ApiResponse(data: jsonDecode);
    }
    return ApiResponse(error: response.error);
  }
}
