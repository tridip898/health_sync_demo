import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prescription_controller.dart';

class PrescriptionView extends GetView<PrescriptionController> {
  const PrescriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrescriptionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrescriptionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
