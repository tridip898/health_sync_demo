import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/core/widgets/dotted_border_widget.dart';
import 'package:intl/intl.dart';

import '../controllers/create_appointment_controller.dart';

class CreateAppointmentView extends GetView<CreateAppointmentController> {
  const CreateAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Create Appointment'),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
        color: Colors.white,
        child: CustomButton(
          text: 'Create Appointment',
          onPressed: controller.onCreateAppointment,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: 16) +
              EdgeInsets.only(bottom: 24),
          children: [
            CustomDropDownWidget(
              labelText: 'Doctor',
              hintText: 'Select Doctor',
              controller: controller.doctorNameController,
              isRequired: true,
            ),
            gapH8,
            CustomDropDownWidget(
              labelText: 'Hospital',
              hintText: 'Select Hospital',
              controller: controller.organizationNameController,
              onTap: controller.onOrganizationTap,
              onRemove: controller.onOrganizationRemove,
              isRequired: true,
              validator: (value) {
                if (value?.isNotEmpty == true) {
                  return null;
                }
                return 'Organization is required';
              },
            ),
            gapH16,
            Obx(() {
              if (controller.selectedDoctorOrganization.value != null) {
                return Column(
                  children: [
                    _WorkingHours(
                      availability: controller.selectedDoctorOrganization.value!
                          .getNext7DaysAvailability(),
                      selectedDate: controller.selectedDate.value,
                      onDateSelect: (value) =>
                          controller.onAppointmentDateSelect(value),
                      isDateValid: controller.isDateValid.value,
                    ),
                    gapH16,
                  ],
                );
              }
              return SizedBox();
            }),
            CustomTextFormField(labelText: 'Notes', hintText: 'Add notes'),
            gapH8,
            Obx(() {
              if (controller.questionnaires.isNotEmpty) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.questionnaires.length,
                  itemBuilder: (context, index) {
                    final question = controller.questionnaires[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12) +
                          EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: radius12,
                        border: Border.all(color: gray.base200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          gapH8,
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () =>
                                  controller.onRemoveQuestionnaire(index),
                              child: Text(
                                'Remove',
                                style: textStyle.bold.s12.copyWith(
                                  color: red.base500,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          ...question.entries.map(
                            (item) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gapH8,
                                Text(item.key, style: textStyle.semiBold.s14),
                                Text(item.value, style: textStyle.medium.s12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => gapH8,
                );
              }
              return SizedBox();
            }),
            gapH16,
            DottedBorderContainer(
              radius: 8,
              child: GestureDetector(
                onTap: controller.onAddQuestionnaireTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: gray.base100,
                    borderRadius: radius12,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: Text('Add Questionnaire', style: textStyle.medium.s20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkingHours extends StatelessWidget {
  final Map<DateTime, bool> availability;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelect;
  final bool? isDateValid;

  const _WorkingHours({
    super.key,
    required this.availability,
    this.selectedDate,
    required this.onDateSelect,
    required this.isDateValid,
  });

  @override
  Widget build(BuildContext context) {
    final dates = availability.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: textStyle.bold.s16),
        gapH4,
        Row(
          children: [
            ...List.generate(availability.length, (index) {
              final date = dates[index];
              final isAvailable = availability[date] ?? false;

              return _DayItem(
                DateFormat('EEE').format(date),
                DateFormat('dd MMM').format(date),
                isAvailable,
                date.isSameDay(selectedDate),
                onDateSelect,
                date,
                isDateValid,
              );
            }),
          ],
        ),
      ],
    );
  }
}

class _DayItem extends StatelessWidget {
  final String day;
  final String date;
  final bool active;
  final bool isSelected;
  final Function(DateTime) onTap;
  final DateTime dateTime;
  final bool? isDateValid;

  const _DayItem(
    this.day,
    this.date,
    this.active,
    this.isSelected,
    this.onTap,
    this.dateTime,
    this.isDateValid,
  );

  @override
  Widget build(BuildContext context) {
    return active
        ? Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  onTap(dateTime);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? green.base500 : null,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDateValid == false ? red.base500 : gray.base300,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: textStyle.semiBold.s10.copyWith(
                          color: isSelected ? Colors.white : null,
                        ),
                      ),
                      gapH(2),
                      Text(
                        day,
                        style: textStyle.semiBold.s10.copyWith(
                          color: isSelected ? Colors.white : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Flexible(child: SizedBox());
  }
}
