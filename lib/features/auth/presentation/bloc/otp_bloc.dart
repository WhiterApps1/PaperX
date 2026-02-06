import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  Timer? _timer;
  static const int _otpDuration = 300; // 5 minutes in seconds

  OtpBloc() : super(const OtpInitial()) {
    on<StartOtpTimer>(_onStartOtpTimer);
    on<OtpTimerTick>(_onOtpTimerTick);
    on<VerifyOtp>(_onVerifyOtp);
    on<ResendOtp>(_onResendOtp);
  }

  void _onStartOtpTimer(StartOtpTimer event, Emitter<OtpState> emit) {
    _timer?.cancel();
    emit(const OtpTimerRunning(_otpDuration));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state;
      if (currentState is OtpTimerRunning) {
        if (currentState.remainingSeconds > 0) {
          add(OtpTimerTick(currentState.remainingSeconds - 1));
        } else {
          timer.cancel();
          add(const OtpTimerTick(0));
        }
      }
    });
  }

  void _onOtpTimerTick(OtpTimerTick event, Emitter<OtpState> emit) {
    if (event.duration > 0) {
      emit(OtpTimerRunning(event.duration));
    } else {
      _timer?.cancel();
      emit(const OtpTimerExpired());
    }
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<OtpState> emit) async {
    emit(const OtpVerifying());

    try {
      // TODO: Implement actual OTP verification logic
      await Future.delayed(const Duration(seconds: 1));

      // Always succeed regardless of OTP input
      _timer?.cancel();
      emit(const OtpSuccess());
    } catch (e) {
      emit(OtpFailure(e.toString()));
    }
  }

  Future<void> _onResendOtp(ResendOtp event, Emitter<OtpState> emit) async {
    emit(const OtpResending());

    try {
      // TODO: Implement actual resend OTP logic
      await Future.delayed(const Duration(seconds: 1));

      // Restart timer after resending
      add(const StartOtpTimer());
    } catch (e) {
      emit(OtpFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
