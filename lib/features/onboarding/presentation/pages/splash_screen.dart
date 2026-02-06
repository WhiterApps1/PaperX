import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/onboarding/presentation/bloc/splash_bloc.dart';
import 'onboarding_screen.dart';

/// Splash screen displaying PaperX logo
/// Auto-navigates to onboarding after 3 seconds
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(const StartSplashTimer()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashComplete) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Center(
            child: Image.asset(
              'assets/images/Intro-screen-logo.png',
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
