import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/core/widgets/custom_button.dart';
import 'package:paper_x_flutter/features/auth/presentation/bloc/otp_bloc.dart';
import 'success_screen.dart';

/// OTP verification screen with BL oC state management
class OtpScreen extends StatelessWidget {
  final String dialCode;
  final String phnNum;

  const OtpScreen({super.key, required this.dialCode, required this.phnNum});

  String get _phone => "$dialCode$phnNum";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpBloc()..add(const StartOtpTimer()),
      child: Scaffold(
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
        body: BlocListener<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SuccessScreen()),
              );
            }
          },
          child: _OtpForm(phone: _phone),
        ),
      ),
    );
  }
}

class _OtpForm extends StatefulWidget {
  final String phone;

  const _OtpForm({required this.phone});

  @override
  State<_OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<_OtpForm> {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted) {
        FocusScope.of(context).requestFocus(_focus);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _verify(BuildContext context) {
    context.read<OtpBloc>().add(
      VerifyOtp(otp: _controller.text, phoneNumber: widget.phone, dialCode: ''),
    );
  }

  void _resend(BuildContext context) {
    _controller.clear();
    context.read<OtpBloc>().add(const ResendOtp());
    FocusScope.of(context).requestFocus(_focus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Verification Code',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'We have sent the verification code to your mobile number',
            style: TextStyle(
              fontFamily: 'Figtree',
              fontSize: 14,
              color: Color(0xffB7B7B7),
            ),
          ),
          const SizedBox(height: 28),

          /// OTP BOXES
          BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              final isError = state is OtpFailure;

              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_focus),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (i) {
                    final isFilled = i < _controller.text.length;

                    final borderColor = isError
                        ? Colors.red
                        : isFilled
                        ? AppColors.primaryAccent
                        : const Color(0xFF4D4D4D);

                    return Container(
                      width: 64,
                      height: 64,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: borderColor, width: 2),
                      ),
                      child: Text(
                        isFilled ? _controller.text[i] : '',
                        style: const TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),

          /// Hidden input
          Opacity(
            opacity: 0,
            child: TextField(
              focusNode: _focus,
              controller: _controller,
              keyboardType: TextInputType.number,
              cursorColor: Colors.transparent,
              showCursor: false,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              onChanged: (_) => setState(() {}),
            ),
          ),

          const SizedBox(height: 20),

          BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              final isError = state is OtpFailure;
              final isResending = state is OtpResending;

              return Row(
                children: [
                  Text(
                    isError ? 'Wrong OTP?' : "Didn't receive the OTP?",
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontSize: 14,
                      color: isError ? Colors.red : const Color(0xffB7B7B7),
                    ),
                  ),
                  TextButton(
                    onPressed: isResending ? null : () => _resend(context),
                    child: Text(
                      isResending ? 'Sending...' : 'Resend',
                      style: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                  if (state is OtpTimerRunning) ...[
                    const Spacer(),
                    Text(
                      _formatTime(state.remainingSeconds),
                      style: const TextStyle(
                        fontFamily: 'Figtree',
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),

          const Spacer(),

          CustomButton(text: 'Submit', onPressed: () => _verify(context)),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
