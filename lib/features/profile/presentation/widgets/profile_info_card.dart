import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable profile info card widget
class ProfileInfoCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEdit;

  const ProfileInfoCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 32, height: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (showEditIcon)
            GestureDetector(
              onTap: onEdit,
              child: Image.asset(
                'assets/images/profile/pencil.png',
                width: 40,
                height: 40,
                color: AppColors.primary,
              ),
            ),
        ],
      ),
    );
  }
}
