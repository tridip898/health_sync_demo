import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:intl/intl.dart';

class PrescriptionCard extends StatelessWidget {
  final Prescription prescription;
  final Function()? onTap;

  const PrescriptionCard({super.key, required this.prescription, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padAll12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius12,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withValues(alpha: 0.08),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: green.base50,
                borderRadius: borderRadius8,
              ),
              padding: padAll12,
              child: Image.asset(
                'assets/icons/tablets.png',
                color: green.base500,
              ),
            ),
            gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          prescription.prescriptionText ?? '',
                          style: textStyle.bold.s16,
                        ),
                      ),
                      if (prescription.isOngoing ?? false) ...[
                        Container(
                          decoration: BoxDecoration(
                            color: green.base50,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: padSym(horizontal: 8, vertical: 2),
                          child: Text(
                            "Ongoing",
                            style: textStyle.bold.s12.copyWith(
                              color: green.base500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    "Created: ${DateFormat('MMM dd, yyyy').format(DateTime.parse(prescription.createdAt ?? ''))}",
                    style: textStyle.regular.s12.copyWith(color: gray.base500),
                  ),
                  if (prescription.prescriptionItems?.isNotEmpty ?? false) ...[
                    gapH8,
                    Text(
                      "Medicine: ${medicineName(prescription)}",
                      style: textStyle.medium.s14,
                    ),
                  ],
                  if (prescription.labTests?.isNotEmpty ?? false) ...[
                    gapH(2),
                    Text(
                      "Lab Test: ${_labTest(prescription)}",
                      style: textStyle.medium.s14,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String medicineName(Prescription prescription) {
    return (prescription.prescriptionItems ?? [])
        .map(
          (medicine) => '${medicine.medicineName ?? ''} (${medicine.strength})',
        )
        .join(', ');
  }

  String _labTest(Prescription labTest) {
    return (labTest.labTests ?? [])
        .map((medicine) => medicine.testName ?? '')
        .join(', ');
  }
}
