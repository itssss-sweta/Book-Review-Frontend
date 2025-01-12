sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class RegistrationLoading extends AuthenticationState {}

class RegistrationSuccessful extends AuthenticationState {
  final String message;

  RegistrationSuccessful({required this.message});
}

class Authenticated extends AuthenticationState {
  final String token;

  Authenticated({required this.token});
}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({required this.message});
}

class RegistrationError extends AuthenticationState {
  final String message;

  RegistrationError({required this.message});
}

class RegisterPasswordVisibilityToggled extends AuthenticationState {
  final bool isVisible;

  RegisterPasswordVisibilityToggled(this.isVisible);
}

class LoginPasswordVisibilityToggled extends AuthenticationState {
  final bool isVisible;

  LoginPasswordVisibilityToggled(this.isVisible);
}

class ConfirmPasswordVisibilityToggled extends AuthenticationState {
  final bool isVisible;

  ConfirmPasswordVisibilityToggled(this.isVisible);
}
