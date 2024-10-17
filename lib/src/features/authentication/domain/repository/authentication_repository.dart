import 'package:book_review/src/features/authentication/domain/models/login_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/login_response_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_response_model.dart';

abstract class AuthenticationRepository {
  Future<({RegisterResponseModel? success, String? error})> signUp(
      {required RegisterRequestModel registerModel});

  Future<({LoginResponseModel? success, String? error})> login(
      {required LoginRequestModel loginModel});
}
