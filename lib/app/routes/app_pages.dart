import 'package:get/get.dart';

import '../modules/appointment_details/bindings/appointment_details_binding.dart';
import '../modules/appointment_details/views/appointment_details_view.dart';
import '../modules/appointment_list/bindings/appointment_list_binding.dart';
import '../modules/appointment_list/views/appointment_list_view.dart';
import '../modules/auth/change_password/bindings/change_password_binding.dart';
import '../modules/auth/change_password/views/reset_password_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/registration/bindings/registration_binding.dart';
import '../modules/auth/registration/views/registration_view.dart';
import '../modules/auth/set_new_password/bindings/set_new_password_binding.dart';
import '../modules/auth/set_new_password/views/set_new_password_view.dart';
import '../modules/auth/user_bindings_list/bindings/user_bindings_list_binding.dart';
import '../modules/auth/user_bindings_list/views/user_bindings_list_view.dart';
import '../modules/complain_summary/bindings/complain_summary_binding.dart';
import '../modules/complain_summary/views/complain_summary_view.dart';
import '../modules/complaint/bindings/complaint_binding.dart';
import '../modules/complaint/views/complaint_view.dart';
import '../modules/crate_medical_history/bindings/crate_medical_history_binding.dart';
import '../modules/crate_medical_history/views/crate_medical_history_view.dart';
import '../modules/create_appointment/bindings/create_appointment_binding.dart';
import '../modules/create_appointment/views/create_appointment_view.dart';
import '../modules/create_profile/bindings/create_profile_binding.dart';
import '../modules/create_profile/views/create_profile_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/delete_medical_history/bindings/delete_medical_history_binding.dart';
import '../modules/delete_medical_history/views/delete_medical_history_view.dart';
import '../modules/doctor_details/bindings/doctor_details_binding.dart';
import '../modules/doctor_details/views/doctor_details_view.dart';
import '../modules/doctor_list/bindings/doctor_list_binding.dart';
import '../modules/doctor_list/views/doctor_list_view.dart';
import '../modules/forgot_pass_verify_otp/bindings/forgot_pass_verify_otp_binding.dart';
import '../modules/forgot_pass_verify_otp/views/forgot_pass_verify_otp_view.dart';
import '../modules/medical_history_details/bindings/medical_history_details_binding.dart';
import '../modules/medical_history_details/views/medical_history_details_view.dart';
import '../modules/medical_history_list/bindings/medical_history_list_binding.dart';
import '../modules/medical_history_list/views/medical_history_list_view.dart';
import '../modules/prescription/bindings/prescription_binding.dart';
import '../modules/prescription/views/prescription_view.dart';
import '../modules/prescription_details/bindings/prescription_details_binding.dart';
import '../modules/prescription_details/views/prescription_details_view.dart';
import '../modules/profile_details/bindings/profile_details_binding.dart';
import '../modules/profile_details/views/profile_details_view.dart';
import '../modules/auth/profile_setup_options/bindings/profile_setup_options_binding.dart';
import '../modules/auth/profile_setup_options/views/profile_setup_options_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/update_medical_history/bindings/update_medical_history_binding.dart';
import '../modules/update_medical_history/views/update_medical_history_view.dart';

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
    GetPage(
      name: _Paths.MEDICAL_HISTORY_LIST,
      page: () => const MedicalHistoryListView(),
      binding: MedicalHistoryListBinding(),
    ),
    GetPage(
      name: _Paths.CRATE_MEDICAL_HISTORY,
      page: () => const CrateMedicalHistoryView(),
      binding: CrateMedicalHistoryBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_MEDICAL_HISTORY,
      page: () => const UpdateMedicalHistoryView(),
      binding: UpdateMedicalHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_MEDICAL_HISTORY,
      page: () => const DeleteMedicalHistoryView(),
      binding: DeleteMedicalHistoryBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_HISTORY_DETAILS,
      page: () => const MedicalHistoryDetailsView(),
      binding: MedicalHistoryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_APPOINTMENT,
      page: () => const CreateAppointmentView(),
      binding: CreateAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.PRESCRIPTION,
      page: () => const PrescriptionView(),
      binding: PrescriptionBinding(),
    ),
    GetPage(
      name: _Paths.PRESCRIPTION_DETAILS,
      page: () => const PrescriptionDetailsView(),
      binding: PrescriptionDetailsBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT_LIST,
      page: () => const AppointmentListView(),
      binding: AppointmentListBinding(),
    ),
    GetPage(
      name: _Paths.APPOINTMENT_DETAILS,
      page: () => const AppointmentDetailsView(),
      binding: AppointmentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAIN_SUMMARY,
      page: () => const ComplainSummaryView(),
      binding: ComplainSummaryBinding(),
    ),
    GetPage(
      name: _Paths.USER_BINDINGS_LIST,
      page: () => const UserBindingsListView(),
      binding: UserBindingsListBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETUP_OPTIONS,
      page: () => const ProfileSetupOptionsView(),
      binding: ProfileSetupOptionsBinding(),
    ),
  ];
}
