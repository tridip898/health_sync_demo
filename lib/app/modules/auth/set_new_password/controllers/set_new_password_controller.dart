import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/utils/toaster.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class SetNewPasswordController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? otpToken;
  String? phoneNumber;
  bool isPasswordMatched = false;

  @override
  void onInit() {
    super.onInit();

    phoneNumber = Get.arguments['phoneNumber'];
    otpToken = Get.arguments['otpToken'];

    if (otpToken == null) {
      Toaster.error("OTP token missing. Please verify again.");
      Get.offAllNamed(Routes.LOGIN);
    }

    passwordController.addListener(_checkPasswordMatch);
    confirmPasswordController.addListener(_checkPasswordMatch);
  }

  void SetPassword() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Toaster.error("Passwords do not match");
      return;
    }
    if (otpToken == null) {
      return;
    }

    Loading.show();

    final response = await authRepository.setNewPassword(
      tempToken: otpToken!,
      password: passwordController.text.trim(),
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? "Failed to reset password");
      },
      (success) {
        appController.toLogInScreen();
        Toaster.success(success.message ?? "Password set successfully");
      },
    );
  }

  void _checkPasswordMatch() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    final matched =
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword;

    if (matched != isPasswordMatched) {
      isPasswordMatched = matched;
      update();
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
