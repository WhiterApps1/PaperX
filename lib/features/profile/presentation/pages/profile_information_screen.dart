import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/profile/presentation/widgets/profile_info_card.dart';

/// Profile Information screen with editable profile fields
class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final ImagePicker _picker = ImagePicker();
  String _name = 'DEMO25';
  String _displayName = 'DEMO25';

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );
      if (image != null) {
        // TODO: Upload image and update avatar
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image selected successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
      }
    }
  }

  Future<void> _showEditDialog(
    String title,
    String currentValue,
    Function(String) onSave,
  ) async {
    final TextEditingController controller = TextEditingController(
      text: currentValue,
    );

    return showDialog(
      context: context,
      builder: (context) {
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
              onPressed: () => Navigator.pop(context),
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
                  Navigator.pop(context);
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
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Avatar with camera icon
                    GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            // decoration: BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile/Ellipse 2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -1,
                            right: -1,
                            child: GestureDetector(
                              onTap: _pickImage,
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
                      value: _name,
                      showEditIcon: true,
                      onEdit: () => _showEditDialog('Name', _name, (newValue) {
                        setState(() {
                          _name = newValue;
                        });
                      }),
                    ),
                    ProfileInfoCard(
                      iconPath: 'assets/images/profile/profile.png',
                      label: 'Display Name',
                      value: _displayName,
                      showEditIcon: true,
                      onEdit: () => _showEditDialog(
                        'Display Name',
                        _displayName,
                        (newValue) {
                          setState(() {
                            _displayName = newValue;
                          });
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
      ),
    );
  }
}
