import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/model/prescription_list_response_model.dart';
import 'package:health_sync_question/app/modules/prescription_details/widgets/medicine_card.dart';
import 'package:intl/intl.dart';

class PrescriptionBottomWidget extends StatelessWidget {
  final Prescription? prescription;

  const PrescriptionBottomWidget({super.key, this.prescription});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: padAll8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 6,
                width: 44,
                decoration: BoxDecoration(
                  color: gray.base200,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              gapH20,
              Padding(
                padding: padSym(horizontal: 16),
                child: Text(
                  prescription?.prescriptionText ?? '',
                  style: textStyle.bold.s18,
                ),
              ),
              gapH8,
              Padding(
                padding: padSym(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 18,
                      color: gray.base500,
                    ),
                    gapW8,
                    Flexible(
                      child: Text(
                        (prescription?.createdAt ?? '') != ''
                            ? DateFormat('MMM dd, yyyy').format(
                                DateTime.parse(prescription?.createdAt ?? ''),
                              )
                            : '',
                        style: textStyle.regular.s14.copyWith(
                          color: gray.base500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 32, color: gray.base100),
              _sectionHeader(
                title: 'Medicine',
                icon: 'assets/icons/tablets.png',
                color: Colors.blue,
              ),
              gapH12,
              ListView.separated(
                shrinkWrap: true,
                padding: padSym(horizontal: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final medicine = prescription?.prescriptionItems?[index];
                  return MedicineCard(medicine: medicine);
                },
                separatorBuilder: (context, index) {
                  return gapH12;
                },
                itemCount: prescription?.prescriptionItems?.length ?? 0,
              ),
              Divider(
                height: 24,
                color: gray.base100,
                endIndent: 16,
                indent: 16,
              ),
              _sectionHeader(
                title: 'lab tests',
                icon: 'assets/icons/microscope.png',
                color: Colors.purple,
              ),
              gapH12,
              ListView.separated(
                shrinkWrap: true,
                padding: padSym(horizontal: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final labTest = prescription?.labTests?[index];
                  return _lebTestCard(labTest: labTest);
                },
                separatorBuilder: (context, index) {
                  return gapH12;
                },
                itemCount: prescription?.labTests?.length ?? 0,
              ),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }

  _sectionHeader({String title = '', String icon = '', Color? color}) {
    return Padding(
      padding: padSym(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: color?.withValues(alpha: 0.2),
            child: Padding(
              padding: padAll5,
              child: Image.asset(icon, color: color),
            ),
          ),
          gapW8,
          Text(
            title.toUpperCase(),
            style: textStyle.semiBold.s14.copyWith(color: gray.base500),
          ),
        ],
      ),
    );
  }

  _lebTestCard({LabTests? labTest}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: gray.base100, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: padAll16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labTest?.testName ?? '', style: textStyle.bold.s16),
          gapH8,
          Text(
            labTest?.notes ?? '',
            style: textStyle.medium.s14.copyWith(color: gray.base500),
          ),
        ],
      ),
    );
  }
}
