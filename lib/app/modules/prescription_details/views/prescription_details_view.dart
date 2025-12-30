import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/app_appbar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_filter_tab.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:health_sync_question/app/modules/prescription/widgets/prescription_card.dart';
import 'package:health_sync_question/app/modules/prescription_details/controllers/prescription_details_controller.dart';
import 'package:health_sync_question/app/modules/prescription_details/widgets/medicine_card.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

class PrescriptionDetailsView extends GetView<PrescriptionDetailsController> {
  const PrescriptionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8F7),
      appBar: AppAppbar(title: "Details"),
      bottomNavigationBar: _bottomButton(),
      body: Padding(
        padding: padSym(horizontal: 20),
        child: Column(
          children: [
            Obx(() {
              if (controller.prescriptionHistory.isEmpty) {
                return SizedBox();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: CustomFilterTab(
                  items: ["Active", "History"],
                  selectedIndex: controller.selectedIndex.value,
                  onChanged: (int index) {
                    controller.selectedIndex.value = index;
                  },
                ),
              );
            }),
            gapH16,
            Obx(() {
              if (controller.prescriptionHistory.isNotEmpty &&
                  controller.selectedIndex.value == 1) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final prescription =
                          controller.prescriptionHistory[index];
                      return PrescriptionCard(
                        prescription: prescription,
                        onTap: () {
                          Get.toNamed(
                            Routes.PRESCRIPTION_DETAILS,
                            arguments: {
                              'isHistory': true,
                              'prescriptionDetails': prescription,
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, index) {
                      return gapH12;
                    },
                    itemCount: controller.prescriptionHistory.length,
                  ),
                );
              }
              final details = controller.prescriptionDetails.value;
              if (controller.isLoading.value) {
                return SizedBox();
              }
              return Expanded(
                child: Opacity(
                  opacity: .8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          gapH20,
                          Padding(
                            padding: padSym(horizontal: 16),
                            child: Text(
                              details.prescriptionText ?? '',
                              style: textStyle.bold.s18,
                            ),
                          ),
                          gapH8,
                          Padding(
                            padding: padSym(horizontal: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  size: 18,
                                  color: gray.base500,
                                ),
                                gapW8,
                                Flexible(
                                  child: Text(
                                    (details.createdAt ?? '') != ''
                                        ? DateFormat('MMM dd, yyyy').format(
                                            DateTime.parse(
                                              details.createdAt ?? '',
                                            ),
                                          )
                                        : '',
                                    style: textStyle.regular.s14.copyWith(
                                      color: gray.base500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 32, color: gray.base100),
                          _sectionHeader(
                            title: 'Medicine',
                            icon: 'assets/icons/tablets.png',
                            color: Colors.blue,
                          ),
                          gapH12,
                          ListView.separated(
                            shrinkWrap: true,
                            padding: padSym(horizontal: 16),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final medicine =
                                  details.prescriptionItems?[index];
                              return MedicineCard(medicine: medicine);
                            },
                            separatorBuilder: (context, index) {
                              return gapH12;
                            },
                            itemCount: details.prescriptionItems?.length ?? 0,
                          ),
                          Divider(
                            height: 24,
                            color: gray.base100,
                            endIndent: 16,
                            indent: 16,
                          ),
                          _sectionHeader(
                            title: 'lab tests',
                            icon: 'assets/icons/microscope.png',
                            color: Colors.purple,
                          ),
                          gapH12,
                          ListView.separated(
                            shrinkWrap: true,
                            padding: padSym(horizontal: 16),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final labTest = details.labTests?[index];
                              return _lebTestCard(labTest: labTest);
                            },
                            separatorBuilder: (context, index) {
                              return gapH12;
                            },
                            itemCount: details.labTests?.length ?? 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  _sectionHeader({String title = '', String icon = '', Color? color}) {
    return Padding(
      padding: padSym(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: color?.withValues(alpha: 0.2),
            child: Padding(
              padding: padAll5,
              child: Image.asset(icon, color: color),
            ),
          ),
          gapW8,
          Text(
            title.toUpperCase(),
            style: textStyle.semiBold.s14.copyWith(color: gray.base500),
          ),
        ],
      ),
    );
  }

  _lebTestCard({LabTests? labTest}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: gray.base100, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: padAll16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labTest?.testName ?? '', style: textStyle.bold.s16),
          gapH8,
          Text(
            labTest?.notes ?? '',
            style: textStyle.medium.s14.copyWith(color: gray.base500),
          ),
        ],
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
