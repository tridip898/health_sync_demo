import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_filter_tab.dart';
import 'package:health_sync_question/app/modules/prescription/widgets/prescription_card.dart';
import 'package:health_sync_question/app/modules/prescription_details/controllers/prescription_details_controller.dart';
import 'package:health_sync_question/app/modules/prescription_details/widgets/prescription_details_card.dart';

class PrescriptionDetailsView extends GetView<PrescriptionDetailsController> {
  const PrescriptionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Details"),
      bottomNavigationBar: _bottomButton(),
      body: Padding(
        padding: padSym(horizontal: 16, vertical: 0),
        child: Column(
          children: [
            gapH12,
            Obx(() {
              if (controller.prescriptionHistory.isEmpty) {
                return SizedBox();
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomFilterTab(
                  items: ["Active", "History"],
                  selectedIndex: controller.selectedIndex.value,
                  onChanged: (int index) {
                    controller.selectedIndex.value = index;
                  },
                ),
              );
            }),
            Flexible(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return SizedBox();
                }

                if (controller.selectedIndex.value == 1) {
                  if (controller.prescriptionHistory.isEmpty) {
                    return const Center(
                      child: Text('No prescription history found'),
                    );
                  }

                  return ListView.separated(
                    itemCount: controller.prescriptionHistory.length,
                    separatorBuilder: (_, __) => gapH12,
                    itemBuilder: (_, index) {
                      final prescription =
                          controller.prescriptionHistory[index];
                      return PrescriptionCard(
                        prescription: prescription,
                        onTap: () {
                          controller.prescriptionHistoryDetailsClick(
                            prescription,
                          );
                        },
                      );
                    },
                  );
                }

                final details = controller.prescriptionDetails.value;
                return Opacity(
                  opacity: .8,
                  child: PrescriptionDetailsCard(prescription: details),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomButton() {
    return Obx(() {
      if (controller.isLoading.value || controller.selectedIndex.value == 1) {
        return SizedBox.shrink();
      }
      return Container(
        padding: padSym(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: gray.base100)),
        ),
        child: CustomButton(
          text: 'Download PDF',
          onPressed: controller.onDownloadPdf,
        ),
      );
    });
  }
}
