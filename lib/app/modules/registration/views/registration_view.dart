import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: 'Create your account'),

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: appController.closeKeyboard,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(bottom: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                const SizedBox(height: 200), // simulate long content
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy.",
                textAlign: TextAlign.center,
                style: textStyle.regular.s14.copyWith(
                  color: const Color(0xFF4C9A80),
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Send Otp',
                onPressed: controller.onSendOtp,
              ),
            ],
          ),
        ),
      ),

    );
  }

}
