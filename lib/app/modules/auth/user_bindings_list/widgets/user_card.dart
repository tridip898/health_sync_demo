import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/binding_user_list_response_model.dart';

class UserCard extends StatelessWidget {
  final BindingUserModel user;
  final bool selected;
  final Function()? onTap;

  const UserCard({
    super.key,

    this.selected = false,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padAll12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius12,
          border: Border.all(
            color: selected ? green.base200 : Colors.transparent,
            width: 1
          ),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CacheNetworkImage(
                          imageUrl: user.image ?? '',
                          width: 54,
                          height: 54,
                        ),
                      ),
                    ),

                    if (selected)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            border: Border.fromBorderSide(
                              BorderSide(color: Colors.white, width: 1),
                            ),
                            color: Color(0xFF13ECA4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.fullName ?? '', style: textStyle.bold.s18),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: gray.base400),
                          gapW4,
                          Expanded(
                            child: Text(
                              user.address ?? '',
                              style: textStyle.medium.s14.copyWith(
                                color: gray.base400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: selected ? green.base300 : gray.base300,
                ),
              ],
            ),

            Divider(height: 26, color: gray.base200),

            Row(
              children: [
                Expanded(child: _infoRow(Icons.person, user.gender ?? '')),
                gapW8,
                Expanded(
                  child: _infoRow(
                    Icons.cake,
                    (user.dateOfBirth?.formatToDdMmmYyyy?? ''),
                  ),
                ),
              ],
            ),

            _infoRow(Icons.call, user.publicPhoneNumber ?? ''),
            if (user.publicEmail != null)
              _infoRow(Icons.mail, user.publicEmail ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text, {bool multiline = false}) {
    return Padding(
      padding: padSym(vertical: 6),
      child: Row(
        crossAxisAlignment: multiline
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          gapW8,
          Expanded(
            child: Text(
              text,
              style: textStyle.medium.s12.copyWith(color: gray.base500),
            ),
          ),
        ],
      ),
    );
  }
}
