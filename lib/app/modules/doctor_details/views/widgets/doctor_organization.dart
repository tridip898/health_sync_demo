import 'package:flutter/material.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/doctor_availability_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:intl/intl.dart';

class DoctorOrganization extends StatelessWidget {
  final List<DoctorOrganizationModel> doctorOrganizationModel;

  const DoctorOrganization({super.key, required this.doctorOrganizationModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Availability', style: textStyle.bold.s18),
        gapH8,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: doctorOrganizationModel.length,
          itemBuilder: (context, index) {
            final doctorOrganization = doctorOrganizationModel[index];
            final organization = doctorOrganization.organization;
            return OrganizationInfoCard(
              organization: organization,
              availability: doctorOrganization.getNext7DaysAvailability(),
            );
          },
          separatorBuilder: (context, _) => Container(
            width: double.infinity,
            color: gray.base100,
            height: 1,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
        ),
        gapH16,
      ],
    );
  }
}

class OrganizationInfoCard extends StatelessWidget {
  final OrganizationModel? organization;
  final Map<DateTime, bool> availability;

  const OrganizationInfoCard({
    super.key,
    required this.organization,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(organization?.name ?? '', style: textStyle.bold.s14),

        if ((organization?.address ?? '').isNotEmpty) ...[
          Text(organization?.address ?? '', style: textStyle.regular.s12),
        ],

        Row(
          children: [
            if ((organization?.phoneNumber?.isNotEmpty ?? false)) ...[
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.phone, size: 10),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        organization?.phoneNumber != null
                            ? organization!.phoneNumber!.join(', ')
                            : '',
                        style: textStyle.regular.s12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if ((organization?.email?.isNotEmpty ?? false)) ...[
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.email, size: 10),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        organization?.email != null
                            ? organization!.email!.join(', ')
                            : '',
                        style: textStyle.regular.s12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        gapH8,
        _WorkingHours(availability: availability),
      ],
    );
  }
}

class _WorkingHours extends StatelessWidget {
  final Map<DateTime, bool> availability;

  const _WorkingHours({super.key, required this.availability});

  @override
  Widget build(BuildContext context) {
    final dates = availability.keys.toList()..sort();

    return Wrap(
      children: [
        ...List.generate(availability.length, (index) {
          final date = dates[index];
          final isAvailable = availability[date] ?? false;

          return _DayItem(
            DateFormat('EEE').format(date),
            DateFormat('dd').format(date),
            isAvailable,
          );
        }),
      ],
    );
  }
}

class _DayItem extends StatelessWidget {
  final String day;
  final String date;
  final bool active;

  const _DayItem(this.day, this.date, this.active);

  @override
  Widget build(BuildContext context) {
    return active
        ? Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          margin: EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            color: active ? green.base500 : gray.base200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '$day‣$date',
            style: textStyle.semiBold.s10.copyWith(
              color: active ? Colors.white : null,
            ),
          ),
        )
        : SizedBox();
  }
}
