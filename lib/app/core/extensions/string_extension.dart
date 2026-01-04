import 'dart:convert';
import 'package:intl/intl.dart';

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

  String get formatUtcToMonthYear {
    if (this == null) return '';
    final dateTime = DateTime.parse(this!).toLocal();
    return DateFormat('MMM yyyy').format(dateTime);
  }

  String get formatToDdMmmYyyy {
    if (this == null) return '';
    try {
      final dateTime = DateTime.parse(this!).toLocal();
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return '';
    }
  }
}
