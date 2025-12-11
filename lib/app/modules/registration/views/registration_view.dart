import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/app_input_validator.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Registration'),
      body: Column(
        children: [
          const SizedBox(height: 40),

          // Top AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  child: const Icon(Icons.arrow_back, size: 26),
                ),
                Expanded(
                  child: Text(
                    "Create your account",
                    textAlign: TextAlign.center,
                    style: textStyle.bold.s36,
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Body Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Please enter your phone number. We use it to verify your identity and secure your medical information.",
              style: textStyle.medium.s18,
            ),
          ),

          const SizedBox(height: 20),

          // Phone Input Field
          // Phone
          CustomTextFormField(
            labelText: 'Phone Number',
            hintText: '01*********',
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            validator: AppInputValidator.bdPhoneValidator,
            autoValidateMode: AutovalidateMode.onUserInteraction,
          ),

          const Spacer(),

          // Terms
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "By continuing, you agree to our Terms of Service and Privacy Policy.",
              textAlign: TextAlign.center,
              style: textStyle.regular.s16,
            ),
          ),

          const SizedBox(height: 20),

          // Continue Button
          CustomButton(text: 'Send Otp', onPressed: controller.onSendOtp),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
