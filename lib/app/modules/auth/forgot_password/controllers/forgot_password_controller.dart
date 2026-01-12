import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/utils/toaster.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRepository authRepository = AuthRepository();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onSendOtp() async {
    if (formKey.currentState?.validate() != true) return;

    Loading.show();

    final response = await authRepository.sendForgotPasswordOtp(
      phoneNumber: phoneController.text.trim(),
    );

    response.fold(
      (errorRes) {
        Loading.hide();
        Toaster.error(errorRes.message ?? "Failed to send OTP");
      },
      (successRes) {
        Loading.hide();
        Get.toNamed(
          Routes.FORGOT_PASS_VERIFY_OTP,
          arguments: {
            "phoneNumber": phoneController.text.trim(),
            "otpPrefix": successRes.data?.otpPrefix,
          },
        );
      },
    );
  }
}
