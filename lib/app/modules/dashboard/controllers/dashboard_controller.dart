import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  @override
  void onReady() {
    appController.loadProfile();
    super.onReady();
  }

  void onAnalyzeMySymptomTap() {
    Get.toNamed(Routes.COMPLAINT, arguments: {"isCategorySelector": true});
  }
}
