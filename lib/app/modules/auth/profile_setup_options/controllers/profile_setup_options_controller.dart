import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/user_model.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class ProfileSetupOptionsController extends GetxController {
  final UserBindRequestId? isUserBindingExist = Get.arguments['user_bind'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void linkProfileClick() {
    Get.toNamed(Routes.USER_BINDINGS_LIST);
  }

  void createProfileClick() {
    Get.toNamed(Routes.CREATE_PROFILE);
  }
}
