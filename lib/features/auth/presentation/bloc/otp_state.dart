part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {
  const OtpInitial();
}

class OtpTimerRunning extends OtpState {
  final int remainingSeconds;

  const OtpTimerRunning(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}

class OtpTimerExpired extends OtpState {
  const OtpTimerExpired();
}

class OtpVerifying extends OtpState {
  const OtpVerifying();
}

class OtpSuccess extends OtpState {
  const OtpSuccess();
}

class OtpFailure extends OtpState {
  final String message;

  const OtpFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class OtpResending extends OtpState {
  const OtpResending();
}
