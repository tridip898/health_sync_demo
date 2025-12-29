import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prescription_details_controller.dart';

class PrescriptionDetailsView extends GetView<PrescriptionDetailsController> {
  const PrescriptionDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrescriptionDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrescriptionDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
