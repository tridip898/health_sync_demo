import 'package:get/get.dart';

import '../controllers/delete_medical_history_controller.dart';

class DeleteMedicalHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteMedicalHistoryController>(
      () => DeleteMedicalHistoryController(),
    );
  }
}
