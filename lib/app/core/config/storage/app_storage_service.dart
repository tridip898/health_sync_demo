import 'package:common/common.dart';

class AppStorageService extends BaseStorageService {
  static const String defaultLanguage = "EN";

  final String _languageKey = "ln";
  final String _token = "token";

  Future<void> setLanguage(String language) async {
    await write(_languageKey, language.toUpperCase());
  }

  String getLanguage() {
    return read(_languageKey) ?? defaultLanguage;
  }

  Future<bool> setToken(String accessToken) async {
    try {
      await write(_token, accessToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? getToken() {
    try {
      final user = read(_token);
      if (user == null) return null;
      return user;
    } catch (e) {
      logError(e);
      return null;
    }
  }

  Future<void> removeUserData() async {
    await remove(_token);
  }
}
