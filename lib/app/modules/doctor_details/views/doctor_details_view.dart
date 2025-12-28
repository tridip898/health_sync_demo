import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/constants/string_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/routes/app_pages.dart';

import '../controllers/doctor_details_controller.dart';

class DoctorDetailsView extends GetView<DoctorDetailsController> {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: appController.closeKeyboard,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Doctor Details'),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          color: Colors.white,
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Booking fee', style: textStyle.regular.s10),
                  Text('${takaIcon}550', style: textStyle.bold.s18),
                ],
              ),
              gapW8,
              Expanded(
                child: CustomButton(
                  text: 'Book Appointment',
                  onPressed: controller.onBookAppointment,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                _HeaderSection(doctorModel: controller.doctorModel),
                gapH4,
                _StatsCard(),
                _AboutSection(),
                _WorkingHours(),
                _LocationSection(),
              ],
            ),
          ),
        ),
      ),
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
            height: 120,
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
                gapH4,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: green.base500,
                    borderRadius: radius4,
                  ),
                  child: Text(
                    'Verified',
                    style: textStyle.bold.s12.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          gapW12,
          Expanded(
            child: SizedBox(
              height: 120,
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatItem('1000', 'Patients'),
        _Divider(),
        _StatItem('10 Yr+', 'Experience'),
        _Divider(),
        _StatItem('4.8', 'Rating'),
        _Divider(),
        _StatItem('51556', 'BMDC'),
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

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 40, color: gray.base300);
  }
}

/* ---------------- About ---------------- */
class _AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Doctor',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Dr. Jane Doe is a highly skilled Cardiologist with over 10 years of experience in treating heart diseases. She is dedicated to providing the best care to her patients and is well-known for her compassionate approach. ',
            style: TextStyle(fontSize: 14, height: 1.7, color: Colors.grey),
          ),
          Text(
            'Read more',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: gray.base400,
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- Working Hours ---------------- */
class _WorkingHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Working Hours',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  'Open Now',
                  style: TextStyle(
                    color: blue.base300,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20),
              children: const [
                _DayItem('Mon', '12', true),
                _DayItem('Tue', '13', false),
                _DayItem('Wed', '14', false),
                _DayItem('Thu', '15', false),
                _DayItem('Fri', '16', false),
              ],
            ),
          ),
        ],
      ),
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
      width: 64,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: active ? cyan.base400 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: active ? null : Border.all(color: gray.base400),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

/* ---------------- Location ---------------- */
class _LocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFF3F4F6),
                  child: Icon(Icons.location_on, color: cyan.base400),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grand City Hospital',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '8000 S Kirkland Ave, Chicago, IL',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.near_me, color: gray.base400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
