import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/login_response_model.dart';
import 'package:health_sync_question/app/data/model/role_list_response.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/modules/auth/auth_mixin.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class LoginController extends GetxController with AuthMixin {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<LoginData?> loginData = Rx(null);

  @override
  void onInit() {
    phoneController.text = '01731109791';
    passwordController.text = '1234567890';
    super.onInit();
  }

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
        (successRes) async {
          await appController.setToken(successRes.data?.accessToken ?? '');
          loginData.value = successRes.data;

          /// user has no profile
          if (successRes.data?.user?.profile == null) {
            await appController.loadProfile();
            Get.toNamed(
              Routes.PROFILE_SETUP_OPTIONS,
              arguments: {
                'user_bind': successRes.data?.user?.userBindRequestId,
              },
            );
          }
          /// user has a profile but no role
          else if (successRes.data?.user?.userRoles?.isEmpty ?? false) {
            await fetchRoleList();
          }
          /// user has a profile and role
          else {
            await appController.loadProfile();
            if (appController.userModel.value?.currentRole?.role?.accountType ==
                AccountType.PATIENT.name) {
              navigateToHome(accessToken: successRes.data?.accessToken ?? '');
            } else {
              await fetchRoleList(isRoleSelection: false);
            }
          }
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
