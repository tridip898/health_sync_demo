import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRepository authRepository = AuthRepository();

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onLogin() async {
    if (formKey.currentState?.validate() == true) {
      Loading.show();
      final response = await authRepository.login(
        phoneNumber: phoneController.text,
        password: passwordController.text,
      );
      Loading.hide();

      response.fold(
        (errorRes) {
          Toaster.error(errorRes.message ?? "Login failed");
        },
        (successRes) {
          appController.setToken(successRes.data?.accessToken ?? '');
          Get.offAllNamed(Routes.DASHBOARD);
        },
      );
    }
  }

  onRegisterTap() {
    Get.toNamed(Routes.REGISTRATION);
  }

  onForgotPasswordTap() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }
}
