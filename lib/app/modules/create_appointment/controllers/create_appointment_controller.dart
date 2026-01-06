import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_bottom_sheet.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/data/model/doctor_availability_model.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/request/create_appointment_request_model.dart';
import 'package:health_sync_question/app/data/repository/appointment_repository.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class CreateAppointmentController extends GetxController {
  final DoctorModel? doctorModel = Get.arguments?['doctor'];

  Rx<DoctorOrganizationModel?> selectedDoctorOrganization = Rx(null);
  Rx<DateTime?> selectedDate = Rx(null);
  RxList<Map<String, String>> questionnaires = <Map<String, String>>[].obs;
  Rx<bool?> isDateValid = Rx(null);

  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController organizationNameController =
      TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AppointmentRepository appointmentRepository = AppointmentRepository();

  @override
  void onReady() {
    if (doctorModel == null) {
      Get.back();
      Toaster.error('Failed to get doctor profile');
    } else {
      doctorNameController.text = doctorModel!.profile?.fullName ?? '';
    }
    if (Get.arguments['questionnaire'] != null) {
      questionnaires.assignAll(Get.arguments['questionnaire']);
    }
    super.onReady();
  }

  @override
  onClose() {
    doctorNameController.dispose();
    organizationNameController.dispose();
    notesController.dispose();
    super.onClose();
  }

  onOrganizationTap() async {
    final doctorOrganizationList = doctorModel!.doctorOrganizations;
    if (doctorOrganizationList?.isNotEmpty == true) {
      final pickedOrganization = await Get.bottomSheet(
        Obx(() {
          return AppDropdownBottomSheet(
            items: doctorOrganizationList!,
            currentItem: selectedDoctorOrganization.value,
            title: 'Organization',
            getTitle: (item) => item.organization?.name ?? 'N/A',
          );
        }),
        isScrollControlled: true,
      );

      if (pickedOrganization != null) {
        selectedDoctorOrganization.value = pickedOrganization;
        organizationNameController.text =
            selectedDoctorOrganization.value?.organization?.name ?? '';
        selectedDate.value = null;
        isDateValid.value = null;
      }
    }
  }

  onOrganizationRemove() {
    selectedDoctorOrganization.value = null;
    organizationNameController.clear();
  }

  onAppointmentDateSelect(DateTime appointmentDate) {
    selectedDate.value = appointmentDate;
    isDateValid.value = true;
  }

  onAddQuestionnaireTap() async {
    final questionnaireResult = await Get.toNamed(Routes.COMPLAINT);
    if (questionnaireResult is List && questionnaireResult.isNotEmpty) {
      if (questionnaireResult.first is Section) {
        questionnaires.add(
          SectionUtils.convertToMap(questionnaireResult as List<Section>),
        );
      }
    }
  }

  onCreateAppointment() async {
    if (formKey.currentState?.validate() == true &&
        selectedDate.value != null &&
        isDateValid.value == true) {
      final patientId =
          appController.userModel.value?.currentRole?.patient?.patientId;
      final doctorId = doctorModel?.doctorId;
      final organizationId =
          selectedDoctorOrganization.value?.organization?.organizationId;
      if (patientId == null ||
          doctorId == null ||
          organizationId == null ||
          selectedDate.value == null) {
        Toaster.warning('Some fields are missing');
        return;
      }

      Loading.show();
      final response = await appointmentRepository.createAppointment(
        requestModel: CreateAppointmentRequest(
          patientId: patientId,
          doctorId: doctorId,
          organizationId: organizationId,
          appointmentDate: selectedDate.value!,
          questionnaire: questionnaires.isNotEmpty ? questionnaires : null,
          note: notesController.text.trim().isNotEmpty
              ? notesController.text.trim()
              : null,
        ),
      );
      Loading.hide();

      response.fold(
        (errorRes) {
          Toaster.error(errorRes.message ?? 'Failed to create appointment');
        },
        (successRes) {
          Get.until((route) => route.settings.name == Routes.DASHBOARD);
          Toaster.success(
            successRes.message ?? 'Appointment created successfully',
          );
        },
      );
    } else {
      Toaster.warning('Please fillup all the required fields');
      if (selectedDate.value == null) {
        isDateValid.value = false;
      }
    }
  }

  onRemoveQuestionnaire(int index) {
    questionnaires.removeAt(index);
  }
}
