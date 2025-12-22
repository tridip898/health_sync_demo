import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/app_input_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Please enter your phone number. We use it to verify your identity and secure your medical information.",
                style: textStyle.regular.s14.copyWith(color: Colors.black),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12),
              child: CustomTextFormField(
                labelText: 'Phone Number',
                hintText: '01*********',
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                validator: AppInputValidator.bdPhoneValidator,
                autoValidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy.",
                style: textStyle.regular.s14.copyWith(
                  color: const Color(0xFF4C9A80),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                text: 'Send Otp',
                onPressed: controller.onSendOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
