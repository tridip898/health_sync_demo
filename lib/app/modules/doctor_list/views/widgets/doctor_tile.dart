import 'package:flutter/material.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/constants/string_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';

class DoctorTile extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorTile({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    final profile = doctorModel.profile;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius12,
        border: Border.all(color: gray.base100),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: radius8,
            child: CacheNetworkImage(
              imageUrl: profile?.image ?? '',
              width: 110,
              height: 110,
            ),
          ),
          gapW12,
          Expanded(
            child: SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          profile?.fullName ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.semiBold.s14,
                        ),
                      ),
                      gapW4,
                      Text(
                        '${doctorModel.yearExperience ?? 0}+ yr',
                        style: textStyle.regular.s12,
                      ),
                    ],
                  ),
                  gapH4,
                  Text(
                    'academicQualification',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12,
                  ),
                  gapH4,
                  Text(
                    'specialty',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12.copyWith(color: blue.base600),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$takaIcon${doctorModel.consultationFee ?? 0}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.bold.s12,
                      ),
                      Row(
                        children: [
                          Text('4.5', style: textStyle.regular.s12),
                          Icon(Icons.star, size: 12, color: yellow.base500),
                        ],
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