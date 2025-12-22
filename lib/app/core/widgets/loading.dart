import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  final bool canPop;

  const Loading._({super.key, this.canPop = true});

  static show({bool isBarrierDismissible = false, bool canPop = false}) {
    Get.dialog(
      Loading._(canPop: canPop),
      barrierDismissible: isBarrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: canPop, child: LoadingBeeWidget(beeHeight: 80));
  }

  static void hide() {
    Get.back();
  }
}

class LoadingBeeWidget extends StatelessWidget {
  final double beeHeight;

  const LoadingBeeWidget({super.key, this.beeHeight = 40});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            green.base400.withAlpha(30),
            green.base400.withAlpha(50),
            green.base400.withAlpha(70),
            green.base400,
            green.base400.withAlpha(70),
            green.base400.withAlpha(50),
            green.base400.withAlpha(30),
          ],
        ),
        child: Container(
          height: 96,
          width: 96,
          decoration: BoxDecoration(
            color: green.base400.withOpacity(.2),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.health_and_safety, size: 48, color: green.base400),
        ),
      ),
    );
  }
}
