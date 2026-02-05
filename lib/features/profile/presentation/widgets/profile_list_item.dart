import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable profile list item widget
class ProfileListItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback? onTap;
  final bool showChevron;

  const ProfileListItem({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          color: AppColors.iconGold,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        trailing: showChevron
            ? const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant)
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
