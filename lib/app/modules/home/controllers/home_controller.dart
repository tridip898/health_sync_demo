import 'package:get/get.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  void nextClick() {
    Get.toNamed(Routes.BASIC_INFO_QUESTION);
  }
}
