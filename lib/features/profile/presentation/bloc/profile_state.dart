part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final String name;
  final String displayName;
  final String deviceName;
  final String versionCode;
  final String? avatarPath;

  const ProfileLoaded({
    required this.name,
    required this.displayName,
    required this.deviceName,
    required this.versionCode,
    this.avatarPath,
  });

  ProfileLoaded copyWith({
    String? name,
    String? displayName,
    String? deviceName,
    String? versionCode,
    String? avatarPath,
  }) {
    return ProfileLoaded(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      deviceName: deviceName ?? this.deviceName,
      versionCode: versionCode ?? this.versionCode,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }

  @override
  List<Object?> get props => [
    name,
    displayName,
    deviceName,
    versionCode,
    avatarPath,
  ];
}

class ProfileUpdateFailure extends ProfileState {
  final String message;

  const ProfileUpdateFailure(this.message);

  @override
  List<Object?> get props => [message];
}
