part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class StartOtpTimer extends OtpEvent {
  const StartOtpTimer();
}

class OtpTimerTick extends OtpEvent {
  final int duration;

  const OtpTimerTick(this.duration);

  @override
  List<Object?> get props => [duration];
}

class VerifyOtp extends OtpEvent {
  final String otp;
  final String phoneNumber;
  final String dialCode;

  const VerifyOtp({
    required this.otp,
    required this.phoneNumber,
    required this.dialCode,
  });

  @override
  List<Object?> get props => [otp, phoneNumber, dialCode];
}

class ResendOtp extends OtpEvent {
  const ResendOtp();
}
