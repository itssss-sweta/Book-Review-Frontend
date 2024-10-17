// auth_event.dart
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {}

class RegisterEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}

class ToggleLoginPasswordVisibilityEvent extends AuthenticationEvent {}

class ToggleRegisterPasswordVisibilityEvent extends AuthenticationEvent {}

class ToggleConfirmPasswordVisibilityEvent extends AuthenticationEvent {}
