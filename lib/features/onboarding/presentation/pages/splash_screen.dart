import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'onboarding_screen.dart';

/// Splash screen displaying PaperX logo and brand name
/// Auto-navigates to onboarding after 2 seconds
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          'assets/images/Intro-screen-logo.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
