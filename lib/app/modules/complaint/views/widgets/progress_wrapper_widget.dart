import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class ProgressWrapperWidget extends StatelessWidget {
  final Widget child;
  final int totalItem;
  final int currentItem;

  const ProgressWrapperWidget({
    super.key,
    required this.child,
    required this.totalItem,
    required this.currentItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearQuantityProgress(total: totalItem, current: currentItem),
        gapH12,
        Expanded(child: child),
      ],
    );
  }
}

class LinearQuantityProgress extends StatelessWidget {
  final int total;
  final int current;
  final double height;
  final BorderRadius borderRadius;

  const LinearQuantityProgress({
    super.key,
    required this.total,
    required this.current,
    this.height = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total <= 0 ? 0 : (current / total).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: LinearProgressIndicator(
        minHeight: height,
        value: progress,
        backgroundColor: green.base100,
        color: green.base500,
      ),
    );
  }
}