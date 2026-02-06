part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isPasswordVisible;
  final String? selectedServer;
  final bool rememberMe;

  const AuthState({
    this.isPasswordVisible = false,
    this.selectedServer,
    this.rememberMe = false,
  });

  @override
  List<Object?> get props => [isPasswordVisible, selectedServer, rememberMe];
}

class AuthInitial extends AuthState {
  const AuthInitial({
    super.isPasswordVisible = false,
    super.selectedServer,
    super.rememberMe = false,
  });
}

class AuthLoading extends AuthState {
  const AuthLoading({
    super.isPasswordVisible,
    super.selectedServer,
    super.rememberMe,
  });
}

class AuthSuccess extends AuthState {
  final String phoneNumber;
  final String dialCode;

  const AuthSuccess({
    required this.phoneNumber,
    required this.dialCode,
    super.isPasswordVisible,
    super.selectedServer,
    super.rememberMe,
  });

  @override
  List<Object?> get props => [
    phoneNumber,
    dialCode,
    isPasswordVisible,
    selectedServer,
    rememberMe,
  ];
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({
    required this.message,
    super.isPasswordVisible,
    super.selectedServer,
    super.rememberMe,
  });

  @override
  List<Object?> get props => [
    message,
    isPasswordVisible,
    selectedServer,
    rememberMe,
  ];
}
