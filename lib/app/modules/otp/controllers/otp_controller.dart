import 'package:get/get.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class OtpController extends GetxController {
  final AuthRepository authRepository = AuthRepository();

  final RxString otp = ''.obs;
  late final String phoneNumber;

  @override
  void onInit() {
    super.onInit();
    phoneNumber = Get.arguments['phoneNumber'];
  }

  void onOtpChanged(String value) {
    otp.value = value;
  }

  void onVerifyOtp() async {
    if (otp.value.length != 4) {
      Toaster.error("Please enter valid OTP");
      return;
    }

    Loading.show();

    final response = await authRepository.verifyOtp(
      phoneNumber: phoneNumber,
      otp: otp.value,
    );
    Loading.hide();
    response.fold(
      (errorRes) {

        Toaster.error(errorRes.message ?? "Invalid or expired OTP");
      },
      (successRes) {

        Get.toNamed(
          Routes.SET_NEW_PASSWORD,
          arguments: {
            "phoneNumber": phoneNumber,
            "otpToken": successRes.data?.otpToken,
          },
        );
      },
    );
  }
}
