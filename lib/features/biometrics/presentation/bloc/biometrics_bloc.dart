import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'biometrics_event.dart';
part 'biometrics_state.dart';

class BiometricsBloc extends Bloc<BiometricsEvent, BiometricsState> {
  BiometricsBloc() : super(const BiometricsState(isEnabled: false)) {
    on<ToggleBiometrics>(_onToggleBiometrics);
  }

  void _onToggleBiometrics(
    ToggleBiometrics event,
    Emitter<BiometricsState> emit,
  ) {
    emit(BiometricsState(isEnabled: !state.isEnabled));
  }
}
