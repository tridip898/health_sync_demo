import 'package:get/get.dart';

import '../controllers/prescription_history_details_controller.dart';

class PrescriptionHistoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrescriptionHistoryDetailsController>(
      () => PrescriptionHistoryDetailsController(),
    );
  }
}
