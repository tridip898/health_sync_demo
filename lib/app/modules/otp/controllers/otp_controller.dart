import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSetNewOtp() {
    Get.toNamed(Routes.SET_NEW_PASSWORD);
  }
}

