import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/profile/presentation/pages/my_account_screen.dart';

class SuccessScreen extends StatelessWidget {
  final VoidCallback? onContinue;

  const SuccessScreen({super.key, this.onContinue});

  @override
  Widget build(BuildContext context) {
    const Color gold = Color(0xFFB78D2E);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryAccent),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'PaperX',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.primaryAccent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),

            /// Gold circle with check
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2A2418),
                border: Border.all(color: gold, width: 3),
              ),
              child: const Center(
                child: Icon(Icons.check, size: 48, color: gold),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Success!',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: gold,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              'Congratulations! You have been\nsuccessfully authenticated',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 15,
                color: Colors.white,
                height: 1.5,
              ),
            ),

            const Spacer(),

            /// Continue Button
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  if (onContinue != null) onContinue!();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const MyAccountScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Figtree',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
