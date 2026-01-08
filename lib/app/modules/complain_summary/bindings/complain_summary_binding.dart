import 'package:get/get.dart';

import '../controllers/complain_summary_controller.dart';

class ComplainSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplainSummaryController>(
      () => ComplainSummaryController(),
    );
  }
}
