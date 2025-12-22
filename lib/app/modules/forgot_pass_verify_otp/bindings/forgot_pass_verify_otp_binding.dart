import 'package:get/get.dart';

import '../controllers/forgot_pass_verify_otp_controller.dart';

class ForgotPassVerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPassVerifyOtpController>(
      () => ForgotPassVerifyOtpController(),
    );
  }
}
