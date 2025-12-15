import 'package:health_sync_question/environment_config.dart';

class Apis {
  static String get baseUrl => EnvironmentConfig.currentEnvironmentData.apiBase;

  static String get login => '$baseUrl/auth/login';

  static String get loadMe => '$baseUrl/user';

  static String get doctorList => '$baseUrl/doctor';
}
