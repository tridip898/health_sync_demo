import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delete_medical_history_controller.dart';

class DeleteMedicalHistoryView extends GetView<DeleteMedicalHistoryController> {
  const DeleteMedicalHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeleteMedicalHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeleteMedicalHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
