import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class ComplaintsCard extends StatelessWidget {
  final String complaint;
  final bool isSelected;
  final Function()? onPressed;

  const ComplaintsCard({
    super.key,
    required this.complaint,
    this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: isSelected ? Color(0xFFF7E2CB) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius12,
        side: isSelected
            ? BorderSide(color: Color(0xFFD2B49E), width: 3)
            : BorderSide.none,
      ),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      onPressed: onPressed,
      child: Padding(
        padding: padSym(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE64636), width: 2),
                shape: BoxShape.circle,
              ),
              padding: padSym(horizontal: 2, vertical: 2),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFE64636) : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(complaint, style: textStyle.bold.s16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
