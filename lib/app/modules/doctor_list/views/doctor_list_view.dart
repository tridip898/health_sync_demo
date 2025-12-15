import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_search_field.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/modules/doctor_list/views/widgets/doctor_tile.dart';

import '../controllers/doctor_list_controller.dart';

class DoctorListView extends GetView<DoctorListController> {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appController.closeKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Doctor List'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                CustomSearchField(
                  searchTextController: controller.searchDoctorTextController,
                  onSubmitted: (value) =>
                      controller.getDoctorList(initialLoad: true),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Obx(() {
                      return ListView.builder(
                        controller: controller.scrollController,
                        padding: EdgeInsets.only(bottom: 16),
                        itemCount: controller.doctorList.length,
                        itemBuilder: (context, index) {
                          final doctorModel = controller.doctorList[index];
                          return DoctorTile(doctorModel: doctorModel);
                        },
                      );
                    }),
                  ),
                ),

                Obx(() {
                  if (controller.isLoading.value &&
                      controller.doctorList.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: LoadingWidget(size: 40),
                    );
                  }
                  return SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
