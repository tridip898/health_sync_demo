import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/utils/toaster.dart';
import '../../../../core/widgets/loading.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  bool get isAtLeast10Chars =>
      passwordController.text.trim().length >= 10;

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

    if (phoneNumber == null) {
      return;
    }

    if (otpToken == null) {
      Toaster.error("OTP token missing. Please verify again.");
      Get.offAllNamed(Routes.LOGIN);
    }

    passwordController.addListener(_onPasswordChanged);
    confirmPasswordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    isPasswordMatched = password.isNotEmpty && password == confirm;

    update();
  }
  void onResetPassword() async {
    if (otpToken == null) {
      return;
    }
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Toaster.error("Passwords do not match");
      return;
    }

    Loading.show();

    final response = await authRepository.resetNewPassword(
      tempToken: otpToken!,
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
