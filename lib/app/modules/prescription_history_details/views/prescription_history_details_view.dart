import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prescription_history_details_controller.dart';

class PrescriptionHistoryDetailsView
    extends GetView<PrescriptionHistoryDetailsController> {
  const PrescriptionHistoryDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrescriptionHistoryDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrescriptionHistoryDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
