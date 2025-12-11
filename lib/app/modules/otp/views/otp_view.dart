import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/assets_contants.dart';

import '../../../core/extensions/widget_extension.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/otp_text_field.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'OTP'),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(otp, height: 30),
            ),
            Text(
              "Verify Account",
              style: textStyle.bold.s24.copyWith(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              textAlign: TextAlign.center,
              "We have sent a serification code to your \n mobile number",
              style: textStyle.bold.s14.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              textAlign: TextAlign.center,
              "+1(555) ***-8899",
              style: textStyle.bold.s14.copyWith(color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              textAlign: TextAlign.center,
              "Change number?",
              style: textStyle.bold.s14.copyWith(
                color: const Color(0xFF4C9A80),
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 240,
                child: OtpTextField(isIncorrect: false, onSubmit: (value) {}),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 240,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time, // built-in Flutter clock icon
                      size: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 6),

                    const Text(
                      "Resend code in:",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "00:45",
                      style: textStyle.bold.s14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                text: 'Send Otp',
                onPressed: controller.onSendOtp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock, // built-in Flutter clock icon
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 6),
                Text("your data is securely encrypted"),
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
