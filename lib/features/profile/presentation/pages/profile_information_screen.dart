import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:paper_x_flutter/features/profile/presentation/widgets/profile_info_card.dart';

/// Profile Information screen with BLoC state management
class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const LoadProfile()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Profile Information',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColors.profileHeading,
            ),
          ),
        ),
        body: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully')),
              );
            } else if (state is ProfileUpdateFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: const _ProfileContent(),
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  Future<void> _pickImage(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null && context.mounted) {
        context.read<ProfileBloc>().add(UpdateAvatar(image.path));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
      }
    }
  }

  Future<void> _showEditDialog(
    BuildContext context,
    String title,
    String currentValue,
    Function(String) onSave,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: currentValue,
    );

    return showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Edit $title',
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColors.profileHeading,
            ),
          ),
          content: TextField(
            controller: controller,
            autofocus: true,
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.textWhite,
            ),
            decoration: InputDecoration(
              hintText: 'Enter $title',
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.textGray,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  onSave(controller.text.trim());
                  Navigator.pop(dialogContext);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                final name = state is ProfileLoaded ? state.name : 'DEMO25';
                final displayName = state is ProfileLoaded
                    ? state.displayName
                    : 'DEMO25';
                final avatarPath = state is ProfileLoaded
                    ? state.avatarPath
                    : null;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Avatar with camera icon
                      GestureDetector(
                        onTap: () => _pickImage(context),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 180,
                              child: ClipOval(
                                child: Image.asset(
                                  avatarPath ??
                                      'assets/images/profile/Ellipse 2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -1,
                              right: -1,
                              child: GestureDetector(
                                onTap: () => _pickImage(context),
                                child: Image.asset(
                                  'assets/images/profile/solar_camera-minimalistic-bold.png',
                                  width: 48,
                                  height: 48,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Profile fields
                      ProfileInfoCard(
                        iconPath: 'assets/images/profile/profile.png',
                        label: 'Name',
                        value: name,
                        showEditIcon: true,
                        onEdit: () => _showEditDialog(context, 'Name', name, (
                          newValue,
                        ) {
                          context.read<ProfileBloc>().add(UpdateName(newValue));
                        }),
                      ),
                      ProfileInfoCard(
                        iconPath: 'assets/images/profile/profile.png',
                        label: 'Display Name',
                        value: displayName,
                        showEditIcon: true,
                        onEdit: () => _showEditDialog(
                          context,
                          'Display Name',
                          displayName,
                          (newValue) {
                            context.read<ProfileBloc>().add(
                              UpdateDisplayName(newValue),
                            );
                          },
                        ),
                      ),
                      const ProfileInfoCard(
                        iconPath: 'assets/images/profile/profile.png',
                        label: 'Device Name',
                        value: 'I2405',
                      ),
                      const ProfileInfoCard(
                        iconPath: 'assets/images/profile/profile.png',
                        label: 'Version Code',
                        value: '1.6.6',
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Delete Account button - aligned to bottom
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement delete account logic
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/profile/delete.png',
                      width: 20,
                      height: 20,
                      color: AppColors.textWhite,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Delete Account',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
