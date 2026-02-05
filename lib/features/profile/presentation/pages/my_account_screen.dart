import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/profile/presentation/widgets/profile_list_item.dart';
import 'package:paper_x_flutter/features/profile/presentation/pages/profile_information_screen.dart';

/// My Account screen with user info and navigation items
class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'My Account',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColors.profileHeading,
                ),
              ),
              const SizedBox(height: 24),
              // User info card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileInformationScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Avatar.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Shikha Singh',
                              style: TextStyle(
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '+91 751000000',
                              style: TextStyle(
                                fontFamily: 'Figtree',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Navigation items
              ProfileListItem(
                iconPath: 'assets/images/profile/infinity.png',
                title: 'Infinity',
                onTap: () {
                  // TODO: Navigate to Infinity screen
                },
              ),
              ProfileListItem(
                iconPath: 'assets/images/profile/market-timing.png',
                title: 'Market Timings',
                onTap: () {
                  // TODO: Navigate to Market Timings screen
                },
              ),
              ProfileListItem(
                iconPath: 'assets/images/profile/password-manager.png',
                title: 'Password Manger',
                onTap: () {
                  // TODO: Navigate to Password Manager screen
                },
              ),
              ProfileListItem(
                iconPath: 'assets/images/profile/biometerics.png',
                title: 'Biometrics',
                onTap: () {
                  // TODO: Navigate to Biometrics screen
                },
              ),
              ProfileListItem(
                iconPath: 'assets/images/profile/Invite.png',
                title: 'Invite Friends',
                onTap: () {
                  // TODO: Navigate to Invite Friends screen
                },
              ),
              const Spacer(),
              // Log Out button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement logout logic
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/profile/logout.png',
                        width: 20,
                        height: 20,
                        color: AppColors.textWhite,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Log Out',
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
