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
  FontStyles get bold => FontStyles(
    s72: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 72,
      height: 90.fontHeight(72),
    ),
    s60: textStyle.copyWith(fontSize: 60, height: 72.fontHeight(60)),
    s48: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 48,
      height: 60.fontHeight(48),
    ),
    s36: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      height: 44.fontHeight(36),
    ),
    s30: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      height: 38.fontHeight(30),
    ),
    s24: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      height: 24.fontHeight(24),
    ),
    s22: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      height: 30.fontHeight(22),
    ),
    s20: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      height: 24.fontHeight(20),
    ),
    s18: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      height: 24.fontHeight(18),
    ),
    s16: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 24.fontHeight(16),
    ),
    s14: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      height: 20.fontHeight(14),
    ),
    s12: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      height: 18.fontHeight(12),
    ),
    s10: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      height: 12.fontHeight(10),
    ),
    s8: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 8,
      height: 12.fontHeight(8),
    ),
    s6: textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 6,
      height: 1.25,
    ),
  );

  @override
  FontStyles get medium => FontStyles(
    s72: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 72,
      height: 80.fontHeight(72),
    ),
    s60: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 60,
      height: 68.fontHeight(60),
    ),
    s48: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 48,
      height: 56.fontHeight(48),
    ),
    s36: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      height: 44.fontHeight(36),
    ),
    s30: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 30,
      height: 38.fontHeight(30),
    ),
    s24: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 24.fontHeight(24),
    ),
    s22: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 30.fontHeight(22),
    ),

    s20: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 24.fontHeight(20),
    ),
    s18: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 24.fontHeight(18),
    ),
    s16: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 24.fontHeight(16),
    ),
    s14: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 20.fontHeight(14),
    ),
    s12: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 18.fontHeight(12),
    ),
    s10: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 12.fontHeight(10),
    ),
    s8: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 8,
      height: 14.fontHeight(8),
    ),
    s6: textStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 6,
      height: 12.fontHeight(6),
    ),
  );

  @override
  FontStyles get regular => FontStyles(
    s72: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 72,
      height: 80.fontHeight(72),
    ),
    s60: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 60,
      height: 68.fontHeight(60),
    ),
    s48: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 48,
      height: 56.fontHeight(48),
    ),
    s36: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 44.fontHeight(36),
    ),
    s30: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 30,
      height: 38.fontHeight(30),
    ),
    s24: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 24.fontHeight(24),
    ),
    s22: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 22,
      height: 30.fontHeight(22),
    ),
    s20: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      height: 24.fontHeight(20),
    ),
    s18: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      height: 24.fontHeight(18),
    ),
    s16: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 24.fontHeight(16),
    ),
    s14: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20.fontHeight(14),
    ),
    s12: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 18.fontHeight(12),
    ),
    s10: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      height: 12.fontHeight(10),
    ),
    s8: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 8,
      height: 14.fontHeight(8),
    ),
    s6: textStyle.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 6,
      height: 12.fontHeight(6),
    ),
  );

  @override
  FontStyles get semiBold => FontStyles(
    s72: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 72,
      height: 80.fontHeight(72),
    ),
    s60: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 60,
      height: 68.fontHeight(60),
    ),
    s48: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 48,
      height: 56.fontHeight(48),
    ),
    s36: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      height: 44.fontHeight(36),
    ),
    s30: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 30,
      height: 38.fontHeight(30),
    ),
    s24: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height: 24.fontHeight(24),
    ),
    s22: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      height: 30.fontHeight(22),
    ),
    s20: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      height: 24.fontHeight(20),
    ),
    s18: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 24.fontHeight(18),
    ),
    s16: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 24.fontHeight(16),
    ),
    s14: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 20.fontHeight(14),
    ),
    s12: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 18.fontHeight(12),
    ),
    s10: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 10,
      height: 12.fontHeight(10),
    ),
    s8: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 8,
      height: 14.fontHeight(8),
    ),
    s6: textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 6,
      height: 12.fontHeight(6),
    ),
  );
}
