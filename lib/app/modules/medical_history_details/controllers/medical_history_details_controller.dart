import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/utils/toaster.dart';
import '../../../data/model/medical_history_response_model.dart';
import '../../../data/repository/medical_history_repository.dart';
import '../../medical_history_list/views/medical_history_list_view.dart';

class MedicalHistoryDetailsController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();

  final isLoading = true.obs;
  final history = Rxn<MedicalHistoryModel>();

  String? patientId;
   String? medicalHistoryId;
   ColorPair? colorPair;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>?;

    if (args == null ||
        args['patientId'] == null ||
        args['medicalHistoryId'] == null) {
      Toaster.error('Invalid navigation arguments');
      return;
    }

    patientId = args['patientId'] as String;
    medicalHistoryId = args['medicalHistoryId'] as String;
    colorPair = args['colorPair'] as ColorPair;
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    isLoading.value = true;
    final id = patientId;
    final historyId = medicalHistoryId;

    if (id == null || historyId == null) {
      return;
    }

    final response = await repository.getPatientMedicalHistoryDetails(
      patientId: id,
      medicalHistoryId: historyId,
    );

    response.fold(
          (error) {
        Toaster.error(error.message ?? 'Failed to load details');
      },
          (success) {
        history.value = success.data;
      },
    );

    isLoading.value = false;
  }
}
