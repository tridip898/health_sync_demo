import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/binding_user_list_response_model.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/modules/auth/auth_mixin.dart';
import 'package:health_sync_question/app/modules/auth/login/controllers/login_controller.dart';
import 'package:health_sync_question/app/modules/auth/user_bindings_list/widgets/link_user_dialog.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class UserBindingsListController extends GetxController with AuthMixin {
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController searchController = TextEditingController();
  final RxList<ProfileModel> bindingUserList = <ProfileModel>[].obs;
  final RxList<ProfileModel> filteredBindingUserList = <ProfileModel>[].obs;
  final RxBool isLoading = true.obs;
  final Rx<ProfileModel> selectedUser = ProfileModel().obs;

  @override
  void onInit() {
    searchController.addListener(() {
      return searchUser(searchController.text);
    });
    super.onInit();
  }

  @override
  void onReady() async {
    fetchBindingUserList();
    super.onReady();
  }

  void fetchBindingUserList() async {
    Loading.show();
    final response = await _authRepository.getUserBindingList();
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch binding user list');
      },
      (success) {
        bindingUserList.value = success.data ?? [];
        filteredBindingUserList.addAll(bindingUserList);
      },
    );
    isLoading.value = false;
  }

  void selectUser(ProfileModel user) {
    selectedUser.value = user;
    Get.dialog(
      Dialog(
        child: LinkUserDialog(
          user: user,
          confirmTap: () {
            bindingUserProfile(user.profileId);
          },
        ),
      ),
    );
  }

  void bindingUserProfile(String? profileId) async {
    Loading.show();
    final response = await _authRepository.createUserBinding(
      profileId: profileId ?? '',
    );
    Loading.hide();
    Get.back();
    await response.fold(
      (error) async {
        Toaster.error(error.message ?? 'Failed to bind user profile');
      },
      (success) async {
        Toaster.success('User profile linked successfully');

        if (Get.isRegistered<LoginController>()) {
          final loginData = Get.find<LoginController>().loginData.value;

          if (loginData != null) {
            if (loginData.user?.userRoles?.isEmpty ?? false) {
              await fetchRoleList();
            } else {
              await appController.loadProfile();
              if (appController
                      .userModel
                      .value
                      ?.currentRole
                      ?.role
                      ?.accountType ==
                  AccountType.PATIENT.name) {
                navigateToHome(accessToken: loginData.accessToken ?? '');
              } else {
                await fetchRoleList(isRoleSelection: false);
              }
            }
          } else {
            Get.until((route) => Get.currentRoute == Routes.LOGIN);
          }
        }
      },
    );
  }

  void searchUser(String text) {
    List<ProfileModel> result = [];
    if (text.isEmpty) {
      result = filteredBindingUserList;
    } else {
      result = filteredBindingUserList
          .where(
            (user) => user.fullName!.toLowerCase().contains(text.toLowerCase()),
          )
          .toList();
    }
    bindingUserList.value = result;
  }
}
