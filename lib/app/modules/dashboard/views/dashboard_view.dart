import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/data/model/profile_model.dart';
import 'package:health_sync_question/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (appController.userModel.value == null) {
            return SizedBox();
          }
          return Column(
            children: [
              _Header(profileModel: appController.userModel.value?.profile),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _OverviewHeader(),
                        gapH12,
                        _OverviewCard(
                          icon: Icons.medical_information_outlined,
                          iconBg: green.base50,
                          iconColor: green.base500,
                          title: 'Doctors',
                          subtitle: 'General & Specialists',
                          onTap: () {
                            Get.toNamed(Routes.DOCTOR_LIST);
                          },
                        ),
                        gapH12,
                        _OverviewCard(
                          icon: Icons.calendar_month,
                          iconBg: blue.base50,
                          iconColor: blue.base500,
                          title: 'Appointments',
                          subtitle: 'Your upcoming appointments',
                          onTap: () {},
                        ),
                        gapH12,
                        _OverviewCard(
                          icon: Icons.history_edu,
                          iconBg: yellow.base50,
                          iconColor: yellow.base500,
                          title: 'Medical History',
                          subtitle: 'Full records & reports',
                          onTap: () {
                            Get.toNamed(Routes.MEDICAL_HISTORY_LIST);
                          },
                        ),
                        gapH12,
                        _OverviewCard(
                          icon: Icons.medication,
                          iconBg: red.base50,
                          iconColor: red.base500,
                          title: 'Prescriptions',
                          subtitle: '4 Active meds',
                          onTap: () {},
                        ),
                        gapH12,
                        _OverviewCard(
                          icon: Icons.card_membership,
                          iconBg: cyan.base50,
                          iconColor: cyan.base500,
                          title: 'Reports',
                          subtitle: 'Your medical reports',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final ProfileModel? profileModel;

  const _Header({super.key, this.profileModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE_DETAILS);
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDIl-bskxXIrt4RZgLmVcEIit2POBFObH0x5FOXNNv7xSZ0bF9zjyxY2z_yfeDIoWgBm9mQcudFPU2deDM81zth5wmjCJb7pg6ZlxFakCR34lW8zw6HOAFXrfu35ZAYP947qbDBlmjGffxrdY4ZDDD_bMm232wll3c-2CzYc5awvFzqXKMcldJytL03ZyLPvDynEjb2cpCfYDaUZ1mltxbhjq2iRbggjZH2sP960nGjAgRA0cZeEzlkQnEV2ulJSAmyyl3RJrnLH8c',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              if (profileModel?.fullName?.notNullNotEmpty == true)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back', style: textStyle.medium.s12),
                    Text(
                      profileModel!.fullName!,
                      style: textStyle.bold.s14,
                    ),
                  ],
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: appController.signOut,
          ),
        ],
      ),
    );
  }
}

class _OverviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Overview', style: textStyle.bold.s18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: green.base100,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text('Oct 24, 2025', style: textStyle.regular.s12),
        ),
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? trailingText;
  final String? badge;
  final VoidCallback onTap;

  const _OverviewCard({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailingText,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E7FF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge!,
                            style: GoogleFonts.manrope(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF4F46E5),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: textStyle.regular.s12),
                ],
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
