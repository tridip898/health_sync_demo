import 'package:get/get.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class DoctorDetailsController extends GetxController {
  final doctorModel = Get.arguments?['doctor'];

  void onBookAppointment() {
    Get.toNamed(Routes.COMPLAINT);
  }
}
