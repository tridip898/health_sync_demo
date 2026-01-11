import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/modules/medical_history_list/views/widgets/medical_history_tile.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../routes/app_pages.dart';
import '../controllers/medical_history_list_controller.dart';

class MedicalHistoryListView extends GetView<MedicalHistoryListController> {
  const MedicalHistoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ColorPair> medicalColors = [
      ColorPair(light: green.base300.withOpacity(0.15), dark: green.base300),
      ColorPair(light: blue.base300.withOpacity(0.15), dark: blue.base300),
      ColorPair(light: yellow.base300.withOpacity(0.15), dark: yellow.base300),
      ColorPair(light: red.base300.withOpacity(0.15), dark: red.base300),
      ColorPair(light: cyan.base300.withOpacity(0.15), dark: cyan.base300),
    ];

    return GestureDetector(
      onTap: appController.closeKeyboard,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "Medical History"),

        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.green, // Circle color
          onPressed: () {
            Get.toNamed(Routes.CRATE_MEDICAL_HISTORY);
          },
          child: const Icon(
            Icons.add, // Plus icon
            color: Colors.white,
            size: 20,
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.medicalHistoryList.isEmpty) {
                return RefreshIndicator(
                  backgroundColor: Colors.white,
                  onRefresh: controller.fetchMedicalHistory,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 200),
                      Center(
                        child: Text(
                          'No medical history found',
                            style: textStyle.regular.s10
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                backgroundColor: Colors.white,
                onRefresh: controller.fetchMedicalHistory,
                child: ListView.builder(
                  itemCount: controller.medicalHistoryList.length,
                  itemBuilder: (context, index) {
                    final history = controller.medicalHistoryList[index];
                    final colorPair =
                        medicalColors[index % medicalColors.length];

                    return MedicalHistoryTile(
                      history: history,
                      colorPair: colorPair,
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class ColorPair {
  final Color light;
  final Color dark;

  const ColorPair({required this.light, required this.dark});
}
