import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../../core/utils/date_extensions.dart';
import '../../../../data/model/medical_history_response_model.dart';
import '../../../../routes/app_pages.dart';
import '../medical_history_list_view.dart';

class MedicalHistoryTile extends StatelessWidget {
  final MedicalHistoryModel history;
  final ColorPair colorPair;

  const MedicalHistoryTile({
    super.key,
    required this.history,
    required this.colorPair,
  });

  @override
  Widget build(BuildContext context) {
    final categoryList =
        history.categories
            ?.map((c) => c.category?.name ?? '')
            .where((name) => name.isNotEmpty)
            .toList() ??
        [];

    final formattedDate = history.date?.toDdMmmYyyy() ?? '';

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.MEDICAL_HISTORY_DETAILS,
          arguments: {
            'patientId': history.patientId!,
            'medicalHistoryId': history.patientMedicalHistoryId!,
            'colorPair': colorPair,
          },
        );

      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: colorPair.light,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.medical_services_outlined,
                color: colorPair.dark,
                size: 28,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.title ?? 'Medical Record',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  if (categoryList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Wrap(
                        spacing: 2,
                        runSpacing: 2,
                        children: categoryList.map((name) {
                          return Chip(
                            label: Text(
                              name,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorPair.dark,
                              ),
                            ),
                            backgroundColor: colorPair.light,
                            padding: EdgeInsets.zero,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            visualDensity: VisualDensity.compact,

                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide.none,
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  const SizedBox(height: 4),

                  Text(
                    history.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
