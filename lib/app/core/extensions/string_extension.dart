import 'dart:convert';

extension StringExtension on String {
  Map toJson() {
    try {
      return jsonDecode(this);
    } catch (e) {
      return {};
    }
  }
}

extension NullableStringExtension on String? {
  String get obscurePhone {
    if (this != null && this!.isNotEmpty) {
      if (this!.length < 2) return this!;
      return '${'*' * 9}${this!.substring(this!.length - 2)}';
    }
    return '';
  }

  bool get notNullNotEmpty {
    if (this != null && this!.isNotEmpty) {
      return true;
    }
    return false;
  }
}
