import 'package:get/get.dart';
import 'package:health_sync_question/app/modules/complaint/bindings/complaint_binding.dart';
import 'package:health_sync_question/app/modules/complaint/views/complaint_view.dart';

import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/reset_password_view.dart';
import '../modules/create_profile/bindings/create_profile_binding.dart';
import '../modules/create_profile/views/create_profile_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/doctor_details/bindings/doctor_details_binding.dart';
import '../modules/doctor_details/views/doctor_details_view.dart';
import '../modules/doctor_list/bindings/doctor_list_binding.dart';
import '../modules/doctor_list/views/doctor_list_view.dart';
import '../modules/forgot_pass_verify_otp/bindings/forgot_pass_verify_otp_binding.dart';
import '../modules/forgot_pass_verify_otp/views/forgot_pass_verify_otp_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile_details/bindings/profile_details_binding.dart';
import '../modules/profile_details/views/profile_details_view.dart';
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
      name: _Paths.COMPLAINT,
      page: () => const ComplaintView(),
      binding: ComplaintBinding(),
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
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_LIST,
      page: () => const DoctorListView(),
      binding: DoctorListBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAILS,
      page: () => const DoctorDetailsView(),
      binding: DoctorDetailsBinding(),
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
    GetPage(
      name: _Paths.CREATE_PROFILE,
      page: () => const CreateProfileView(),
      binding: CreateProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAILS,
      page: () => const ProfileDetailsView(),
      binding: ProfileDetailsBinding(),
    ),
  ];
}
