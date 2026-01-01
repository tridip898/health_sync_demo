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
  final RxBool isOtpError = false.obs;

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

  // OTP input jonno
  void onOtpChanged(String value) {
    otp.value = value;
  }

  // Countdown timer start hobe
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

    return phone;
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
      phoneNumber: phoneNumber!,
      otp: otp.value,
    );

    Loading.hide();

    response.fold(
      (error) {
        Toaster.error(error.message ?? "Invalid or expired OTP");
        isOtpError.value = true;
      },
      (success) {
        isOtpError.value = false;
        Get.toNamed(
          Routes.SET_NEW_PASSWORD,
          arguments: {
            "phoneNumber": phoneNumber,
            "otpToken": success.data?.otpToken,
          },
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

    final response = await authRepository.sendRegistrationOtp(
      phoneNumber: phoneNumber!,
    );

    Loading.hide();

    response.fold(
      (error) {
        Toaster.error(error.message ?? "Failed to resend OTP");
      },
      (success) {
        otpPrefix.value = success.data?.otpPrefix ?? otpPrefix.value;

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
