import 'package:get/get.dart';

import '../controllers/user_bindings_list_controller.dart';

class UserBindingsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserBindingsListController>(
      () => UserBindingsListController(),
    );
  }
}
