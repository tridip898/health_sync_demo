import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  
  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onSendOtp() {
  }
}
