import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/data/model/doctor_model.dart';

import '../../../core/constants/gap_constants.dart';
import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/multiple_picker_bottom_sheet.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../doctor_list/views/widgets/doctor_tile.dart';
import '../controllers/dummy_page_controller.dart';

class DummyPageView extends GetView<DummyPageController> {
  const DummyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DummyPageView'),
        centerTitle: true,
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                labelText: 'Doctor list',
                hintText: 'Search doctor',
                // controller: controller.searchDoctorTextController,
                onChanged: (_) {
                  // controller.getDoctorList(initialLoad: true);
                },
              ),

              const SizedBox(height: 12),

              Text(
                'Doctors',
                style: textStyle.bold.s16,
              ),

              const SizedBox(height: 8),

              /// Selected chips
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: controller.selectedMedicalModels.map((doctor) {
                  return Chip(
                    label: Text(doctor.profile?.fullName ?? ''),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () =>
                        controller.removeMedicalId(doctor.doctorId!),
                  );
                }).toList(),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  controller.resetDoctorList();
                  controller.getDoctorList(initialLoad: true, search: '');
                  openCategoryBottomSheet(context);
                },

                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Add doctors...',
                          style: TextStyle(color: Colors.grey)),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// PAGINATED LIST
              Expanded(
                child: ListView.builder(
                  // controller: controller.listScrollController,
                  itemCount: controller.doctorList.length +
                      (controller.isLoading.value ? 1 : 0),
                  itemBuilder: (_, index) {
                    if (index == controller.doctorList.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final doctor = controller.doctorList[index];
                    return ListTile(
                      title:
                      Text(doctor.profile?.fullName ?? ''),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          minChildSize: 0.7,
          initialChildSize: 0.92,
          snapSizes: const [0.7, 1],
          expand: false,
          builder: (_, __) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: MultiSelectBottomSheet<DoctorModel>(
                items: controller.doctorList,
                selectedIds: controller.selectedDoctorIds,
                getId: (d) => d.doctorId!,
                getLabel: (d) => d.profile?.fullName ?? '',
                isNetworkSearch: true,
                isLocalSearch: false,

                onSearchSubmit: (query) {
                  controller.getDoctorList(
                    initialLoad: true,
                    search: query,
                  );
                },
                onReachBottom: (query) {
                  controller.getDoctorList(
                    search: query,
                  );
                },

                onConfirm: () => Get.back(),
              ),
            );
          },
        );
      },
    );
  }



}

