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
}
