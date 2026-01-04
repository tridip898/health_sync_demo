import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:health_sync_question/app/data/repository/prescription_repository.dart';

class PrescriptionController extends GetxController {
  final PrescriptionRepository _prescriptionRepository =
      PrescriptionRepository();
  final ScrollController scrollController = ScrollController();
  final RxList<PrescriptionData> prescriptionList = <PrescriptionData>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await fetchPrescriptionList();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchPrescriptionList() async {
    Loading.show();
    final response = await _prescriptionRepository.getPrescription(
      query: {
        'patientId':
            appController.userModel.value?.currentRole?.patient?.patientId ??
            '',
      },
    );
    Loading.hide();

    response.fold(
      (error) {
        Toaster.error(error.message ?? "Failed to fetch prescription list");
      },
      (success) {
        prescriptionList.value = success.data ?? [];
      },
    );
  }
}
