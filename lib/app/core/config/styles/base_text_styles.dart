import 'package:flutter/material.dart';

abstract class BaseTextStyles {
  TextStyle get textStyle;

  TextTheme get textTheme;

  FontStyles get displayFontStyle;

  FontStyles get boldFontStyle;

  FontStyles get semiBoldFontStyle;

  FontStyles get mediumFontStyle;

  FontStyles get regularFontStyle;
}

class FontStyles {
  final TextStyle xxl;
  final TextStyle xl;
  final TextStyle lg;
  final TextStyle md;
  final TextStyle sm;
  final TextStyle? xs;
  final TextStyle? xxs;
  final TextStyle? xxxs;
  final TextStyle? tiny;

  FontStyles(
      {required this.xxl,
      required this.xl,
      required this.lg,
      required this.md,
      required this.sm,
      this.xs,
      this.xxs,
      this.xxxs,
      this.tiny});
}
