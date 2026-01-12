import 'package:get/get.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/model/medical_history_response_model.dart';
import '../../../data/repository/medical_history_repository.dart';

class MedicalHistoryListController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();

  final medicalHistoryList = <MedicalHistoryModel>[].obs;
  final isLoading = false.obs;

  String? patientId;

  @override
  void onInit() {
    super.onInit();

    patientId =
        appController.userModel.value?.currentRole?.patient?.patientId ?? '';

    fetchMedicalHistory();
  }

  Future<void> fetchMedicalHistory() async {

    isLoading.value = true;
    final id = patientId;
    if (id == null) {
      return;
    } else {
      final response = await repository.getPatientMedicalHistory(
        patientId: id,
        page: 1,
      );

      response.fold(
            (error) {
          Toaster.error(error.message ?? 'Failed to load medical history');
        },
            (success) {
          medicalHistoryList.assignAll(success.data ?? []);
        },
      );
    }

    isLoading.value = false;
  }

  Future<void> onRefresh() async {
    await fetchMedicalHistory();
  }
}
