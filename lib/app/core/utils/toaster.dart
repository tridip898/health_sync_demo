import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/controller/app_controller.dart';

enum ToastType { error, success, info, warning }

abstract class Toaster {
  static bool showing = false;

  static error(String message, {Function? action}) {
    _show(
      'Error',
      message,
      icon: toasterIcon(icon: Icons.close),
      action: action,
      type: ToastType.error,
    );
  }

  static success(String message, {Function? action, String? actionTitle}) {
    _show(
      'Success',
      message,
      icon: toasterIcon(icon: Icons.check),
      action: action,
      actionTitle: actionTitle,
      type: ToastType.success,
    );
  }

  static info(String message) {
    _show(
      'Info',
      message,
      icon: toasterIcon(icon: Icons.info_outline),
      type: ToastType.info,
    );
  }

  static warning(String message) {
    _show(
      'Warning',
      message,
      icon: toasterIcon(icon: Icons.warning),
      type: ToastType.warning,
    );
  }

  static _show(
    String title,
    String message, {
    Widget? icon,
    Function? action,
    String? actionTitle,
    Function? onTap,
    required ToastType type,
  }) {
    final appController = Get.find<AppController>();
    final textStyle = appController.textStyle;

    CustomToast.show(
      message: message,
      builder: (id, message) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap();
              }
              CustomToast.hide(id);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: type == ToastType.success
                    ? appController.green.base500
                    : type == ToastType.error
                    ? appController.red.base500
                    : type == ToastType.warning
                    ? appController.yellow.base500
                    : appController.blue.base500,
                borderRadius: radius8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (icon != null) icon,
                      if (icon != null) const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              message,
                              style: textStyle.semiBold.s16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (action != null)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () => action,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              actionTitle ?? 'Try Again',
                              style: textStyle.regular.s18.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            gapW4,
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget toasterIcon({required IconData icon, double padding = 0}) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: 32,
      height: 32,
      alignment: Alignment.center,
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }
}
