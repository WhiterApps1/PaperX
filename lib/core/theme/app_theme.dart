import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Application theme configuration
/// Provides consistent Material theme across the app
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,

      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryAccent,
        surface: AppColors.background,
        background: AppColors.background,
      ),

      // Text theme
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.figtreeBold,
        displayMedium: AppTextStyles.figtreeBold,
        displaySmall: AppTextStyles.figtreeBold,
        headlineLarge: AppTextStyles.figtreeSemiBold,
        headlineMedium: AppTextStyles.figtreeMedium,
        headlineSmall: AppTextStyles.figtreeMedium,
        titleLarge: AppTextStyles.figtreeMedium,
        titleMedium: AppTextStyles.figtreeMedium,
        titleSmall: AppTextStyles.figtreeMedium,
        bodyLarge: AppTextStyles.figtreeRegular,
        bodyMedium: AppTextStyles.figtreeRegular,
        bodySmall: AppTextStyles.figtreeLight,
        labelLarge: AppTextStyles.figtreeMedium,
        labelMedium: AppTextStyles.figtreeRegular,
        labelSmall: AppTextStyles.figtreeLight,
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.appBarTitle,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonText,
          textStyle: AppTextStyles.buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.linkText,
        ),
      ),
    );
  }
}
