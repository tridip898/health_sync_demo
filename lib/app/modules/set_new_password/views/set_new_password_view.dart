import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/set_new_password_controller.dart';

class SetNewPasswordView extends GetView<SetNewPasswordController> {
  const SetNewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetNewPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SetNewPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
