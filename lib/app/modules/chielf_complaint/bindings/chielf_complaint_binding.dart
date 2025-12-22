import 'package:get/get.dart';

import '../controllers/chielf_complaint_controller.dart';

class ChielfComplaintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChiefComplaintController>(() => ChiefComplaintController());
  }
}
