import 'package:health_sync_question/environment_config.dart';

class Apis {
  static String get baseUrl => EnvironmentConfig.currentEnvironmentData.apiBase;

  static String get login => '$baseUrl/auth/login';

  static String get registrationSendOtp => '$baseUrl/auth/request-otp';

  static String get forgotPasswordSendOtp => '$baseUrl/auth/forgot-password';

  static String get verifyOtp => '$baseUrl/auth/verify-otp';

  static String get set_password => '$baseUrl/auth/set-password';

  static String get reset_password => '$baseUrl/auth/reset-password';

  static String get loadMe => '$baseUrl/user';

  static String get doctorList => '$baseUrl/doctor';

  static String get organizationList => '$baseUrl/organization';

  static String get specialtyList => '$baseUrl/specialty';

  static String get createProfile => '$baseUrl/profile';

  static String get roleList => '$baseUrl/role';

  static String get roleSelection => '$baseUrl/user/select-new-role';

  static String switchRole(String roleId) =>
      '$baseUrl/user/switch-user-role/$roleId';

  static String get prescription => '$baseUrl/prescription';

  static String prescriptionDetails(String id) => '$baseUrl/prescription/$id';

  static String prescriptionPdf(String prescriptionId) =>
      '$baseUrl/prescription/$prescriptionId/generate-pdf';

  static String prescriptionHistory(String prescriptionId) =>
      '$baseUrl/prescription/$prescriptionId/history';
}
