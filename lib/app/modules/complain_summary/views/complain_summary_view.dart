import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../controllers/complain_summary_controller.dart';

class ComplainSummaryView extends GetView<ComplainSummaryController> {
  const ComplainSummaryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Complain Summary'),
      body: const Center(
        child: Text(
          'ComplainSummaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
