import 'package:get/get.dart';

import '../controllers/crate_medical_history_controller.dart';

class CrateMedicalHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrateMedicalHistoryController>(
      () => CrateMedicalHistoryController(),
    );
  }
}
