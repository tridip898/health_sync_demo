import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/app_input_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/set_new_password_controller.dart';

class SetNewPasswordView extends GetView<SetNewPasswordController> {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set New Password'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create a strong password to protect your medical history.',
                  style: textStyle.bold.s14.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                CustomTextFormField(
                  controller: controller.passwordController,
                  labelText: 'New Password',
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  }, hintText: '...',
                ),

                const SizedBox(height: 12),

                CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  labelText: 'Confirm Password',

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password required";
                    }
                    return null;
                  }, hintText: '',
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: 'Reset Password',
                  onPressed: controller.onResetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

