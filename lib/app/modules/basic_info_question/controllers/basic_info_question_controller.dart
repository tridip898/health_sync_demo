import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/complaint_answer_model.dart';
import 'package:health_sync_question/app/data/model/patient_info_model.dart';
import 'package:health_sync_question/app/data/repository/patient_health_queries.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

import 'package:health_sync_question/app/core/controller/app_controller.dart';

class BasicInfoQuestionController extends GetxController {
  final PatientHealthQueriesRepository _patientHealthQueriesRepository =
      PatientHealthQueriesRepository();
  final int max = 0;

  final basicInfoFormKey = GlobalKey<FormState>();
  final RxBool isAutoValidateEnabled = false.obs;

  final ScrollController scrollController = ScrollController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final Rx<Gender> selectedGender = Gender.male.obs;
  final List<String> specialityDoctor = [
    "Neurologist",
    "Psychiatrist",
    "ENT Specialist",
    "Ophthalmologist",
    "Dentist",
    "Cardiologist",
    "Pulmonologist",
    "Gastroenterologist",
    "Orthopedist",
    "Rheumatologist",
    "Urologist",
    "Gynecologist",
    "Andrologist",
    "Dermatologist",
    "General Physician",
  ];

  final RxList<ComplaintAnswerModel> complaintAnswers =
      <ComplaintAnswerModel>[].obs;

  final patientInfo = PatientBasicInfo().obs;

  @override
  void onInit() {
    log("Data $complaintAnswers");
    super.onInit();
    for (var data in specialityDoctor) {
      log("Data $data");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void basicInfoSubmitClick() {
    isAutoValidateEnabled.value = true;
    if (basicInfoFormKey.currentState?.validate() ?? false) {
      Get.toNamed(Routes.CHIELF_COMPLAINT);
      patientInfo.value = PatientBasicInfo(
        name: nameController.text,
        age: ageController.text,
        gender: selectedGender.value.name.capitalizeFirst,
      );
    }
  }

  void newComplaintClick() {
    Get.toNamed(Routes.CHIELF_COMPLAINT);
  }

  void searchClick() async {
    Loading.show();
    var response = await _patientHealthQueriesRepository.sendComplaintAnswers(
      complaintAnswers,
    );
    Loading.hide();
    if (response != null) {
      if (Get.isDialogOpen == true) return;

      Get.defaultDialog(
        title: "Doctor Suggestion",
        titleStyle: textStyle.boldFontStyle.xxl,
        content: Text(response, style: textStyle.mediumFontStyle.md),
        backgroundColor: Colors.white,
        titlePadding: padSym(vertical: 12),
        contentPadding: padSym(horizontal: 16, vertical: 12),
      );
    }
  }

  refreshButtonClick() {
    complaintAnswers.value = [];
    patientInfo.value = PatientBasicInfo();
    complaintAnswers.refresh();
    nameController.text = "";
    ageController.text = "";
    selectedGender.value = Gender.male;
    isAutoValidateEnabled.value = false;
  }
}
