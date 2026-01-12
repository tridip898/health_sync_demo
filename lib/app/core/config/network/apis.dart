import 'package:health_sync_question/environment_config.dart';

class Apis {
  static String get baseUrl => EnvironmentConfig.currentEnvironmentData.apiBase;

  static String get login => '$baseUrl/auth/login';

  static String get registrationSendOtp => '$baseUrl/auth/request-otp';

  static String get forgotPasswordSendOtp => '$baseUrl/auth/forgot-password';

  static String get verifyOtp => '$baseUrl/auth/verify-otp';

  static String get setPassword => '$baseUrl/auth/set-password';

  static String get resetPassword => '$baseUrl/auth/reset-password';

  static String get loadMe => '$baseUrl/user';

  static String get doctorList => '$baseUrl/doctor';

  static String doctorDetails(dynamic doctorId) => '$baseUrl/doctor/$doctorId';

  static String get organizationList => '$baseUrl/organization';

  static String get specialtyList => '$baseUrl/specialty';

  static String patientMedicalHistory(String patientId) =>
      '$baseUrl/patient/$patientId/medical-history';

  static String patientMedicalHistoryDetails(
    String patientId,
    String medicalHistoryId,
  ) => '$baseUrl/patient/$patientId/medical-history/$medicalHistoryId';

  static String get diseaseCategories => '$baseUrl/disease-category';

  static String createHistory(String patientId) =>
      '$baseUrl/patient/$patientId/medical-history';

  static String updateHistory(String patientId, String medicalHistoryId) =>
      '$baseUrl/patient/$patientId/medical-history/$medicalHistoryId';
  static String get createProfile => '$baseUrl/profile';

  static String get appointment => '$baseUrl/appointment';

  static String get questionnaire => '$baseUrl/appointment/questionnaire';

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

  static String appointmentDetails(String appointmentId) =>
      '$baseUrl/appointment/$appointmentId';
  static String deleteHistory(String patientId, String medicalHistoryId) =>
      '$baseUrl/patient/$patientId/medical-history/$medicalHistoryId';

  static String get userBinding => '$baseUrl/user-binding';
}
