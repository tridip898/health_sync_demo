import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/medical_history_list/views/widgets/medical_history_tile.dart';

import '../../../core/extensions/widget_extension.dart';
import '../controllers/medical_history_list_controller.dart';

class MedicalHistoryListView extends GetView<MedicalHistoryListController> {
  const MedicalHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: appController.closeKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "Medical History"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 16, right: 16),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.medicalHistoryList.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: controller.fetchMedicalHistory,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 200),
                          Center(
                            child: Text(
                              'No medical history found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: controller.fetchMedicalHistory,
                    child: ListView.builder(
                      itemCount: controller.medicalHistoryList.length,
                      itemBuilder: (context, index) {
                        return MedicalHistoryTile(
                          history: controller.medicalHistoryList[index],
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
