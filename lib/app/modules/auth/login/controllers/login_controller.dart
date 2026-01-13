import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/role_list_response.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxList<RoleData> roleList = <RoleData>[].obs;
  final AuthRepository authRepository = AuthRepository();

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
          if (successRes.data?.user?.profile == null) {
            log('user bind ${successRes.data?.user?.userBindRequestId?.toJson()}');
            Get.toNamed(
              Routes.PROFILE_SETUP_OPTIONS,
              arguments: {
                'user_bind':successRes.data?.user?.userBindRequestId
              },
            );
          } else if (successRes.data?.user?.userRoles?.isEmpty ?? false) {
            await fetchRoleList();
          } else {
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

  Future<void> fetchRoleList({bool isRoleSelection = true}) async {
    Loading.show();
    final response = await authRepository.getRoleList();
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch role list');
      },
      (success) {
        roleList.value = success.data ?? [];
        success.data?.forEach((role) {
          if (role.accountType == AccountType.PATIENT.name) {
            if (isRoleSelection) {
              roleSelected(role);
            } else {
              switchRole(role);
            }
          }
        });
      },
    );
  }

  void roleSelected(RoleData role) async {
    Loading.show();
    final response = await authRepository.setUserCurrentRole(
      roleId: role.roleId ?? '',
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? "Failed to select role");
      },
      (success) async {
        final token = success.data?.accessToken ?? '';
        navigateToHome(accessToken: token);
      },
    );
  }

  void navigateToHome({String accessToken = ''}) async {
    await appController.setToken(accessToken);
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void switchRole(RoleData role) async {
    Loading.show();
    final response = await authRepository.switchRole(roleId: role.roleId ?? '');
    Loading.hide();

    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to switch role');
      },
      (success) async {
        final token = success.data?.accessToken ?? '';
        navigateToHome(accessToken: token);
      },
    );
  }
}
