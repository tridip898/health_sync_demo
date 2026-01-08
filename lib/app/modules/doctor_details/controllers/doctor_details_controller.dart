import 'dart:developer';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/repository/doctor_repository.dart';
import 'package:health_sync_question/app/modules/doctor_list/controllers/doctor_list_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class DoctorDetailsController extends GetxController {
  final doctorId = Get.arguments?['doctorId'];
  final DoctorRepository doctorRepository = DoctorRepository();

  Rx<DoctorModel?> doctorModel = Rx(null);

  @override
  void onReady() {
    loadDoctorDetails();
    super.onReady();
  }

  loadDoctorDetails() async {
    Loading.show();
    final response = await doctorRepository.getDoctorDetails(
      doctorId: doctorId,
    );
    Loading.hide();

    response.fold(
      (errorRes) {
        Toaster.error(errorRes.message ?? 'Failed to load doctor details');
      },
      (successRes) {
        doctorModel.value = successRes.data;
      },
    );
  }

  void onBookAppointment() {
    Get.toNamed(
      Routes.CREATE_APPOINTMENT,
      arguments: {
        "doctor": doctorModel.value,
        'questionnaire': Get.isRegistered<DoctorListController>()
            ? Get.find<DoctorListController>().questionnaires.value
            : null,
      },
    );
  }
}
