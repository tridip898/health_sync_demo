import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';

class MedicineCard extends StatelessWidget {
  final PrescriptionItems? medicine;

  const MedicineCard({super.key, this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gray.base100,
        borderRadius: borderRadius12,
      ),
      padding: padAll12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(medicine?.medicineName ?? '', style: textStyle.bold.s16),
          if ((medicine?.strength ?? '') != '')
            Text(
              medicine?.strength ?? '',
              style: textStyle.semiBold.s14.copyWith(color: blue.base800),
            ),
          gapH12,
          Row(
            children: [
              _dosageAndDuration(
                title: 'Dosage',
                value: medicine?.dosage ?? '',
              ),
              _dosageAndDuration(
                title: 'Duration',
                value: '${medicine?.durationDays ?? 0} Days',
              ),
            ],
          ),
          if ((medicine?.instructions ?? '') != '') ...[
            Divider(color: gray.base200),
            Row(
              children: [
                Icon(Icons.info, color: Colors.black45, size: 16),
                gapW8,
                Flexible(
                  child: Text(
                    medicine?.instructions ?? '',
                    style: textStyle.medium.s14.copyWith(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  _dosageAndDuration({String title = '', String value = ''}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: textStyle.bold.s10.copyWith(
              color: gray.base400,
              fontSize: 11,
            ),
          ),
          gapH(4),
          Text(value, style: textStyle.semiBold.s14),
        ],
      ),
    );
  }
}
