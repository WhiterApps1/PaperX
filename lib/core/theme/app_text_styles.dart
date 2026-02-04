import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized text styles using Figtree font family
/// Performance-optimized with const constructors
class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  // Base font family
  static const String _fontFamily = 'Figtree';

  // Figtree Bold (700) - For app name/branding
  static const TextStyle figtreeBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  // Figtree SemiBold (600) - For links and emphasis
  static const TextStyle figtreeSemiBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  // Figtree Medium (500) - For buttons and headings
  static const TextStyle figtreeMedium = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.textWhite,
  );

  // Figtree Regular (400) - For body text
  static const TextStyle figtreeRegular = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.textWhite,
  );

  // Figtree Light (300) - For secondary text
  static const TextStyle figtreeLight = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    color: AppColors.textGray,
  );

  // Specific use case styles
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppColors.primaryAccent,
  );

  static const TextStyle skipButton = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.textLightGray,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: AppColors.textWhite,
  );

  static const TextStyle description = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: AppColors.textGray,
    height: 1.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.buttonText,
  );

  static const TextStyle linkText = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.primary,
  );
}
