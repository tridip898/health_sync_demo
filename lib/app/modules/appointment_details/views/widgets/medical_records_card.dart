import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/appointment_details_response_model.dart';

class MedicalRecordsCard extends StatelessWidget {
  final Extra? extraNote;

  const MedicalRecordsCard({super.key, this.extraNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: 8),
        ],
      ),
      padding: padAll20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MEDICAL RECORDS",
            style: textStyle.bold.s12.copyWith(color: gray.base700),
          ),
          gapH12,
          Container(
            padding: padAll12,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: gray.base100,
              border: Border.all(color: gray.base200, width: 1),
              borderRadius: borderRadius(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Extra Note",
                  style: textStyle.medium.s12.copyWith(color: gray.base500),
                ),
                Text(extraNote?.note ?? '', style: textStyle.medium.s14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
