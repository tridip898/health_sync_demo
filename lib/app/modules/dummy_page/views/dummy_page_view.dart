import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dummy_page_controller.dart';

class DummyPageView extends GetView<DummyPageController> {
  const DummyPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DummyPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DummyPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
