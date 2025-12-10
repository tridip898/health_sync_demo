import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/data/model/question_model.dart';

import 'package:health_sync_question/app/data/model/complaint_answer_model.dart';

class ChiefComplaintController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxMap<String, dynamic> chiefComplaintOption = <String, dynamic>{}.obs;
  final RxList<QuestionModel> currentComplaintQuestions = <QuestionModel>[].obs;
  final RxList<ComplaintAnswerModel> allComplaintAnswers =
      <ComplaintAnswerModel>[].obs;
  final RxInt currentIndex = 0.obs;
  final RxMap<String, String> selectedOptions = <String, String>{}.obs;
  final RxString selectedComplaint = "".obs;
  final RxBool isLastQuestion = false.obs;
  final RxInt totalQuestions = 0.obs;
  final RxInt answeredQuestions = 0.obs;
  final RxDouble progress = 0.0.obs;
  bool firstSelectionDone = false;
  final RxList<ComplaintAnswerModel> complaintAnswers =
      <ComplaintAnswerModel>[].obs;

  @override
  void onInit() {
    loadChiefComplaintData();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void loadChiefComplaintData() {
    final options =
        medicalData['MedicalAssistantApp']['Start']['ChiefComplaint']['options'];
    chiefComplaintOption.value = options;
  }

  QuestionModel get currentQuestion =>
      currentComplaintQuestions[currentIndex.value];

  void selectChiefComplaint(String complaint) {
    selectedComplaint.value = complaint;
    final selectedChiefComplaint = chiefComplaintOption[complaint];
    if (selectedChiefComplaint != null) {
      currentComplaintQuestions.value =
          (selectedChiefComplaint['questions'] as List)
              .map((q) => QuestionModel.fromJson(q))
              .toList();
      chiefComplaintOption.value = selectedChiefComplaint;
      currentIndex.value = 0;
      firstSelectionDone = true;
      answeredQuestions.value = 1;
      totalQuestions.value = 5;
      progress.value = 0.2;
    }
    isLastQuestion.value = isLastQuestions();
  }

  void nextQuestion(String selected) {
    selectedOptions[currentQuestion.question] = selected;
    if (currentComplaintQuestions.isNotEmpty) {
      final currentQuestion = currentComplaintQuestions[currentIndex.value];
      final complaintKey = selectedComplaint.value;
      var complaint = allComplaintAnswers.firstWhereOrNull(
        (c) => c.complaint == complaintKey,
      );
      if (complaint == null) {
        complaint = ComplaintAnswerModel(complaint: complaintKey, answers: []);
        allComplaintAnswers.add(complaint);
      }
      final existingIndex = complaint.answers.indexWhere(
        (a) => a.question == currentQuestion.question,
      );
      if (existingIndex != -1) {
        complaint.answers[existingIndex] = AnswerModel(
          question: currentQuestion.question,
          answer: selected,
        );
      } else {
        complaint.answers.add(
          AnswerModel(question: currentQuestion.question, answer: selected),
        );
      }
    }
    if (chiefComplaintOption['branches'] != null &&
        chiefComplaintOption['branches'][selected] != null) {
      final subBranch = chiefComplaintOption['branches'][selected];
      currentComplaintQuestions.value = (subBranch['questions'] as List)
          .map((q) => QuestionModel.fromJson(q))
          .toList();
      chiefComplaintOption.value = subBranch;
      totalQuestions.value = 1 + currentComplaintQuestions.length;
      answeredQuestions.value = 1;
    } else {
      if (currentIndex.value < currentComplaintQuestions.length - 1) {
        currentIndex.value++;
        answeredQuestions.value++;
      } else {
        answeredQuestions.value++;
        log("Suggested Doctors: ${chiefComplaintOption['DoctorSuggestion']}");
      }
    }
    updateProgress();
    isLastQuestion.value = isLastQuestions();
  }

  bool isLastQuestions() {
    if (chiefComplaintOption['branches'] != null) {
      final branches = chiefComplaintOption['branches'] as Map;
      final selected = selectedOptions[currentQuestion.question];
      final matchedKey = branches.keys.firstWhere(
        (key) => key.toLowerCase().contains(selected?.toLowerCase() ?? ""),
        orElse: () => '',
      );
      if (matchedKey.isNotEmpty) return false;
    }
    return currentIndex.value == currentComplaintQuestions.length - 1;
  }

  void completeClick() {
    complaintAnswers.addAll(allComplaintAnswers);
    Get.back();
  }

  void updateProgress() {
    if (!firstSelectionDone) {
      progress.value = 0.0;
      return;
    }
    progress.value = answeredQuestions.value / totalQuestions.value;
  }
}
