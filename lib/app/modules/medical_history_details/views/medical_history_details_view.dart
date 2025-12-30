import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/asset_path.dart';
import '../../../core/utils/date_extensions.dart';
import '../controllers/medical_history_details_controller.dart';

class MedicalHistoryDetailsView
    extends GetView<MedicalHistoryDetailsController> {
  const MedicalHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical History')),
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
                        AssetPath.icon_medical_history,
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
                title: 'Date',
                child: Text(history.date?.toDdMmmYyyy() ?? ''),
              ),

              _InfoCard(
                title: 'Description',
                child: Text(history.description ?? ''),
              ),

              if (categories.isNotEmpty)
                _InfoCard(
                  title: 'Categories',
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
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
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
