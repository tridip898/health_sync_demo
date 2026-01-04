import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/string_extension.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/doctor_utils.dart';
import 'package:health_sync_question/app/core/widgets/custom_cache_network_image.dart';
import 'package:health_sync_question/app/data/model/appointment_list_response_model.dart';
import 'package:health_sync_question/app/data/model/request/get_appointment_request_model.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointmentModel;

  const AppointmentCard({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    final doctor = appointmentModel.doctor;
    final specialty = DoctorUtils.getSpecialty(doctor?.doctorSpecialties);
    return Container(
      padding: padAll16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius16,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            // spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.calendar_month, size: 18, color: blue.base500),
              gapW8,
              Expanded(
                child: Text(
                  appointmentModel.appointmentDate?.formatToDdMmmYyyy ?? '',
                  style: textStyle.bold.s14,
                ),
              ),
              gapW8,
              Icon(Icons.more_vert, size: 16),
            ],
          ),
          gapH12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: gray.base50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CacheNetworkImage(
                    imageUrl: doctor?.profile?.image ?? '',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${doctor?.profile?.fullName ?? ''} - $specialty',
                      style: textStyle.bold.s16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (appointmentModel.organization != null)
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: gray.base500,
                          ),
                          gapW4,
                          Expanded(
                            child: Text(
                              appointmentModel.organization?.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle.medium.s12.copyWith(
                               color: gray.base500,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: gray.base100, height: 24),
          Row(
            children: [
              Icon(Icons.person, size: 18, color: gray.base400),
              gapW8,
              Text(
                '${appointmentModel.patient?.profile?.fullName ?? ''} (${_calculateAge(appointmentModel.patient?.profile?.dateOfBirth ?? '')}, ${(appointmentModel.patient?.profile?.gender ?? '').substring(0, 1)})',
                style: textStyle.semiBold.s14.copyWith(
                  color: gray.base400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          gapH12,
          Row(
            children: [
              _statusButton(status: appointmentModel.status ?? ''),
              gapW12,
              _prescriptionAddedOrNot(status: appointmentModel.status),
            ],
          ),
        ],
      ),
    );
  }

  int _calculateAge(String dobString) {
    if (dobString.isEmpty) return 0;
    DateTime dob = DateTime.parse(dobString);
    DateTime today = DateTime.now();

    int age = today.year - dob.year;

    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age;
  }

  _statusButton({String status = ''}) {
    return Container(
      decoration: BoxDecoration(
        color: _getStatusTextColor(status),
        borderRadius: borderRadius8,
      ),
      padding: padSym(horizontal: 10, vertical: 4),
      child: Text(
        status.capitalizeFirst ?? '',
        style: textStyle.bold.s14.copyWith(color: _getStatusColor(status)),
      ),
    );
  }

  Color? _getStatusColor(String status) {
    if (status == AppointmentStatus.pending.value ||
        status == AppointmentStatus.paymentPending.value) {
      return Colors.orange;
    } else if (status == AppointmentStatus.confirmed.value) {
      return blue.base500;
    } else if (status == AppointmentStatus.paymentDone.value ||
        status == AppointmentStatus.completed.value ||
        status == AppointmentStatus.prescribed.value) {
      return green.base500;
    } else if (status == AppointmentStatus.paymentPending.value) {
      return red.base500;
    }
    return null;
  }

  Color? _getStatusTextColor(String status) {
    if (status == AppointmentStatus.pending.value ||
        status == AppointmentStatus.paymentPending.value) {
      return Colors.orangeAccent.withValues(alpha: .1);
    } else if (status == AppointmentStatus.confirmed.value) {
      return blue.base50;
    } else if (status == AppointmentStatus.paymentDone.value ||
        status == AppointmentStatus.completed.value ||
        status == AppointmentStatus.prescribed.value) {
      return green.base50;
    } else if (status == AppointmentStatus.paymentPending.value) {
      return red.base50;
    }
    return null;
  }

  _prescriptionAddedOrNot({String? status}) {
    if (status == AppointmentStatus.prescribed.value) {
      return Container(
        decoration: BoxDecoration(
          color: green.base50,
          borderRadius: borderRadius8,
        ),
        padding: padSym(horizontal: 10, vertical: 4),
        child: Row(
          children: [
            Icon(Icons.check, color: green.base500, size: 16),
            gapW(6),
            Text(
              'Prescription added',
              style: textStyle.bold.s14.copyWith(color: green.base500),
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          Icon(Icons.file_copy, size: 16, color: gray.base400),
          gapW(6),
          Text(
            'No prescription',
            style: textStyle.regular.s14.copyWith(color: gray.base400),
          ),
        ],
      );
    }
  }
}
