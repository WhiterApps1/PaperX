import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<StartSplashTimer>(_onStartSplashTimer);
  }

  Future<void> _onStartSplashTimer(
    StartSplashTimer event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashComplete());
  }
}
