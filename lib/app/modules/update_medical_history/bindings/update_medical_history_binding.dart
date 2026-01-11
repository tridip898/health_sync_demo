import 'package:get/get.dart';

import '../controllers/update_medical_history_controller.dart';

class UpdateMedicalHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateMedicalHistoryController>(
      () => UpdateMedicalHistoryController(),
    );
  }
}
