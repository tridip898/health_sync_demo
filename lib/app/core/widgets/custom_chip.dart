import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool fullWidth;

  const CustomChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: fullWidth ? double.infinity : null,
        decoration: BoxDecoration(
          color: isSelected ? green.base50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? green.base400 : gray.base300,
            width: 1,
          ),
        ),
        padding: padSym(horizontal: 16, vertical: 12),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.medium.s16.copyWith(
            color: isSelected ? green.base500 : Colors.black,
          ),
        ),
      ),
    );
  }
}
