import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/data/model/complaint_answer_model.dart';
import 'package:health_sync_question/app/data/model/patient_info_model.dart';
import '../config/color/base_color.dart';
import '../config/color/blue.dart';
import '../config/color/cyan.dart';
import '../config/color/gray.dart';
import '../config/color/green.dart';
import '../config/color/magenda.dart';
import '../config/color/red.dart';
import '../config/color/yellow.dart';
import '../config/styles/base_text_styles.dart';
import '../config/styles/bengali_text_styles.dart';
import '../config/styles/english_text_styles.dart';
import '../translations/bn.dart';
import '../translations/en.dart';
import '../translations/translation_base.dart';

class AppController extends GetxController {
  TranslationBase en = EN();
  TranslationBase bn = BN();
  RxString language = "EN".obs;
  late Rx<TranslationBase> tr;

  final Duration defaultAnimationDuration = const Duration(milliseconds: 300);

  Color white = Colors.white;
  Color black = Colors.black;
  BaseColor primary = Cyan();
  BaseColor secondary = Blue();
  BaseColor gray = Gray();
  BaseColor magendaClient = Magenda();
  BaseColor error = Red();
  BaseColor warning = Yellow();
  BaseColor success = Green();

  //text styles for using
  BengaliTextStyles bnStyle = BengaliTextStyles();
  EnglishTextStyles enStyle = EnglishTextStyles();

  final patientInfo = PatientBasicInfo().obs;
  final RxList<ComplaintAnswerModel> complaintAnswers =
      <ComplaintAnswerModel>[].obs;
  Color backgroundColor = Color(0xfff5f1e5);

  AppController() {
    language.value = "EN";
    tr = Rx(en);
    _setTranslator();
  }

  void _setTranslator() {
    switch (language.value) {
      case "BN":
        tr.value = bn;
        break;
      case "EN":
        tr.value = en;
        break;
    }
  }

  Future switchLanguage(String language) async {
    this.language.value = "EN";
    _setTranslator();
  }

  BaseTextStyles get textStyle {
    if (tr.value is EN) return enStyle;
    return bnStyle;
  }

  closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
