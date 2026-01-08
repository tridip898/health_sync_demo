import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/appointment_details_response_model.dart';
import 'package:health_sync_question/app/data/repository/appointment_repository.dart';

class AppointmentDetailsController extends GetxController {
  final AppointmentRepository _appointmentRepository = AppointmentRepository();
  final Rx<AppointmentDetails> appointmentDetails = AppointmentDetails().obs;
  final appointmentId = Get.arguments;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchAppointmentDetails();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchAppointmentDetails() async {
    Loading.show();
    final response = await _appointmentRepository.getAppointmentDetails(
      appointmentId: appointmentId,
    );
    Loading.hide();
    response.fold(
      (error) {
        Toaster.error(error.message ?? 'Failed to fetch appointment details');
      },
      (success) {
        appointmentDetails.value = success.data ?? AppointmentDetails();
      },
    );
    isLoading.value = false;
  }
}
