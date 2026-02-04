import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable custom dropdown widget with consistent styling
class CustomDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputFieldBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.textWhite,
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textWhite,
          ),
          dropdownColor: AppColors.inputFieldBackground,
          borderRadius: BorderRadius.circular(12),
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.textWhite,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
