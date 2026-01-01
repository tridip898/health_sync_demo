import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../controllers/appointment_list_controller.dart';

class AppointmentListView extends GetView<AppointmentListController> {
  const AppointmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Appointments'),
      body: const Center(
        child: Text(
          'AppointmentListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
