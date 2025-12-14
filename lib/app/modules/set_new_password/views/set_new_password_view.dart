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
      appBar: AppBar(title: const Text('Set New Password'), centerTitle: true),
      body: Center(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  'Create a  Strong password to protect your medical \n history. your new password must be be different \n from previously used passwords.',
                  style: textStyle.bold.s14.copyWith(color: Colors.grey),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(14),
                child: CustomTextFormField(
                  labelText: 'New Password',
                  hintText: '.............',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  textAlign: TextAlign.start,
                  "REQUIREMENTS",
                  style: textStyle.bold.s8.copyWith(color: Colors.grey),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    Text("At least 10 characters"),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 14,top: 8),
                child: CustomTextFormField(
                  labelText: 'Confirmed Password',
                  hintText: '.............',
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(text: 'Reset Password', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
