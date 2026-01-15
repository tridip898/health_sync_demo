import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/utils/toaster.dart';
import '../../../core/widgets/loading.dart';
import '../../../data/model/medical_history_response_model.dart';
import '../../../data/repository/medical_history_repository.dart';
import '../../medical_history_list/controllers/medical_history_list_controller.dart';
import '../../medical_history_list/views/medical_history_list_view.dart';

class MedicalHistoryDetailsController extends GetxController {
  final MedicalHistoryRepository repository = MedicalHistoryRepository();
  final MedicalHistoryListController medicalHistoryListController = Get.find();

  final hasLoadedOnce = false.obs;
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
  }

  @override
  void onReady() {
    super.onReady();
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    final id = patientId;
    final historyId = medicalHistoryId;

    if (id == null || historyId == null) {
      Toaster.error('Invalid data');
      hasLoadedOnce.value = true;
      return;
    }

    Loading.show();

    final response = await repository.getPatientMedicalHistoryDetails(
      patientId: id,
      medicalHistoryId: historyId,
    );
    Loading.hide();

    await response.fold(
      (error) async {
        Toaster.error(error.message ?? 'Failed to load details');
        history.value = null;
      },
      (success) async {
        history.value = success.data;
      },
    );

    hasLoadedOnce.value = true;
  }

  Future<void> deleteMedicalHistory() async {
    Loading.show();
    final id = patientId;
    final historyId = medicalHistoryId;

    if (id == null || historyId == null) {
      return;
    }

    final response = await repository.deleteMedicalHistory(
      patientId: id,
      medicalHistoryId: historyId,
    );
    Loading.hide();
    await response.fold(
      (error) {
        Toaster.error(error.message ?? "Failed to delete medical history");
      },
      (success) async {
        if (Get.isRegistered<MedicalHistoryListController>()) {
          final controller = Get.find<MedicalHistoryListController>();
          await controller.fetchMedicalHistory();
        }
        Get.back();
        Toaster.success(
          success.message ?? "Medical history deleted successfully",
        );
      },
    );
  }
}
