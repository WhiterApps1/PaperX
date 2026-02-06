part of 'biometrics_bloc.dart';

abstract class BiometricsEvent extends Equatable {
  const BiometricsEvent();

  @override
  List<Object?> get props => [];
}

class ToggleBiometrics extends BiometricsEvent {
  const ToggleBiometrics();
}
