import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:health_sync_question/app/modules/auth/auth_mixin.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class ProfileSetupOptionsController extends GetxController with AuthMixin {
  final UserBindRequestModel? userBindingRequestModel = Get.arguments['user_bind'];

  void linkProfileClick() {
    Get.toNamed(Routes.USER_BINDINGS_LIST);
  }

  void createProfileClick() {
    Get.toNamed(Routes.CREATE_PROFILE);
  }

  Future<void> onRefresh() async {
    final userProfile = await appController.loadProfile();
    if (userProfile?.profile == null) return;
    if (userProfile!.currentRole?.role?.accountType ==
        AccountType.PATIENT.name) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      await fetchRoleList(isRoleSelection: false);
    }
  }
}
