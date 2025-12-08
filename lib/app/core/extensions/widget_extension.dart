import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../config/color/base_color.dart';
import '../config/styles/base_text_styles.dart';
import '../controller/app_controller.dart';
import '../translations/translation_base.dart';

extension GetViewExtension on GetView {
  AppController get _appController => Get.find<AppController>();

  TranslationBase get tr => _appController.tr.value;

  Duration get defaultAnimationDuration =>
      _appController.defaultAnimationDuration;

  Color get white => _appController.white;

  Color get black => _appController.black;

  BaseColor get primary => _appController.primary;

  BaseColor get secondary => _appController.secondary;

  BaseColor get gray => _appController.gray;

  BaseColor get magendaClient => _appController.magendaClient;

  BaseColor get error => _appController.error;

  BaseColor get warning => _appController.warning;

  BaseColor get success => _appController.success;

  BaseTextStyles get textStyle => _appController.textStyle;
}

extension GetViewControllerExtension on GetxController {
  AppController get _appController => Get.find<AppController>();

  TranslationBase get tr => _appController.tr.value;

  Duration get defaultAnimationDuration =>
      _appController.defaultAnimationDuration;

  Color get white => _appController.white;

  Color get black => _appController.black;

  BaseColor get primary => _appController.primary;

  BaseColor get secondary => _appController.secondary;

  BaseColor get gray => _appController.gray;

  BaseColor get magendaClient => _appController.magendaClient;

  BaseColor get error => _appController.error;

  BaseColor get warning => _appController.warning;

  BaseColor get success => _appController.success;

  BaseTextStyles get textStyle => _appController.textStyle;
}

extension StatelessExtension on StatelessWidget {
  AppController get _appController => Get.find<AppController>();

  TranslationBase get tr => _appController.tr.value;

  Duration get defaultAnimationDuration =>
      _appController.defaultAnimationDuration;

  Color get white => _appController.white;

  Color get black => _appController.black;

  BaseColor get primary => _appController.primary;

  BaseColor get secondary => _appController.secondary;

  BaseColor get gray => _appController.gray;

  BaseColor get magendaClient => _appController.magendaClient;

  BaseColor get error => _appController.error;

  BaseColor get warning => _appController.warning;

  BaseColor get success => _appController.success;

  BaseTextStyles get textStyle => _appController.textStyle;
}

extension StatefulExtension on State {
  AppController get _appController => Get.find<AppController>();

  TranslationBase get tr => _appController.tr.value;

  Duration get defaultAnimationDuration =>
      _appController.defaultAnimationDuration;

  Color get white => _appController.white;

  Color get black => _appController.black;

  BaseColor get primary => _appController.primary;

  BaseColor get secondary => _appController.secondary;

  BaseColor get gray => _appController.gray;

  BaseColor get magendaClient => _appController.magendaClient;

  BaseColor get error => _appController.error;

  BaseColor get warning => _appController.warning;

  BaseColor get success => _appController.success;

  BaseTextStyles get textStyle => _appController.textStyle;
}
