import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFFE64636),
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 8,
          ),
          elevation: onPressed==null?0:null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle.boldFontStyle.lg.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
