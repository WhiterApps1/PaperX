import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paper_x_flutter/core/theme/app_colors.dart';
import 'package:paper_x_flutter/features/auth/data/auth_service.dart';
import 'success_screen.dart';


class OtpScreen extends StatefulWidget {
  final String dialCode;
  final String phnNum;
 

  const OtpScreen({
    super.key,
    required this.dialCode,
    required this.phnNum,

  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  bool _isLoading = false;
  bool _isError = false;

  bool get _isValid => _controller.text.length == 4;
  String get _phone => "${widget.dialCode}${widget.phnNum}";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_focus);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _verify() async {
    if (!_isValid) return;

    setState(() {
      _isLoading = true;
      _isError = false;
    });

    final ok =
        await MockAuthService().verifyCode(_phone,_controller.text.toString());

    if (!mounted) return;

    setState(() => _isLoading = false);

    if (ok) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SuccessScreen()),
      );
      if (mounted) Navigator.popUntil(context, (r) => r.isFirst);
    } else {
      setState(() => _isError = true);
    }
  }

  Future<void> _resend() async {
    setState(() => _isLoading = true);

    await MockAuthService().resendCode(_phone);

    if (!mounted) return;

    _controller.clear();
    setState(() {
      _isLoading = false;
      _isError = false;
    });

    FocusScope.of(context).requestFocus(_focus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: AppColors.primaryAccent),
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
            GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_focus),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (i) {
                  final isFilled = i < _controller.text.length;

                  final borderColor = _isError
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
                      border: Border.all(
                          color: borderColor, width: 2),
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
                onChanged: (_) {
                  if (_isError) {
                    setState(() => _isError = false);
                  }
                  setState(() {});
                },
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Text(
                  _isError ? 'Wrong OTP?' : "Didn't receive the OTP?",
                  style: TextStyle(
                    fontFamily: 'Figtree',
                    fontSize: 14,
                    color:
                        _isError ? Colors.red : const Color(0xffB7B7B7),
                  ),
                ),
                TextButton(
                  onPressed: _resend,
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isValid && !_isLoading ? _verify : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isValid
                      ? AppColors.primaryAccent
                      : Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
