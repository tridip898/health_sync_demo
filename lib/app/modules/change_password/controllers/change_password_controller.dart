import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  late final String otpToken;
  late final String phoneNumber;

  @override
  void onInit() {
    super.onInit();

    phoneNumber = Get.arguments['phoneNumber'];
    otpToken = Get.arguments['otpToken'];

    if (otpToken.isEmpty) {
      Toaster.error("OTP token missing. Please verify again.");
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void onResetPassword() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Toaster.error("Passwords do not match");
      return;
    }

    Loading.show();

    final response = await authRepository.resetNewPassword(
      tempToken: otpToken,
      password: passwordController.text.trim(),
    );
    Loading.hide();
    response.fold(
          (error) {
        Toaster.error(error.message ?? "Failed to reset password");
      },
          (success) {
        Get.until(appController.toLogInScreen());
        Toaster.success(success.message ?? "Password set successfully");
      },
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
