import 'package:book_review/src/features/authentication/data/data_source/remote/authentication_service.dart';
import 'package:book_review/src/features/authentication/domain/models/login_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/login_response_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_response_model.dart';
import 'package:book_review/src/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Future<({String? error, LoginResponseModel? success})> login(
      {required LoginRequestModel loginModel}) async {
    final response = await _authenticationService.login(loginModel: loginModel);
    if (response.data != null) {
      return (success: response.data, error: null);
    }
    return (success: null, error: response.error);
  }

  @override
  Future<({String? error, RegisterResponseModel? success})> signUp(
      {required RegisterRequestModel registerModel}) async {
    final response =
        await _authenticationService.signUp(registerModel: registerModel);
    if (response.data != null) {
      return (success: response.data, error: null);
    }
    return (success: null, error: response.error);
  }
}
