import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/modules/appointment_details/views/widgets/card_background.dart';

class OrganizationCard extends StatelessWidget {
  final OrganizationModel? organization;

  const OrganizationCard({super.key, this.organization});

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ORGANIZATION INFO",
            style: textStyle.bold.s12.copyWith(color: gray.base700),
          ),
          gapH8,
          Text(organization?.name ?? '', style: textStyle.bold.s18),
          gapH4,
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.black54),
              gapW4,
              Text(
                organization?.address ?? '',
                style: textStyle.regular.s14.copyWith(color: Colors.black54),
              ),
            ],
          ),
          if ((organization?.phoneNumber?.isNotEmpty ?? false) ||
              (organization?.email?.isNotEmpty ?? false))
            Divider(height: 24, color: gray.base100),
          if (organization?.phoneNumber?.isNotEmpty ?? false)
            Row(
              children: [
                Icon(Icons.wifi_calling_3, size: 16, color: gray.base400),
                gapW8,
                Expanded(
                  child: Text(
                    (organization?.phoneNumber)?.join(', ') ?? '',
                    style: textStyle.medium.s14.copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          if (organization?.email?.isNotEmpty ?? false) ...[
            gapH4,
            Row(
              children: [
                Icon(Icons.alternate_email, size: 16, color: gray.base400),
                gapW8,
                Expanded(
                  child: Text(
                    (organization?.email)?.join(', ') ?? '',
                    style: textStyle.medium.s14.copyWith(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
