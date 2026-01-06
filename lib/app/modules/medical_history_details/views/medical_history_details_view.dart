import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import '../../../core/constants/asset_path.dart';
import '../../../core/utils/date_extensions.dart';
import '../../../routes/app_pages.dart';
import '../controllers/medical_history_details_controller.dart';

class MedicalHistoryDetailsView
    extends GetView<MedicalHistoryDetailsController> {
  const MedicalHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Medical History'),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final history = controller.history.value;
        if (history == null) {
          return const Center(child: Text('No data found'));
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
                      child: Image.asset(
                        AssetPath.iconMedicalHistory,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
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
                child: Text(history.date?.formatToDdMmmYyyy ?? ''),
              ),

              _InfoCard(
                title: 'DESCRIPTION',
                child: Text(history.description ?? ''),
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
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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

                      label: const Text('Edit Entry'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          Routes.DELETE_MEDICAL_HISTORY,
                          arguments: {
                            'patientId': controller.patientId,
                            'medicalHistoryId': controller.medicalHistoryId,
                            'history': controller.history.value,
                          },
                        );
                      },
                      label: const Text('Delete Entry'),
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
