import 'dart:async';

import 'package:get/get.dart';

import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class ForgotPassVerifyOtpController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  final RxString otp = ''.obs;
  final RxString otpPrefix = ''.obs;

  final RxInt remainingSeconds = 60.obs;
  final RxBool canResend = false.obs;

  String? phoneNumber;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    phoneNumber = Get.arguments['phoneNumber'];
    otpPrefix.value = Get.arguments['otpPrefix'] ?? 'OTP';

    _startTimer();
  }

  // OTP input
  void onOtpChanged(String value) {
    otp.value = value;
  }

  // Countdown timer
  void _startTimer() {
    _timer?.cancel();

    remainingSeconds.value = 60;
    canResend.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value == 0) {
        canResend.value = true;
        timer.cancel();
      } else {
        remainingSeconds.value--;
      }
    });
  }

  String get maskedPhone {
    if (phoneNumber == null) return '';

    final phone = phoneNumber!;
    if (phone.length < 6) return phone;

    return phone.replaceRange(3, phone.length - 2, '******');
  }

  // Verify OTP
  void onVerifyOtp() async {
    if (otp.value.length != 4) {
      Toaster.error("Please enter valid OTP");
      return;
    }

    if (phoneNumber == null) {
      Toaster.error("Phone number missing");
      return;
    }

    Loading.show();

    final response = await authRepository.verifyOtp(
      phoneNumber: phoneNumber!, // safe now
      otp: otp.value,
    );

    Loading.hide();

    response.fold(
      (error) {
        Toaster.error(error.message ?? "Invalid or expired OTP");
      },
      (success) {
        final token = success.data?.otpToken;

        if (token == null || token.isEmpty) {
          Toaster.error("OTP token missing");
          return;
        }

        Get.toNamed(
          Routes.CHANGE_PASSWORD,
          arguments: {"phoneNumber": phoneNumber!, "otpToken": token},
        );
      },
    );
  }

  Future<void> onResendOtp() async {
    if (!canResend.value) return;

    if (phoneNumber == null) {
      Toaster.error("Phone number missing");
      return;
    }

    Loading.show();

    final response = await authRepository.sendForgotPasswordOtp(
      phoneNumber: phoneNumber!,
    );

    Loading.hide();

    response.fold(
          (error) {
        Toaster.error(error.message ?? "Failed to resend OTP");
      },
          (success) {
        final prefix = success.data?.otpPrefix;
        if (prefix != null && prefix.isNotEmpty) {
          otpPrefix.value = prefix;
        }

        _startTimer();
        Toaster.success("OTP resent successfully");
      },
    );
  }


  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
