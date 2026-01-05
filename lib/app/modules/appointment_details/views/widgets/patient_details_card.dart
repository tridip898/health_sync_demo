import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/profile_response_model.dart';

class PatientDetailsCard extends StatelessWidget {
  final Patient? patient;

  const PatientDetailsCard({super.key, this.patient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius12,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: 8),
        ],
      ),
      padding: padAll12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PATIENT DETAILS",
            style: textStyle.bold.s12.copyWith(color: gray.base700),
          ),
          gapH12,
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: gray.base50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CacheNetworkImage(
                    imageUrl: patient?.profile?.image ?? '',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              gapW12,
              Expanded(
                child: Text(
                  patient?.profile?.fullName ?? '',
                  style: textStyle.bold.s16,
                ),
              ),
            ],
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: _infoCard(
                  title: "Gender",
                  value: patient?.profile?.gender ?? '',
                ),
              ),
              Expanded(
                child: _infoCard(
                  title: "Date of birth",
                  value: patient?.profile?.dateOfBirth.formatToDdMmmYyyy ?? '',
                ),
              ),
            ],
          ),
          Divider(height: 24, color: gray.base100),
          _infoCard(title: "address", value: patient?.profile?.address ?? ''),
          Divider(height: 24, color: gray.base100),
          _infoCard(
            title: "phone",
            value: patient?.profile?.publicPhoneNumber ?? '',
          ),
        ],
      ),
    );
  }

  Widget _infoCard({String title = '', String value = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: textStyle.semiBold.s12.copyWith(color: gray.base400),
        ),
        gapH4,
        Text(value, style: textStyle.bold.s14),
      ],
    );
  }
}
