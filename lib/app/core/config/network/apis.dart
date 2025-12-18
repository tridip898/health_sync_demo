import 'package:health_sync_question/environment_config.dart';

class Apis {
  static String get baseUrl => EnvironmentConfig.currentEnvironmentData.apiBase;

  static String get login => '$baseUrl/auth/login';

  static String  get registrationSendOtp => '$baseUrl/auth/request-otp';
  static String  get forgotPasswordSendOtp => '$baseUrl/auth/forgot-password';

  static String  get verifyOtp => '$baseUrl/auth/verify-otp';
  static String  get set_password => '$baseUrl/auth/set-password';
  static String  get reset_password => '$baseUrl/auth/reset-password';

  static String get loadMe => '$baseUrl/user';
}
