import 'package:get/get.dart';

import '../controllers/medical_history_details_controller.dart';

class MedicalHistoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalHistoryDetailsController>(
      () => MedicalHistoryDetailsController(),
    );
  }
}
