import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/constants/string_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_availability_model.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:intl/intl.dart';

import '../controllers/doctor_details_controller.dart';

class DoctorDetailsView extends GetView<DoctorDetailsController> {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Doctor Details'),
      bottomNavigationBar: Obx(() {
        if (controller.doctorModel.value == null) return SizedBox();
        return Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          color: Colors.white,
          child: CustomButton(
            text: 'Book Appointment',
            onPressed: controller.onBookAppointment,
          ),
        );
      }),
      body: Obx(() {
        if (controller.doctorModel.value == null) return SizedBox();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                _HeaderSection(doctorModel: controller.doctorModel.value!),
                gapH4,
                // _StatsCard(doctorModel: controller.doctorModel.value!),
                if (controller
                        .doctorModel
                        .value
                        ?.doctorOrganizations
                        ?.isNotEmpty ==
                    true)
                  _LocationSection(
                    doctorOrganizationModel:
                        controller.doctorModel.value!.doctorOrganizations!,
                  ),
                gapH16,
                _AboutSection(doctorModel: controller.doctorModel.value!),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/* ---------------- Header ---------------- */
class _HeaderSection extends StatelessWidget {
  final DoctorModel doctorModel;

  const _HeaderSection({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    final profile = doctorModel.profile;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: radius8,
                    child: CacheNetworkImage(
                      imageUrl: profile?.image ?? '',
                      width: 80,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          gapW12,
          Expanded(
            child: SizedBox(
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile?.fullName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.semiBold.s14,
                  ),
                  gapH4,
                  Text(
                    DoctorUtils.getAcademicQualification(
                      doctorModel.doctorAcademicQualification,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12,
                  ),
                  gapH4,
                  Text(
                    DoctorUtils.getSpecialty(doctorModel.doctorSpecialties),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.regular.s12.copyWith(color: blue.base600),
                  ),
                  gapH4,
                  Row(
                    children: [
                      if (doctorModel.verified == true) ...[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: green.base500,
                            borderRadius: radius4,
                          ),
                          child: Text(
                            'Verified',
                            style: textStyle.bold.s12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        gapW10,
                      ],
                      if (doctorModel.yearExperience != null) ...[
                        Text(
                          '${doctorModel.yearExperience.toString()}+ yrs',
                          style: textStyle.regular.s12,
                        ),
                      ],
                      Spacer(),
                      Text(
                        doctorModel.licenseNumber ?? '',
                        style: textStyle.regular.s12,
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

class _StatsCard extends StatelessWidget {
  final DoctorModel doctorModel;

  const _StatsCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // _StatItem('1000', 'Patients'),
        // _Divider(),
        if (doctorModel.yearExperience != null)
          _StatItem('${doctorModel.yearExperience} Yr+', 'Experience'),
        // _Divider(),
        // _StatItem('4.8', 'Rating'),
        if (doctorModel.licenseNumber != null)
          _StatItem(doctorModel.licenseNumber!, 'BMDC'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: textStyle.bold.s12),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: textStyle.regular.s8.copyWith(color: gray.base500),
          ),
        ],
      ),
    );
  }
}

/* ---------------- About ---------------- */
class _AboutSection extends StatelessWidget {
  final DoctorModel doctorModel;

  const _AboutSection({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (doctorModel.doctorAcademicQualification?.isNotEmpty == true) ...[
          Text('Academic Qualification', style: textStyle.bold.s18),
          gapH4,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctorModel.doctorAcademicQualification!.length,
            itemBuilder: (context, index) {
              final qualification =
                  doctorModel.doctorAcademicQualification![index];
              return DoctorExperienceCard(
                title: qualification.degree ?? '',
                department: qualification.major ?? '',
                institutionName: qualification.institutionName ?? '',
                date: qualification.passingYear ?? '',
              );
            },
            separatorBuilder: (context, _) => Container(
              width: double.infinity,
              color: gray.base100,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
          gapH10,
        ],
        if (doctorModel.doctorExperiences?.isNotEmpty == true) ...[
          gapH10,
          Text('Experiences', style: textStyle.bold.s18),
          gapH4,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctorModel.doctorExperiences!.length,
            itemBuilder: (context, index) {
              final experience = doctorModel.doctorExperiences![index];
              return DoctorExperienceCard(
                title: experience.title ?? '',
                department: experience.department ?? '',
                institutionName: experience.institutionName ?? '',
                date:
                    '${experience.startDate.formatUtcToMonthYear} - ${experience.endDate?.formatUtcToMonthYear ?? 'Present'}',
                description: experience.description,
              );
            },
            separatorBuilder: (context, _) => Container(
              width: double.infinity,
              color: gray.base100,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
          gapH10,
        ],
        if (doctorModel.achievements?.isNotEmpty == true) ...[
          gapH10,
          Text('Achievements', style: textStyle.bold.s18),
          gapH4,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: doctorModel.achievements!.length,
            itemBuilder: (context, index) {
              final achievements = doctorModel.achievements![index];
              return DoctorExperienceCard(
                title: achievements.title ?? '',
                department: achievements.provider ?? '',
                institutionName: achievements.details ?? '',
                date: achievements.year ?? '',
              );
            },
            separatorBuilder: (context, _) => Container(
              width: double.infinity,
              color: gray.base100,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
          gapH10,
        ],
      ],
    );
  }
}

class DoctorExperienceCard extends StatelessWidget {
  final String title;
  final String department;
  final String institutionName;
  final String date;
  final String? description;

  const DoctorExperienceCard({
    super.key,
    required this.title,
    required this.department,
    required this.institutionName,
    required this.date,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: textStyle.semiBold.s12)),
            Text(department, style: textStyle.medium.s12),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text(institutionName, style: textStyle.medium.s10)),
            Text(date, style: textStyle.medium.s8),
          ],
        ),
        if (description != null && description!.isNotEmpty) ...[
          Text(
            description!,
            style: textStyle.regular.s8.copyWith(color: gray.base500),
          ),
        ],
      ],
    );
  }
}

/* ---------------- Working Hours ---------------- */
class _WorkingHours extends StatelessWidget {
  final Map<DateTime, bool> availability;

  const _WorkingHours({super.key, required this.availability});

  @override
  Widget build(BuildContext context) {
    final dates = availability.keys.toList()..sort();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    return Container(
            width: 40,
            decoration: BoxDecoration(
              color: active ? green.base500 : gray.base200,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$day - $date',
                  style: textStyle.semiBold.s8.copyWith(
                    color: active ? Colors.white : null,
                  ),
                ),
              ],
            ),
          );
  }
}

/* ---------------- Location ---------------- */
class _LocationSection extends StatelessWidget {
  final List<DoctorOrganizationModel> doctorOrganizationModel;

  const _LocationSection({super.key, required this.doctorOrganizationModel});

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
