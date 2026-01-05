import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/doctor_card.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/medical_records_card.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/organization_card.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/patient_details_card.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/scheduled_info_card.dart';

import '../controllers/appointment_details_controller.dart';

class AppointmentDetailsView extends GetView<AppointmentDetailsController> {
  const AppointmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Appointment Details"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: padSym(horizontal: 16, vertical: 16),
        child: Obx(() {
          if (controller.isLoading.value) return SizedBox.shrink();
          final appointment = controller.appointmentDetails.value;
          final doctor = appointment.doctor;
          final organization = appointment.organization;
          final patient = appointment.patient;
          final extraNote = appointment.extra;
          return Column(
            children: [
              DoctorCard(doctor: doctor),
              if (organization != null) ...[
                gapH24,
                OrganizationCard(organization: organization),
              ],
              gapH24,
              ScheduledInfoCard(appointmentDetails: appointment),
              gapH24,
              PatientDetailsCard(patient: patient),
              gapH24,
              MedicalRecordsCard(
                extraNote: extraNote,
                appointmentDetails: appointment,
              ),
            ],
          );
        }),
      ),
    );
  }
}
