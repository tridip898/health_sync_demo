import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/no_data_found.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/date_extensions.dart';
import '../../../core/utils/delete_confirm_dialog.dart';
import '../../../routes/app_pages.dart';
import '../controllers/medical_history_details_controller.dart';

class MedicalHistoryDetailsView
    extends GetView<MedicalHistoryDetailsController> {
  const MedicalHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Medical History"),
      body: Obx(() {
        if (!controller.hasLoadedOnce.value) {
          return const SizedBox();
        }

        final history = controller.history.value;

        if (history == null) {
          return const Center(child: NoDataFound());
        }

        final categories =
            history.categories
                ?.map((e) => e.category?.name ?? '')
                .where((e) => e.isNotEmpty)
                .toList() ??
            [];

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 56,
                        height: 56,
                        color: Colors.green.shade50,
                        // optional background
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.medical_services,
                          size: 32,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      history.title ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              _InfoCard(
                title: 'DATE RECORD',
                child: Text(
                  history.date?.toDdMmmYyyy() ?? '',
                  style: textStyle.regular.s14,
                ),
              ),

              _InfoCard(
                title: 'DESCRIPTION',
                child: Text(
                  history.description ?? '',
                  style: textStyle.regular.s14,
                ),
              ),

              if (categories.isNotEmpty)
                _InfoCard(
                  title: 'ASSOCIATED CATEGORIES',
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: categories
                        .map((e) => Chip(label: Text(e)))
                        .toList(),
                  ),
                ),

              const SizedBox(height: 24),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Edit Entry",
                      onPressed: () {
                        Get.toNamed(
                          Routes.UPDATE_MEDICAL_HISTORY,
                          arguments: {
                            'patientId': controller.patientId,
                            'medicalHistoryId': controller.medicalHistoryId,
                            'history': controller.history.value,
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Delete Entry",
                      variant: CustomButtonVariant.outlined,
                      borderColor: Colors.red,
                      textColor: Colors.red,
                      onPressed: () {
                        Get.dialog(
                          DeleteConfirmDialog(
                            title: "Delete Medical History",
                            subtitle:
                                "Are you sure you want to delete this medical history?",
                            onYes: () {
                              controller.deleteMedicalHistory();
                            },
                          ),
                          barrierDismissible: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            child,
          ],
        ),
      ),
    );
  }
}
