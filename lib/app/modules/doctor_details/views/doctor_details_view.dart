import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/constants/string_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_availability_model.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/modules/doctor_details/views/widgets/about_doctor.dart';
import 'package:health_sync_question/app/modules/doctor_details/views/widgets/doctor_organization.dart';
import 'package:health_sync_question/app/modules/doctor_details/views/widgets/doctor_profile.dart';
import 'package:intl/intl.dart';

import '../controllers/doctor_details_controller.dart';

class DoctorDetailsView extends GetView<DoctorDetailsController> {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Doctor Details'),
      bottomNavigationBar: Obx(() {
        if (controller.doctorModel.value == null) return SizedBox();
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          color: Colors.white,
          child: CustomButton(
            text: 'Book Appointment',
            onPressed: controller.onBookAppointment,
          ),
        );
      }),
      body: Obx(() {
        if (controller.doctorModel.value == null) return SizedBox();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                DoctorProfile(doctorModel: controller.doctorModel.value!),
                gapH4,
                if (controller
                        .doctorModel
                        .value
                        ?.doctorOrganizations
                        ?.isNotEmpty ==
                    true)
                  DoctorOrganization(
                    doctorOrganizationModel:
                        controller.doctorModel.value!.doctorOrganizations!,
                  ),
                gapH16,
                AboutDoctor(doctorModel: controller.doctorModel.value!),
              ],
            ),
          ),
        );
      }),
    );
  }
}
