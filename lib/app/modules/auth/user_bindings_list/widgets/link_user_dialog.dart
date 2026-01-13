import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';

class LinkUserDialog extends StatelessWidget {
  final ProfileModel user;
  final VoidCallback confirmTap;

  const LinkUserDialog({super.key, required this.user, required this.confirmTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius16),
      padding: padAll16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CacheNetworkImage(
                imageUrl: user.image ?? '',
                width: 80,
                height: 80,
              ),
            ),
          ),
          gapH16,
          Text(user.fullName ?? '', style: textStyle.bold.s18),
          gapH20,
          Container(
            decoration: BoxDecoration(
              color: gray.base50,
              border: Border.all(color: gray.base200, width: 1),
              borderRadius: borderRadius12,
            ),
            padding: padAll12,
            child: Column(
              children: [
                _infoRow(
                  title: 'Phone',
                  value: user.publicPhoneNumber ?? '',
                  icon: Icons.call,
                ),
                if (user.publicEmail != null) ...[
                  Divider(height: 24, color: gray.base200),
                  _infoRow(
                    title: 'Email',
                    value: user.publicEmail ?? '',
                    icon: Icons.email,
                  ),
                ],
                Divider(height: 24, color: gray.base200),
                _infoRow(
                  title: 'Birthday',
                  value: user.dateOfBirth.formatToDdMmmYyyy,
                  icon: Icons.cake,
                ),
              ],
            ),
          ),
          gapH16,
          Text(
            'This will link your medical records to this profile. Would you like to proceed?',
            style: textStyle.medium.s12.copyWith(color: gray.base400),
            textAlign: TextAlign.center,
          ),
          gapH24,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: gray.base100,
                  textColor: Colors.black,
                ),
              ),
              gapW12,
              Expanded(
                child: CustomButton(
                  text: 'Confirm',
                  onPressed: confirmTap,
                  backgroundColor: green.base300,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _infoRow({String title = '', String value = '', IconData? icon}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius6,
          ),
          padding: padAll5,
          child: Icon(icon, color: green.base300, size: 18),
        ),
        gapW8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: textStyle.semiBold.s10.copyWith(color: gray.base500),
              ),
              Text(value, style: textStyle.bold.s16),
            ],
          ),
        ),
      ],
    );
  }
}
