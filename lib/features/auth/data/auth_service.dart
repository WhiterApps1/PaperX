import 'dart:async';

/// Authentication service abstraction used by the OTP screen.
/// Implement this interface to call your real backend.
abstract class AuthService {
  /// Send (or resend) an OTP to [phoneWithDial].
  Future<void> resendCode(String phoneWithDial);

  /// Verify a given [code] for [phoneWithDial].
  /// Returns `true` when verification succeeds, otherwise `false`.
  Future<bool> verifyCode(String phoneWithDial, String code);
}

/// A simple mock implementation that simulates network latency.
/// Replace this with your backend integration (HTTP/Firebase/etc.).
class MockAuthService implements AuthService {
  const MockAuthService();

  @override
  Future<void> resendCode(String phoneWithDial) async {
    await Future.delayed(const Duration(seconds: 1));
    // In a real implementation you would call your API here.
  }

  @override
  Future<bool> verifyCode(String phoneWithDial, String code) async {
    await Future.delayed(const Duration(seconds: 1));
    // For now the mock treats any 6-digit code as success. Change this logic
    // to call your backend and interpret the response.
    return code.trim().length == 4;
  }
}
