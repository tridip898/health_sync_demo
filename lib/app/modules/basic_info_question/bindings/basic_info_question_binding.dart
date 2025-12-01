import 'package:get/get.dart';

import '../controllers/basic_info_question_controller.dart';

class BasicInfoQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInfoQuestionController>(
      () => BasicInfoQuestionController(),
    );
  }
}
