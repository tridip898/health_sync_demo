import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/modules/profile_details/views/pages/empty_profile_page.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/modules/profile_details/controllers/profile_details_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class ProfileDetailsView extends GetView<ProfileDetailsController> {
  const ProfileDetailsView({super.key});

  static const Color primary = Color(0xFF13ECA4);
  static const Color background = Color(0xFFF6F8F7);
  static const Color textMain = Color(0xFF0D1B17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: textMain,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Profile Details', style: textStyle.semiBold.s18),
        centerTitle: true,
      ),
      bottomNavigationBar: _bottomButton(),
      body: Obx(() {
        final profile = appController.userModel.value?.profile;
        return profile == null
            ? EmptyProfilePage()
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: NetworkImage(profile.image ?? ''),
                    ),
                    gapH16,
                    Center(
                      child: Text(
                        profile.fullName ?? '',
                        style: GoogleFonts.manrope(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    gapH24,
                    sectionTitle(
                      icon: Icons.person,
                      title: 'Personal Information',
                    ),
                    gapH12,
                    Row(
                      children: [
                        Expanded(
                          child: _infoCard(
                            label: 'Gender',
                            icon: Icons.female,
                            value: profile.gender ?? '',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _infoCard(
                            label: 'Date of Birth',
                            icon: Icons.cake,
                            value: DateFormat(
                              'MMM dd, yyyy',
                            ).format(DateTime.parse(profile.dateOfBirth ?? '')),
                          ),
                        ),
                      ],
                    ),
                    if (profile.address != null) ...[
                      gapH12,
                      Container(
                        padding: padAll16,
                        decoration: _cardDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ADDRESS',
                              style: GoogleFonts.manrope(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            gapH8,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: padAll8,
                                  decoration: BoxDecoration(
                                    color: ProfileDetailsView.primary
                                        .withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: ProfileDetailsView.primary,
                                  ),
                                ),
                                gapW12,
                                Expanded(
                                  child: Text(
                                    profile.address ?? '',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w600,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],

                    gapH24,
                    sectionTitle(
                      icon: Icons.contact_phone,
                      title: 'Contact Details',
                    ),
                    gapH12,
                    _contactCard(
                      icon: Icons.call,
                      label: 'Public Phone',
                      value: profile.publicPhoneNumber ?? '',
                    ),
                    if (profile.publicEmail != null) ...[
                      gapH12,
                      _contactCard(
                        icon: Icons.mail,
                        label: 'Public Email',
                        value: profile.publicEmail ?? '',
                      ),
                    ],
                  ],
                ),
              );
      }),
    );
  }

  Widget _bottomButton() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: SizedBox(
          height: 56,
          child: appController.userModel.value?.profile == null
              ? CustomButton(
                  text: "Create Profile",
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_PROFILE);
                  },
                )
              : CustomButton(
                  text: "Edit Profile",
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_PROFILE, arguments: true);
                  },
                ),
        ),
      );
    });
  }

  sectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, color: ProfileDetailsView.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ],
    );
  }

  Widget _infoCard({
    required String label,
    required IconData icon,
    required String value,
  }) {
    return Container(
      padding: padAll16,
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
          gapH8,
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.grey),
              gapW(6),
              Text(
                value,
                style: GoogleFonts.manrope(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _contactCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: padAll16,
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ProfileDetailsView.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: ProfileDetailsView.primary),
          ),
          gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.manrope(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  value,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.grey.shade200),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: .1),
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );
}
