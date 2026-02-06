import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable custom dropdown widget for Market Timings and other screens
class CustomMarketDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final bool isOpen;
  final VoidCallback onToggle;
  final String? selectedItem;

  const CustomMarketDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.isOpen,
    required this.onToggle,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown button
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.inputFieldBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value ?? hint,
                  style: const TextStyle(
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.textWhite,
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.textWhite,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Dropdown overlay
        if (isOpen)
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              color: AppColors.textWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = selectedItem == item;

                return InkWell(
                  onTap: () => onChanged(item),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFA2F6FF)
                          : Colors.transparent,
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
