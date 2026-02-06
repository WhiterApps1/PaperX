part of 'biometrics_bloc.dart';

class BiometricsState extends Equatable {
  final bool isEnabled;

  const BiometricsState({required this.isEnabled});

  @override
  List<Object?> get props => [isEnabled];
}
