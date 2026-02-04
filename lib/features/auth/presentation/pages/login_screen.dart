import 'package:flutter/material.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:paper_x_flutter/features/auth/presentation/widgets/custom_dropdown.dart';
import 'sign_in_screen.dart';

/// Login screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedServer;
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo
              Image.asset('assets/images/logo.png', width: 280, height: 280),
              const SizedBox(height: 40),
              // Server dropdown
              CustomDropdown(
                hint: 'Select Server',
                value: selectedServer,
                items: const ['Demo', 'Production', 'Test'],
                onChanged: (value) {
                  setState(() {
                    selectedServer = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Name field
              const CustomTextField(hintText: 'Name'),
              const SizedBox(height: 16),
              // Password field
              CustomTextField(
                hintText: 'Set password',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textWhite,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Remember me and Forgot password row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          fillColor: MaterialStateProperty.resolveWith((
                            states,
                          ) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors.primary;
                            }
                            return AppColors.inputFieldBackground;
                          }),
                          side: const BorderSide(color: AppColors.textGray),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to forgot password screen
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Login button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement login logic
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Signup link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't have an account? ",
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textGray,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
