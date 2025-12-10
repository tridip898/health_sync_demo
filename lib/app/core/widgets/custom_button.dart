import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 56,
    this.borderRadius = 16,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? green.base500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ??
              GoogleFonts.manrope(
                color: textColor ?? Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
