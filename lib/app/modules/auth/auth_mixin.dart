import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/controller/app_controller.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/role_list_response.dart';
import 'package:health_sync_question/app/data/repository/auth_repository.dart';
import 'package:health_sync_question/app/modules/auth/login/controllers/login_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

mixin AuthMixin {
  final AuthRepository authRepository = AuthRepository();
  final AppController appController = Get.find<AppController>();

  Future<void> fetchRoleList({bool isRoleSelection = true}) async {
    Loading.show();
    final response = await authRepository.getRoleList();
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch role list');
      },
      (success) {
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
    if (accessToken.isNotEmpty) {
      await appController.setToken(accessToken);
    }
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

  navigateAfterProfileAction() async {
    if (Get.isRegistered<LoginController>()) {
      final loginData = Get.find<LoginController>().loginData.value;

      if (loginData != null) {
        if (loginData.user?.userRoles?.isEmpty ?? false) {
          await fetchRoleList();
        } else {
          await appController.loadProfile();
          if (appController.userModel.value?.currentRole?.role?.accountType ==
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
  }
}
