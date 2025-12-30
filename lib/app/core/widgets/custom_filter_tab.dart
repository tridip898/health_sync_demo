import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomFilterTab extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Function(int index) onChanged;
  final double height;

  const CustomFilterTab({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: borderRadius8,
      ),
      padding: padSym(horizontal: 4, vertical: 4),
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = index == selectedIndex;
          final item = items[index];
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: borderRadius8,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 6,
                          ),
                        ]
                      : null,
                ),
                padding: padSym(horizontal: 8),
                alignment: Alignment.center,
                child: Text(
                  item,
                  style: textStyle.semiBold.s14.copyWith(
                    color: isSelected ? Colors.black : Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
