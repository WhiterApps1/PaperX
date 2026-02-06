import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';

/// Reusable widget to display market timing information
class MarketTimingCard extends StatelessWidget {
  final DateTime selectedDate;
  final String timingText;

  const MarketTimingCard({
    super.key,
    required this.selectedDate,
    required this.timingText,
  });

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = DateFormat('EEE').format(selectedDate).toUpperCase();
    final dayOfMonth = selectedDate.day.toString();

    return Row(
      children: [
        // Day box
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                dayOfWeek,
                style: const TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textWhite,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dayOfMonth,
                style: const TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Timing box
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF24B329),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              timingText,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
