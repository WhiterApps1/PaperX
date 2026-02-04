import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable custom text field widget with consistent styling
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: 'Figtree',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.textWhite,
      ),
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
    );
  }
}
