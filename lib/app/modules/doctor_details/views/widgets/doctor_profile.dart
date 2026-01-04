import 'package:flutter/material.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';

class DoctorProfile extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorProfile({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    final profile = doctorModel.profile;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: radius8,
                    child: CacheNetworkImage(
                      imageUrl: profile?.image ?? '',
                      width: 80,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapW12,
          Expanded(
            child: SizedBox(
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile?.fullName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.semiBold.s14,
                  ),
                  gapH4,
                  Text(
                    DoctorUtils.getAcademicQualification(
                      doctorModel.doctorAcademicQualification,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12,
                  ),
                  gapH4,
                  Text(
                    DoctorUtils.getSpecialty(doctorModel.doctorSpecialties),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12.copyWith(color: blue.base600),
                  ),
                  gapH4,
                  Row(
                    children: [
                      if (doctorModel.verified == true) ...[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: green.base500,
                            borderRadius: radius4,
                          ),
                          child: Text(
                            'Verified',
                            style: textStyle.bold.s12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        gapW10,
                      ],
                      if (doctorModel.yearExperience != null) ...[
                        Text(
                          '${doctorModel.yearExperience.toString()}+ yrs',
                          style: textStyle.regular.s12,
                        ),
                      ],
                      Spacer(),
                      Text(
                        doctorModel.licenseNumber ?? '',
                        style: textStyle.regular.s12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
