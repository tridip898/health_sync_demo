import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/prescription/controllers/prescription_controller.dart';
import 'package:health_sync_question/app/modules/prescription/widgets/prescription_card.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class PrescriptionView extends GetView<PrescriptionController> {
  const PrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Prescription"),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        padding: padSym(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) return SizedBox.shrink();
              if (controller.prescriptionList.isEmpty) {
                return SizedBox(
                  height: Get.height * .7,
                  child: Center(
                    child: Text(
                      "No prescription has been generated for you.",
                      style: textStyle.semiBold.s18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                controller: controller.scrollController,
                itemBuilder: (_, index) {
                  final prescription =
                      controller.prescriptionList[index].prescription;
                  return PrescriptionCard(
                    prescription: prescription!,
                    onTap: () {
                      Get.toNamed(
                        Routes.PRESCRIPTION_DETAILS,
                        arguments: {
                          'id': controller.prescriptionList[index].id,
                          'prescriptionId': prescription.prescriptionId,
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (_, index) {
                  return gapH12;
                },
                itemCount: controller.prescriptionList.length,
              );
            }),
          ],
        ),
      ),
    );
  }
}
