import 'package:get/get.dart';

import '../controllers/dummy_page_controller.dart';

class DummyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DummyPageController>(
      () => DummyPageController(),
    );
  }
}
