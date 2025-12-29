import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_medical_history_controller.dart';

class UpdateMedicalHistoryView extends GetView<UpdateMedicalHistoryController> {
  const UpdateMedicalHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateMedicalHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpdateMedicalHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
