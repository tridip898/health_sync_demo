import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class Loading extends StatelessWidget {
  final bool canPop;

  const Loading._({this.canPop = true});

  static show({bool isBarrierDismissible = false, bool canPop = false}) {
    Get.dialog(
      Loading._(canPop: canPop),
      barrierDismissible: isBarrierDismissible,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: canPop, child: LoadingWidget(size: 64));
  }

  static void hide() {
    Get.back();
  }
}

class LoadingWidget extends StatefulWidget {
  final double size;

  const LoadingWidget({super.key, this.size = 64});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: green.base500,
          ),
          child: Icon(
            Icons.health_and_safety_rounded,
            size: widget.size * 0.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
