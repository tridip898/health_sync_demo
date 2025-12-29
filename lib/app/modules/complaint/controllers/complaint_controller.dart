import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/data/model/complaint_answer_model.dart';
import 'package:health_sync_question/app/data/model/question_model.dart';

class ComplaintController extends GetxController {
  Rx<Map<String, Section>?> questionData = Rx(null);
  Rx<Section?> currentQuestion = Rx(null);
  Rx<List<Section>> answerList = Rx([]);
  Rx<int> currentBranchIndex = Rx(0);
  final TextEditingController extraNotesController = TextEditingController();

  bool get isBranch {
    return currentQuestion.value?.type == InputType.branch &&
        currentQuestion.value?.questions?.isNotEmpty == true;
  }

  bool get isBranchComplete {
    return isBranch &&
        currentBranchIndex.value == currentQuestion.value?.questions?.length;
  }

  bool get isExtraNoteComplete {
    return isBranch &&
        currentBranchIndex.value ==
            (currentQuestion.value?.questions?.length ?? 0) + 1;
  }

  @override
  void onReady() {
    loadChiefComplaintData();
    super.onReady();
  }

  @override
  void onClose() {
    extraNotesController.dispose();
    super.onClose();
  }

  void loadChiefComplaintData() {
    final medicalQuestionnaire = MedicalQuestionnaire.fromJson(medicalData);
    questionData.value = medicalQuestionnaire.sections;
    currentQuestion.value =
        questionData.value?[medicalQuestionnaire.startSection];
  }

  onSectionTap(int index) {
    final section = currentQuestion.value;
    section?.answer = currentQuestion.value?.options?.keys.elementAt(index);

    if (section != null) {
      answerList.value.add(section);
      currentQuestion.value = questionData
          .value?[currentQuestion.value?.options?.values.elementAt(index)];
    }
  }

  onBranchNextTap(String answer) {
    final section = currentQuestion.value?.questions?[currentBranchIndex.value];
    section?.answer = answer;

    if (section != null) {
      answerList.value.add(section);
      currentBranchIndex.value++;
    }

    if (currentBranchIndex.value == currentQuestion.value?.questions?.length) {
      _onSubmitResponse();
    }
  }

  _onSubmitResponse() async {}

  void onReviewTap() {
    currentBranchIndex.value++;
  }

  Rx<bool> canPop = false.obs;

  void onBackTap(bool didPop, result) async {
    if (isExtraNoteComplete) {
      currentBranchIndex.value--;
    } else if (isBranchComplete) {
      currentBranchIndex.value--;
      extraNotesController.clear();
    } else if (isBranch) {
      if (currentBranchIndex.value == 0) {
        currentQuestion.value = answerList.value.last;
      } else {
        currentBranchIndex.value--;
      }
      answerList.value.removeLast();
    } else if (currentBranchIndex.value == 0 &&
        !isBranch &&
        answerList.value.isNotEmpty) {
      currentQuestion.value = answerList.value.last;
      answerList.value.removeLast();
    } else if (answerList.value.isEmpty) {
      canPop.value = true;
      // Get.back();
    }
  }
}
