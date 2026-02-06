import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SelectServer>(_onSelectServer);
    on<ToggleRememberMe>(_onToggleRememberMe);
    on<SubmitLogin>(_onSubmitLogin);
    on<SubmitSignUp>(_onSubmitSignUp);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(
      AuthInitial(
        isPasswordVisible: !state.isPasswordVisible,
        selectedServer: state.selectedServer,
        rememberMe: state.rememberMe,
      ),
    );
  }

  void _onSelectServer(SelectServer event, Emitter<AuthState> emit) {
    emit(
      AuthInitial(
        isPasswordVisible: state.isPasswordVisible,
        selectedServer: event.server,
        rememberMe: state.rememberMe,
      ),
    );
  }

  void _onToggleRememberMe(ToggleRememberMe event, Emitter<AuthState> emit) {
    emit(
      AuthInitial(
        isPasswordVisible: state.isPasswordVisible,
        selectedServer: state.selectedServer,
        rememberMe: event.value,
      ),
    );
  }

  Future<void> _onSubmitLogin(
    SubmitLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthLoading(
        isPasswordVisible: state.isPasswordVisible,
        selectedServer: state.selectedServer,
        rememberMe: state.rememberMe,
      ),
    );

    try {
      // TODO: Implement actual login logic here
      await Future.delayed(const Duration(seconds: 1));

      emit(
        AuthSuccess(
          phoneNumber: event.phoneNumber,
          dialCode: event.dialCode,
          isPasswordVisible: state.isPasswordVisible,
          selectedServer: state.selectedServer,
          rememberMe: state.rememberMe,
        ),
      );
    } catch (e) {
      emit(
        AuthFailure(
          message: e.toString(),
          isPasswordVisible: state.isPasswordVisible,
          selectedServer: state.selectedServer,
          rememberMe: state.rememberMe,
        ),
      );
    }
  }

  Future<void> _onSubmitSignUp(
    SubmitSignUp event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isPasswordVisible: state.isPasswordVisible));

    try {
      // TODO: Implement actual signup logic here
      await Future.delayed(const Duration(seconds: 1));

      emit(
        AuthSuccess(
          phoneNumber: event.phoneNumber,
          dialCode: event.dialCode,
          isPasswordVisible: state.isPasswordVisible,
          selectedServer: state.selectedServer,
          rememberMe: state.rememberMe,
        ),
      );
    } catch (e) {
      emit(
        AuthFailure(
          message: e.toString(),
          isPasswordVisible: state.isPasswordVisible,
          selectedServer: state.selectedServer,
          rememberMe: state.rememberMe,
        ),
      );
    }
  }
}
