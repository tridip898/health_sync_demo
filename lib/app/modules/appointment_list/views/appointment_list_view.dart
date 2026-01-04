import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/appointment_list/views/widgets/appointment_card.dart';

import '../controllers/appointment_list_controller.dart';

class AppointmentListView extends GetView<AppointmentListController> {
  const AppointmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Appointments'),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Obx(() {
              if (controller.appointmentList.isEmpty) return SizedBox();
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      appointmentModel: controller.appointmentList[index],
                    );
                  },
                  separatorBuilder: (context, index) => gapH8,
                  itemCount: controller.appointmentList.length,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
