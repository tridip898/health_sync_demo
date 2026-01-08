import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/appointment_details_response_model.dart';
import 'package:health_sync_question/app/data/model/request/get_appointment_request_model.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/card_background.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/prescription_bottom_widget.dart';

class MedicalRecordsCard extends StatelessWidget {
  final String? extraNote;
  final AppointmentDetails? appointmentDetails;

  const MedicalRecordsCard({
    super.key,
    this.extraNote,
    this.appointmentDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CardBackground(
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
              color: gray.base50,
              border: Border.all(color: gray.base100, width: 1),
              borderRadius: borderRadius12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Extra Note",
                  style: textStyle.medium.s12.copyWith(color: gray.base500),
                ),
                Text(extraNote ?? '', style: textStyle.medium.s14),
              ],
            ),
          ),
          if (appointmentDetails?.status ==
              AppointmentStatus.prescribed.value) ...[
            gapH16,
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  PrescriptionBottomWidget(
                    prescription: appointmentDetails?.doctorPrescription,
                  ),
                  isScrollControlled: true,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: green.base50,
                  borderRadius: borderRadius12,
                  border: Border.all(color: green.base100, width: 1),
                ),
                padding: padAll12,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: green.base100,
                        shape: BoxShape.circle,
                      ),
                      padding: padAll8,
                      child: Icon(
                        Icons.file_copy_rounded,
                        color: green.base500,
                        size: 16,
                      ),
                    ),
                    gapW8,
                    Expanded(
                      child: Text(
                        'Prescription',
                        style: textStyle.semiBold.s14.copyWith(
                          color: green.base500,
                        ),
                      ),
                    ),
                    gapW8,
                    Text(
                      'View',
                      style: textStyle.bold.s12.copyWith(
                        color: green.base800,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
