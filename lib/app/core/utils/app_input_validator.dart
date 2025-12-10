class AppInputValidator {
  static String? requiredMinMax(String? value, {int min = 10, int max = 30}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    final trimmed = value.trim();

    if (trimmed.length < min) {
      return 'Minimum $min characters required';
    }

    if (trimmed.length > max) {
      return 'Maximum $max characters allowed';
    }

    return null;
  }

  static String? bdPhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final v = value.trim();

    // Rule: 01xxxxxxxxx → length 11
    if (v.startsWith('01')) {
      if (v.length == 11) {
        return null;
      } else {
        return 'Phone number must be 11 digits';
      }
    }

    // Rule: 8801xxxxxxxx → length 13
    if (v.startsWith('8801')) {
      if (v.length == 13) {
        return null;
      } else {
        return 'Phone number must be 13 digits';
      }
    }

    return 'Invalid phone number format';
  }
}
