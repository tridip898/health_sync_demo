import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/modules/complain_summary/controllers/complain_summary_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

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

  bool isCategorySelector = Get.arguments?['isCategorySelector'] ?? false;



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
      answerList.update((_) {
        answerList.value.add(section);
      });
      currentQuestion.value = questionData
          .value?[currentQuestion.value?.options?.values.elementAt(index)];
    }
  }

  onBranchNextTap(String answer) {
    final section = currentQuestion.value?.questions?[currentBranchIndex.value];
    section?.answer = answer;

    if (section != null) {
      answerList.update((_) {
        answerList.value.add(section);
      });
      currentBranchIndex.value++;
    }
  }

  onSubmitResponse() async {
    if (isCategorySelector) {
      if (Get.isRegistered<ComplainSummaryController>()) {
        Get.back(result: answerList.value);
      } else {
        Get.offNamed(Routes.COMPLAIN_SUMMARY, arguments: answerList.value);
      }
    } else {
      Get.back(result: answerList.value);
    }
  }



  void onReviewTap() {
    if (extraNotesController.text.isNotEmpty) {
      answerList.update((_) {
        answerList.value.add(
          Section(
            type: InputType.text,
            question: 'Extra notes?',
            answer: extraNotesController.text,
          ),
        );
      });
    }
    currentBranchIndex.value++;
  }

  void onBackTap(bool didPop, result) async {
    if (didPop) return;
    if (isExtraNoteComplete) {
      currentBranchIndex.value--;
      if (extraNotesController.text.isNotEmpty) {
        answerList.update((_) {
          answerList.value.removeLast();
        });
      }
    } else if (isBranchComplete) {
      currentBranchIndex.value--;
      extraNotesController.clear();
      answerList.value.removeLast();
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
    }
    answerList.update((_) {});
  }
}
