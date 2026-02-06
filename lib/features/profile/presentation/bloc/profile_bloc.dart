import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateName>(_onUpdateName);
    on<UpdateDisplayName>(_onUpdateDisplayName);
    on<UpdateAvatar>(_onUpdateAvatar);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      // TODO: Load profile from repository
      await Future.delayed(const Duration(milliseconds: 500));

      emit(
        const ProfileLoaded(
          name: 'DEMO25',
          displayName: 'DEMO25',
          deviceName: 'I2405',
          versionCode: '1.6.6',
        ),
      );
    } catch (e) {
      emit(ProfileUpdateFailure(e.toString()));
    }
  }

  Future<void> _onUpdateName(
    UpdateName event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      try {
        // TODO: Update name in repository
        await Future.delayed(const Duration(milliseconds: 300));

        emit(currentState.copyWith(name: event.name));
      } catch (e) {
        emit(ProfileUpdateFailure(e.toString()));
      }
    }
  }

  Future<void> _onUpdateDisplayName(
    UpdateDisplayName event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      try {
        // TODO: Update display name in repository
        await Future.delayed(const Duration(milliseconds: 300));

        emit(currentState.copyWith(displayName: event.displayName));
      } catch (e) {
        emit(ProfileUpdateFailure(e.toString()));
      }
    }
  }

  Future<void> _onUpdateAvatar(
    UpdateAvatar event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    if (currentState is ProfileLoaded) {
      try {
        // TODO: Upload avatar to repository
        await Future.delayed(const Duration(milliseconds: 500));

        emit(currentState.copyWith(avatarPath: event.imagePath));
      } catch (e) {
        emit(ProfileUpdateFailure(e.toString()));
      }
    }
  }
}
