import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  
  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onSendOtp() {
    Get.toNamed(Routes.OTP);
  }
}
