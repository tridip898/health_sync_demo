import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/otp_text_field.dart';
import '../controllers/forgot_pass_verify_otp_controller.dart';

class ForgotPassVerifyOtpView extends GetView<ForgotPassVerifyOtpController> {
  const ForgotPassVerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: appController.closeKeyboard,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'OTP'),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  Text("Verify Account", style: textStyle.bold.s30),

                  const SizedBox(height: 10),

                  Text(
                    "We have sent a verification code to",
                    style: textStyle.regular.s14.copyWith(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  Obx(
                        () => Text(controller.maskedPhone, style: textStyle.bold.s14),
                  ),

                  const SizedBox(height: 40),
                  Container(
                    padding: EdgeInsetsGeometry.all(14),
                    margin: EdgeInsets.only(left: 20),
                    child: Obx(
                          () => OtpTextField(
                        isIncorrect:controller.isOtpError.value,
                        prefixValue: controller.otpPrefix.value,
                        shouldShowPrefix: true,
                        onSubmit: controller.onOtpChanged,

                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Obx(() {
                    if (controller.canResend.value) {
                      return GestureDetector(
                        onTap: controller.onResendOtp,
                        child: Text(
                          "Resend Code",
                          style: textStyle.bold.s14.copyWith(
                            color: const Color(0xFF4C9A80),
                          ),
                        ),
                      );
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Resend code in ${controller.remainingSeconds.value}s",
                          style: textStyle.regular.s14,
                        ),
                      ],
                    );
                  }),

                  const SizedBox(height: 60),
                  Container(
                    padding: EdgeInsetsGeometry.all(18),
                    child: CustomButton(
                      text: 'Verify OTP',
                      onPressed: controller.onVerifyOtp,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
