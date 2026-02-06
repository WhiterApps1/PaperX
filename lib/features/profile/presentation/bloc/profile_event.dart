part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile();
}

class UpdateName extends ProfileEvent {
  final String name;

  const UpdateName(this.name);

  @override
  List<Object?> get props => [name];
}

class UpdateDisplayName extends ProfileEvent {
  final String displayName;

  const UpdateDisplayName(this.displayName);

  @override
  List<Object?> get props => [displayName];
}

class UpdateAvatar extends ProfileEvent {
  final String imagePath;

  const UpdateAvatar(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}
