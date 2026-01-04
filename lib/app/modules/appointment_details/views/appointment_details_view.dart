import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../controllers/appointment_details_controller.dart';

class AppointmentDetailsView extends GetView<AppointmentDetailsController> {
  const AppointmentDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Appointment Details"),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
