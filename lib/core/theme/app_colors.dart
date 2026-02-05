import 'package:flutter/material.dart';

/// Centralized color palette for PaperX application
/// Following the design specification for consistent branding
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Background
  static const Color background = Color(0xFF1E1E1E);

  // Primary Brand Colors
  static const Color primary = Color(0xFF0096A6);
  static const Color primaryAccent = Color(0xFF429DA3);

  // Text Colors
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFFB7B7B7);
  static const Color textLightGray = Color(0xFFE4E4E4);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF0096A6);
  static const Color buttonText = Color(0xFFFFFFFF);

  // Input Field Colors
  static const Color inputFieldBackground = Color(0xFF4D4D4D);

  // Material 3 Colors for Profile
  static const Color profileHeading = Color(0xFFE8E8E8);
  static const Color onSurface = Color(0xFF1D1B20);
  static const Color onSurfaceVariant = Color(0xFF49454F);
  static const Color iconGold = Color(0xFF8C7032);
}
