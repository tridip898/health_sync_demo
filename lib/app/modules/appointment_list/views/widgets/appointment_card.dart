import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/appointment_list_response_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointmentModel;

  const AppointmentCard({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    final doctor = appointmentModel.doctor;
    final specialty = DoctorUtils.getSpecialty(doctor?.doctorSpecialties);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: gray.base300),
        borderRadius: radius8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month, size: 16),
              Text(
                appointmentModel.appointmentDate?.formatToDdMmmYyyy ?? '',
                style: textStyle.bold.s12,
              ),
              Spacer(),
              Icon(Icons.more_vert, size: 16),
            ],
          ),
          gapH4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CacheNetworkImage(
                  imageUrl: doctor?.profile?.image ?? '',
                ),
              ),
              gapW4,
              Text(
                doctor?.profile?.fullName ?? '',
                style: textStyle.medium.s14,
              ),
            ],
          ),
          if (specialty.trim().isNotEmpty)
            Text(specialty, style: textStyle.medium.s14),
        ],
      ),
    );
  }
}
