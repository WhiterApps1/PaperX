import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/biometrics/presentation/bloc/biometrics_bloc.dart';

class BiometricsScreen extends StatelessWidget {
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BiometricsBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Biometrics',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textWhite,
            ),
          ),
        ),
        body: const SafeArea(child: _BiometricsContent()),
      ),
    );
  }
}

class _BiometricsContent extends StatelessWidget {
  const _BiometricsContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiometricsBloc, BiometricsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Biometrics image
              Container(
                width: 360,
                height: 360,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/biometrics_shield.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Heading
              const Text(
                'Enable 2FA security',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Figtree',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: AppColors.textWhite,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Enable biometrics device lock on the app for 2Factor security. This is mandatory as per new exchange regulations.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.textGray,
                    height: 1.5,
                  ),
                ),
              ),

              const Spacer(),

              // Action button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<BiometricsBloc>().add(
                      const ToggleBiometrics(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.isEnabled
                        ? const Color(0xFFFF5757)
                        : AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    state.isEnabled ? 'Disable Now' : 'Enable Now',
                    style: const TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
