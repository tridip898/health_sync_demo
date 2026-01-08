import 'package:flutter/material.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';

class AboutDoctor extends StatelessWidget {
  final DoctorModel doctorModel;

  const AboutDoctor({super.key, required this.doctorModel});

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
