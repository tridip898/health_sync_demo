import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/app_input_validator.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = success.base500;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: appController.closeKeyboard,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 24),
                  Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: primary.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.health_and_safety,
                      size: 48,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.manrope(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D1B17),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign in to your account to continue",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: const Color(0xFF4C9A80),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Phone
                  CustomTextFormField(
                    labelText: 'Phone Number',
                    hintText: '01*********',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    validator: AppInputValidator.bdPhoneValidator,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 24),

                  // Password
                  CustomTextFormField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    controller: controller.passwordController,
                    isPassword: true,
                    validator: AppInputValidator.requiredMinMax,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  gapH8,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Login Button
                  CustomButton(text: 'Login', onPressed: controller.onLogin),
                  const SizedBox(height: 40),

                  Text(
                    "Don't have an account? ",
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
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
