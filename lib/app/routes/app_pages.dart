import 'package:get/get.dart';

import '../modules/basic_info_question/bindings/basic_info_question_binding.dart';
import '../modules/basic_info_question/views/basic_info_question_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/reset_password_view.dart';
import '../modules/chielf_complaint/bindings/chielf_complaint_binding.dart';
import '../modules/chielf_complaint/views/chielf_complaint_view.dart';
import '../modules/forgot_pass_verify_otp/bindings/forgot_pass_verify_otp_binding.dart';
import '../modules/forgot_pass_verify_otp/views/forgot_pass_verify_otp_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/set_new_password/bindings/set_new_password_binding.dart';
import '../modules/set_new_password/views/set_new_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BASIC_INFO_QUESTION,
      page: () => const BasicInfoQuestionView(),
      binding: BasicInfoQuestionBinding(),
    ),
    GetPage(
      name: _Paths.CHIELF_COMPLAINT,
      page: () => const ChielfComplaintView(),
      binding: ChielfComplaintBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.SET_NEW_PASSWORD,
      page: () => const SetNewPasswordView(),
      binding: SetNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASS_VERIFY_OTP,
      page: () => const ForgotPassVerifyOtpView(),
      binding: ForgotPassVerifyOtpBinding(),
    ),
  ];
}
