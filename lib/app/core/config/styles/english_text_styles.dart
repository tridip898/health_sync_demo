import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/extensions/font_sizing_extension.dart';

import 'base_text_styles.dart';

class EnglishTextStyles extends BaseTextStyles {
  @override
  TextStyle get textStyle => GoogleFonts.nunitoSans();

  @override
  TextTheme get textTheme => GoogleFonts.nunitoSansTextTheme();

  @override
  FontStyles get displayFontStyle => FontStyles(
        xxl: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 72,
          height: 90.fontHeight(72),
        ),
        xl: textStyle.copyWith(
          fontSize: 60,
          height: 72.fontHeight(60),
        ),
        lg: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 48,
          height: 60.fontHeight(48),
        ),
        md: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          height: 44.fontHeight(36),
        ),
        sm: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          height: 38.fontHeight(30),
        ),
        xs: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          height: 30.fontHeight(22),
        ),
      );

  @override
  FontStyles get boldFontStyle => FontStyles(
        xxl: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 24,
          height: 24.fontHeight(24),
        ),
        xl: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          height: 24.fontHeight(20),
        ),
        lg: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          height: 24.fontHeight(18),
        ),
        md: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 16,
          height: 24.fontHeight(16),
        ),
        sm: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 14,
          height: 20.fontHeight(14),
        ),
        xs: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 12,
          height: 18.fontHeight(12),
        ),
        xxs: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 10,
          height: 12.fontHeight(10),
        ),
        xxxs: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 8,
          height: 12.fontHeight(8),
        ),
        tiny: textStyle.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 6,
          height: 1.25,
        ),
      );

  @override
  FontStyles get mediumFontStyle => FontStyles(
        xxl: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          height: 24.fontHeight(24),
        ),
        xl: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 24.fontHeight(20),
        ),
        lg: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          height: 24.fontHeight(18),
        ),
        md: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 24.fontHeight(16),
        ),
        sm: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20.fontHeight(14),
        ),
        xs: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 18.fontHeight(12),
        ),
        xxs: textStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 12.fontHeight(10),
        ),
      );

  @override
  FontStyles get regularFontStyle => FontStyles(
        xxl: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          height: 24.fontHeight(24),
        ),
        xl: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          height: 24.fontHeight(20),
        ),
        lg: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          height: 24.fontHeight(18),
        ),
        md: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 24.fontHeight(16),
        ),
        sm: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20.fontHeight(14),
        ),
        xs: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 18.fontHeight(12),
        ),
        xxs: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          height: 12.fontHeight(10),
        ),
      );

  @override
  FontStyles get semiBoldFontStyle => FontStyles(
        xxl: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          height: 24.fontHeight(24),
        ),
        xl: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 24.fontHeight(20),
        ),
        lg: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 24.fontHeight(18),
        ),
        md: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 24.fontHeight(16),
        ),
        sm: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 20.fontHeight(14),
        ),
        xs: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          height: 18.fontHeight(12),
        ),
        xxs: textStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 10,
          height: 12.fontHeight(10),
        ),
      );
}
