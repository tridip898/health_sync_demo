import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

enum CustomButtonVariant { filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final CustomButtonVariant variant;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = CustomButtonVariant.filled,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.height = 56,
    this.borderRadius = 12,
    this.borderWidth = 1.5,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isOutlined = variant == CustomButtonVariant.outlined;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: isOutlined ? _outlined() : _filled(),
    );
  }

  Widget _filled() {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor ?? green.base500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style:
            textStyle ??
            GoogleFonts.manrope(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
      ),
    );
  }

  Widget _outlined() {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor ?? (textColor ?? green.base500),
          width: borderWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style:
            textStyle ??
            GoogleFonts.manrope(
              color: textColor ?? green.base500,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
      ),
    );
  }
}
