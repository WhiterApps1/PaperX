part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibility extends AuthEvent {
  const TogglePasswordVisibility();
}

class SelectServer extends AuthEvent {
  final String? server;

  const SelectServer(this.server);

  @override
  List<Object?> get props => [server];
}

class ToggleRememberMe extends AuthEvent {
  final bool value;

  const ToggleRememberMe(this.value);

  @override
  List<Object?> get props => [value];
}

class SubmitLogin extends AuthEvent {
  final String phoneNumber;
  final String dialCode;
  final String password;

  const SubmitLogin({
    required this.phoneNumber,
    required this.dialCode,
    required this.password,
  });

  @override
  List<Object?> get props => [phoneNumber, dialCode, password];
}

class SubmitSignUp extends AuthEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String panNumber;
  final String dialCode;
  final String password;
  final String confirmPassword;

  const SubmitSignUp({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.panNumber,
    required this.dialCode,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    phoneNumber,
    panNumber,
    dialCode,
    password,
    confirmPassword,
  ];
}
