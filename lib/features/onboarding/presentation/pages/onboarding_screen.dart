import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Main onboarding screen with branding and sign-in CTA
/// Clean design with focus on the logo
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'PaperX',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.primaryAccent,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Navigate to main app or skip onboarding
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: AppColors.textLightGray,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo - clean and larger
              Image.asset(
                'assets/images/sign-in-logo-1.png',
                width: 280,
                height: 280,
              ),
              const SizedBox(height: 48),
              // Heading
              const Text(
                'Invest Smarter, Grow Faster',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: AppColors.textWhite,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Description
              const Text(
                'Trade stocks, monitor market trends, and get expert insights, all from a single powerful platform.',
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: AppColors.textGray,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Sign In button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to sign-in screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary,
                    foregroundColor: AppColors.buttonText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Login link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to login screen
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
