import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/modules/auth/user_bindings_list/widgets/user_card.dart';

import '../controllers/profile_setup_options_controller.dart';

class ProfileSetupOptionsView extends GetView<ProfileSetupOptionsController> {
  const ProfileSetupOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8F7),
      appBar: CustomAppBar(
        title: controller.userBindingRequestModel == null
            ? 'Profile Setup'
            : 'Pending Request',
      ),
      body: controller.userBindingRequestModel == null
          ? _emptyUserRequest()
          : _pendingRequest(),
    );
  }

  _emptyUserRequest() {
    return Padding(
      padding: padSym(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 280,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              green.base300.withValues(alpha: 0.15),
                              Colors.transparent,
                            ],
                            radius: 0.7,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: padAll24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: borderRadius(40),
                                  border: Border.all(
                                    color: green.base300.withValues(alpha: 0.2),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: green.base300.withValues(
                                        alpha: 0.2,
                                      ),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  size: 72,
                                  color: green.base300,
                                ),
                              ),

                              /// Top-right badge
                              Positioned(
                                top: -8,
                                right: -8,
                                child: Container(
                                  padding: padAll8,
                                  decoration: BoxDecoration(
                                    color: green.base300,
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              /// Bottom-left badge
                              Positioned(
                                bottom: -4,
                                left: -16,
                                child: Container(
                                  padding: padAll10,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: radius16,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.monitor_heart,
                                    color: green.base300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: padSym(horizontal: 16),
                    child: Text(
                      "Let's get you set up",
                      textAlign: TextAlign.center,
                      style: textStyle.bold.s30.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  gapH12,
                  Padding(
                    padding: padSym(horizontal: 30),
                    child: Text(
                      'Manage your prescriptions and health records in one place. Connect an existing account or start fresh with a new profile.',
                      textAlign: TextAlign.center,
                      style: textStyle.medium.s14.copyWith(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.createProfileClick,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: green.base300,
                borderRadius: borderRadius12,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add_alt_1),
                  gapW8,
                  Text('Create a New Profile', style: textStyle.bold.s16),
                ],
              ),
            ),
          ),
          gapH16,
          GestureDetector(
            onTap: controller.linkProfileClick,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: green.base300.withValues(alpha: .1),
                border: Border.all(
                  color: green.base300.withValues(alpha: .3),
                  width: 2,
                ),
                borderRadius: borderRadius12,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link),
                  gapW8,
                  Text('Link an Existing Profile', style: textStyle.bold.s16),
                ],
              ),
            ),
          ),
          gapH(80),
        ],
      ),
    );
  }

  _pendingRequest() {
    return RefreshIndicator(
      onRefresh: controller.onRefresh,
      child: Padding(
        padding: padSym(horizontal: 16, vertical: 12),
        child: ListView(
          children: [
            UserCard(
              user: controller.userBindingRequestModel?.profile ?? ProfileModel(),
              status: controller.userBindingRequestModel?.userBindRequestStatus,
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: padSym(horizontal: 24),
                    child: Text(
                      "Waiting for Approval",
                      textAlign: TextAlign.center,
                      style: textStyle.bold.s30.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  gapH12,
                  Padding(
                    padding: padSym(horizontal: 36),
                    child: Text(
                      "Your account binding request is processing, you'll be able to manage medications and records oce the link is confirmed",
                      textAlign: TextAlign.center,
                      style: textStyle.medium.s14.copyWith(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: Divider(color: gray.base200)),
                gapW12,
                Text(
                  "OR",
                  style: textStyle.medium.s16.copyWith(color: gray.base400),
                ),
                gapW12,
                Expanded(child: Divider(color: gray.base200)),
              ],
            ),
            gapH24,
            GestureDetector(
              onTap: controller.createProfileClick,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: green.base300.withValues(alpha: .1),
                  border: Border.all(
                    color: green.base300.withValues(alpha: .3),
                    width: 2,
                  ),
                  borderRadius: borderRadius12,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add_alt_1),
                    gapW8,
                    Text('Create a New Profile', style: textStyle.bold.s16),
                  ],
                ),
              ),
            ),
            gapH24,
            Padding(
              padding: padSym(horizontal: 8),
              child: Text(
                'NEED A FRESH START? CREATE A SEPARATE PROFILE WHILE YOU WAIT FOR APPROVAL',
                style: textStyle.medium.s12.copyWith(color: gray.base400),
                textAlign: TextAlign.center,
              ),
            ),
            gapH(48),
          ],
        ),
      ),
    );
  }
}
