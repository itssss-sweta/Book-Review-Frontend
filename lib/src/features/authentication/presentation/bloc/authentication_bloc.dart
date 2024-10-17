import 'package:bloc/bloc.dart';
import 'package:book_review/src/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:book_review/src/features/authentication/domain/models/login_request_model.dart';
import 'package:book_review/src/features/authentication/domain/models/register_request_model.dart';
import 'package:book_review/src/features/authentication/domain/repository/authentication_repository.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:flutter/material.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository =
      AuthenticationRepositoryImpl();

  // Declare controllers and form key
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();
  final TextEditingController registerFullNameController =
      TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  bool isLoginPasswordVisible = false;
  bool isRegisterPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  AuthBloc() : super(AuthenticationInitial()) {
    // Register event handlers
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ToggleLoginPasswordVisibilityEvent>(_onToggleLoginPasswordVisibility);
    on<ToggleRegisterPasswordVisibilityEvent>(
        _onToggleRegisterPasswordVisibility);
    on<ToggleConfirmPasswordVisibilityEvent>(
        _onToggleConfirmPasswordVisibility);
  }

  /// Event handler for LoginEvent
  Future<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    final response = await _authRepository.login(
      loginModel: LoginRequestModel(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      ),
    );
    if (response.success != null) {
      emit(Authenticated(token: response.success!.data?.token ?? ''));
    } else {
      emit(AuthenticationError(
          message: response.error ?? "An unknown error occurred"));
    }
  }

  /// Event handler for RegisterEvent
  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthenticationState> emit) async {
    emit(RegistrationLoading());

    final response = await _authRepository.signUp(
      registerModel: RegisterRequestModel(
        fullName: registerFullNameController.text,
        email: registerEmailController.text,
        password: registerPasswordController.text,
      ),
    );

    if (response.success != null) {
      emit(RegistrationSuccessful());
    } else {
      emit(RegistrationError(
          message: response.error ?? "An unknown error occurred"));
    }
  }

  // Event handler for toggling login password visibility
  void _onToggleLoginPasswordVisibility(
      ToggleLoginPasswordVisibilityEvent event,
      Emitter<AuthenticationState> emit) {
    isLoginPasswordVisible = !isLoginPasswordVisible;
    emit(LoginPasswordVisibilityToggled(isLoginPasswordVisible));
  }

  // Event handler for toggling registration password visibility
  void _onToggleRegisterPasswordVisibility(
      ToggleRegisterPasswordVisibilityEvent event,
      Emitter<AuthenticationState> emit) {
    isRegisterPasswordVisible = !isRegisterPasswordVisible;
    emit(RegisterPasswordVisibilityToggled(isRegisterPasswordVisible));
  }

  // Event handler for toggling confirm password visibility
  void _onToggleConfirmPasswordVisibility(
      ToggleConfirmPasswordVisibilityEvent event,
      Emitter<AuthenticationState> emit) {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ConfirmPasswordVisibilityToggled(isConfirmPasswordVisible));
  }

  /// Event handler for LogoutEvent
  void _onLogoutEvent(LogoutEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationInitial());
  }
}
