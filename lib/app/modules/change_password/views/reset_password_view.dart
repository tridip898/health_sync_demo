import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/widgets/custom_app_bar.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/utils/app_input_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Reset Password",),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: appController.closeKeyboard,
        child: SafeArea(
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
                    labelText: 'Password',
                    hintText: 'New password',
                    controller: controller.passwordController,
                    isPassword: true,
                    validator: AppInputValidator.requiredMinMax,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "REQUIREMENTS",
                    style: textStyle.bold.s10.copyWith(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: GetBuilder<ResetPasswordController>(
                              builder: (controller) {
                                final isValid = controller.isAtLeast10Chars;
                                return Checkbox(
                                  value: isValid,
                                  onChanged: null, // read-only
                                  fillColor: MaterialStateProperty.resolveWith(
                                          (states) => isValid ? Colors.green : Colors.transparent),
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                    color: isValid ? Colors.green : Colors.grey,
                                    width: 1.5,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 6),
                          GetBuilder<ResetPasswordController>(
                            builder: (controller) {
                              final isValid = controller.isAtLeast10Chars;
                              return Text(
                                "At least 10 characters",
                                style: textStyle.bold.s10.copyWith(
                                  color: isValid ? Colors.green : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),


                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: GetBuilder<ResetPasswordController>(
                              builder: (controller) {
                                final isMatched = controller.isPasswordMatched;
                                return Checkbox(
                                  value: isMatched,
                                  onChanged: null, // read-only
                                  fillColor: MaterialStateProperty.resolveWith(
                                          (states) => isMatched ? Colors.green : Colors.transparent),
                                  checkColor: Colors.white,
                                  side: BorderSide(
                                    color: isMatched ? Colors.green : Colors.grey,
                                    width: 1.5,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 6),
                          GetBuilder<ResetPasswordController>(
                            builder: (controller) {
                              final isMatched = controller.isPasswordMatched;
                              return Text(
                                "Password Matched",
                                style: textStyle.bold.s10.copyWith(
                                  color: isMatched ? Colors.green : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  CustomTextFormField(
                    labelText: 'Password',
                    hintText: 'Confirm password',
                    controller: controller.confirmPasswordController,
                    isPassword: true,
                    validator: AppInputValidator.requiredMinMax,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
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
      ),
    );
  }
}
