import 'package:get/get.dart';

import '../controllers/medical_history_list_controller.dart';

class MedicalHistoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicalHistoryListController>(
      () => MedicalHistoryListController(),
    );
  }
}
