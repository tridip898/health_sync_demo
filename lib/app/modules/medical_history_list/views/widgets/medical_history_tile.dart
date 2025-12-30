import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';

import '../../../../core/utils/date_extensions.dart';
import '../../../../data/model/medical_history_response_model.dart';

class MedicalHistoryTile extends StatelessWidget {
  final MedicalHistoryModel history;

  const MedicalHistoryTile({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {

    final categoryList = history.categories
        ?.map((c) => c.category?.name ?? '')
        .where((name) => name.isNotEmpty)
        .toList() ?? [];

    final formattedDate = history.date?.toDdMmmYyyy() ?? '';

    return GestureDetector(
      onTap: () {
        // Navigate to details if needed
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AssetPath.icon_medical_history,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
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
                      padding: const EdgeInsets.only(bottom: 4),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categoryList.map((name) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Chip(
                                label: Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.blueGrey.shade600,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                visualDensity: VisualDensity.compact, // smaller chip
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                  const SizedBox(height: 4),


                  Text(
                    history.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
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

