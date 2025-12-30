import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:health_sync_question/app/data/repository/prescription_repository.dart';

class PrescriptionDetailsController extends GetxController {
  final PrescriptionRepository _prescriptionRepository =
      PrescriptionRepository();
  final RxList<Prescription> prescriptionHistory = <Prescription>[].obs;
  final Rx<Prescription> prescriptionDetails = Prescription().obs;
  final String prescriptionId = Get.arguments['prescriptionId'];
  final String id = Get.arguments['id'];
  final RxInt selectedIndex = 0.obs;
  final RxBool isLoading = true.obs;
  final bool isHistory = Get.arguments['isHistory'] ?? false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    log(prescriptionId);
    if (isHistory) {
      prescriptionDetails.value = Get.arguments['prescriptionDetails'];
      isLoading.value = false;
    } else {
      await fetchPrescriptionHistory();
      await fetchPrescriptionDetails();
    }

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchPrescriptionDetails() async {
    Loading.show();
    final response = await _prescriptionRepository.getPrescriptionDetails(
      id: id,
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch prescription details');
        isLoading.value = false;
      },
      (success) {
        prescriptionDetails.value =
            success.data?.prescription ?? Prescription();
        isLoading.value = false;
      },
    );
  }

  void onDownloadPdf() async {
    Loading.show();
    final response = await _prescriptionRepository.pdfGenerate(
      prescriptionId: prescriptionId,
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to generate pdf');
      },
      (success) async {
        await downloadPdfToDownloads(
          success.data,
          fileName: 'prescription_${DateTime.now().millisecondsSinceEpoch}.pdf',
        );
      },
    );
  }

  Future<File> downloadPdfToDownloads(
    String base64Data, {
    String fileName = 'prescription.pdf',
  }) async {
    final bytes = base64Decode(base64Data);

    final directory = Directory('/storage/emulated/0/Download');

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(bytes);
    Toaster.success("Downloaded Successfully");
    return file;
  }

  Future<void> fetchPrescriptionHistory() async {
    Loading.show();
    final response = await _prescriptionRepository.getPrescriptionHistory(
      prescriptionId: prescriptionId,
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch prescription history');
      },
      (success) {
        prescriptionHistory.value = success.data ?? [];
      },
    );
  }
}
