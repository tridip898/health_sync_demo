import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

import '../controllers/profile_setup_options_controller.dart';

class ProfileSetupOptionsView extends GetView<ProfileSetupOptionsController> {
  const ProfileSetupOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8F7),
      appBar: CustomAppBar(title: 'Profile Setup'),
      body: Column(
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
                    padding: padSym(horizontal: 24),
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
                    padding: padSym(horizontal: 36),
                    child: Text(
                      'Manage your prescriptions and health records in one place. '
                      'Connect an existing account or start fresh with a new profile.',
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
          Padding(
            padding: padSym(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CREATE_PROFILE);
              },
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
          ),
          gapH16,
          Padding(
            padding: padSym(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.USER_BINDINGS_LIST);
              },
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
          ),
          gapH(80),
        ],
      ),
    );
  }
}
