import 'package:get/get.dart';

import '../controllers/profile_setup_options_controller.dart';

class ProfileSetupOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSetupOptionsController>(
      () => ProfileSetupOptionsController(),
    );
  }
}
