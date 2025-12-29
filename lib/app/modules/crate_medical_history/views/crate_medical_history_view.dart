import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/crate_medical_history_controller.dart';

class CrateMedicalHistoryView extends GetView<CrateMedicalHistoryController> {
  const CrateMedicalHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrateMedicalHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CrateMedicalHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
