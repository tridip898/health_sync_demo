import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/card_background.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel? doctor;

  const DoctorCard({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    final specialty = DoctorUtils.getSpecialty(doctor?.doctorSpecialties);
    return CardBackground(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(color: gray.base50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CacheNetworkImage(
                imageUrl: doctor?.profile?.image ?? '',
                width: 65,
                height: 65,
              ),
            ),
          ),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.profile?.fullName ?? '',
                  style: textStyle.bold.s20,
                ),
                if (specialty.isNotEmpty) ...[
                  gapH4,
                  Text(
                    specialty,
                    style: textStyle.semiBold.s16.copyWith(color: blue.base500),
                  ),
                ],

                gapH8,
                Row(
                  children: [
                    Icon(Icons.call, size: 18, color: Colors.black54),
                    gapW8,
                    Expanded(
                      child: Text(
                        doctor?.profile?.publicPhoneNumber ?? '',
                        style: textStyle.medium.s16.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                if (doctor?.profile?.publicEmail != null) ...[
                  gapH4,
                  Row(
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.black54),
                      gapW8,
                      Expanded(
                        child: Text(
                          doctor?.profile?.publicEmail ?? '',
                          style: textStyle.medium.s16.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
