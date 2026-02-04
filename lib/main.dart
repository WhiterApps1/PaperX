import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_theme.dart';
import 'package:paper_x_flutter/features/onboarding/presentation/pages/splash_screen.dart';

void main() {
  runApp(const PaperXApp());
}

class PaperXApp extends StatelessWidget {
  const PaperXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaperX',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
