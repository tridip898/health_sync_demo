import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/medical_history_list_controller.dart';

class MedicalHistoryListView extends GetView<MedicalHistoryListController> {
  const MedicalHistoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedicalHistoryListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MedicalHistoryListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
