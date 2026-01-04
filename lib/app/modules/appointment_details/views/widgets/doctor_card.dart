import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel? doctor;

  const DoctorCard({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    final specialty = DoctorUtils.getSpecialty(doctor?.doctorSpecialties);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: 8),
        ],
      ),
      padding: padAll20,
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
                gapH4,
                Text(
                  specialty,
                  style: textStyle.semiBold.s16.copyWith(color: blue.base500),
                ),
                gapH4,
                Row(
                  children: [
                    Icon(Icons.call, size: 16, color: Colors.black54),
                    gapW8,
                    Expanded(
                      child: Text(
                        doctor?.profile?.publicPhoneNumber ?? '',
                        style: textStyle.medium.s14.copyWith(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                gapH4,
                Row(
                  children: [
                    Icon(Icons.email, size: 16, color: Colors.black54),
                    gapW8,
                    Expanded(
                      child: Text(
                        doctor?.profile?.publicEmail ?? '',
                        style: textStyle.medium.s14.copyWith(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
