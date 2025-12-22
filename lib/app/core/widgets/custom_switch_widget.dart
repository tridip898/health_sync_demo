import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomSwitchWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isActive;
  final double borderRadius;
  final Function() onTap;

  const CustomSwitchWidget({
    super.key,
    this.width = 50,
    this.height = 30,
    required this.isActive,
    this.borderRadius = 16,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: gray.base200,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: AnimatedAlign(
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          duration: Duration(milliseconds: 250),
          child: Container(
            width: width * 0.5,
            height: double.infinity,
            decoration: BoxDecoration(
              color: isActive ? green.base500 : gray.base300,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
