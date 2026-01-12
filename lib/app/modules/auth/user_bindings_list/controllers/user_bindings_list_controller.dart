import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/binding_user_list_response_model.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/modules/auth/user_bindings_list/widgets/link_user_dialog.dart';

class UserBindingsListController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final RxList<BindingUserModel> bindingUserList = <BindingUserModel>[].obs;
  final RxBool isLoading = true.obs;
  final Rx<BindingUserModel> selectedUser = BindingUserModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    fetchBindingUserList();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
      },
    );
    isLoading.value = false;
  }

  void selectUser(BindingUserModel user) {
    selectedUser.value = user;
    Get.dialog(
      Dialog(
        child: LinkUserDialog(user: user),
      ),
    );
  }
}
