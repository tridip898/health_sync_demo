import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/appointment_details_response_model.dart';
import 'package:health_sync_question/app/data/model/request/get_appointment_request_model.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/card_background.dart';

class ScheduledInfoCard extends StatelessWidget {
  final AppointmentDetails? appointmentDetails;

  const ScheduledInfoCard({super.key, this.appointmentDetails});

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SCHEDULED INFO",
            style: textStyle.bold.s12.copyWith(color: gray.base700),
          ),
          gapH12,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appointment Date",
                      style: textStyle.medium.s14.copyWith(color: gray.base400),
                    ),
                    gapH4,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: blue.base500,
                        ),
                        gapW8,
                        Text(
                          appointmentDetails
                                  ?.appointmentDate
                                  .formatToDdMmmYyyy ??
                              '',
                          style: textStyle.bold.s14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gapW8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Status",
                    style: textStyle.medium.s14.copyWith(color: gray.base400),
                  ),
                  gapH4,
                  Container(
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        appointmentDetails?.status ?? '',
                      )?.withValues(alpha: .1),
                      borderRadius: radius16,
                      border: Border.all(
                        color:
                            _getStatusColor(
                              appointmentDetails?.status ?? '',
                            )?.withValues(alpha: .2) ??
                            gray.base100,
                      ),
                    ),
                    padding: padSym(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: _getStatusColor(
                              appointmentDetails?.status ?? '',
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        gapW8,
                        Text(
                          appointmentDetails?.status?.capitalizeFirst ?? '',
                          style: textStyle.bold.s14.copyWith(
                            color: _getStatusColor(
                              appointmentDetails?.status ?? '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color? _getStatusColor(String status) {
    if (status == AppointmentStatus.pending.value ||
        status == AppointmentStatus.paymentPending.value) {
      return Colors.orange;
    } else if (status == AppointmentStatus.confirmed.value) {
      return blue.base500;
    } else if (status == AppointmentStatus.paymentDone.value ||
        status == AppointmentStatus.completed.value ||
        status == AppointmentStatus.prescribed.value) {
      return green.base500;
    } else if (status == AppointmentStatus.paymentPending.value) {
      return red.base500;
    }
    return null;
  }
}
