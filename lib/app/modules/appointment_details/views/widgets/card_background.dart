import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';

class CardBackground extends StatelessWidget {
  final Widget child;

  const CardBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius12,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: 8),
        ],
      ),
      padding: padAll12,
      child: child,
    );
  }
}
