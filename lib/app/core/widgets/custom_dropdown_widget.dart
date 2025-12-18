import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class CustomDropDownWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function()? onTap;
  final String? Function(String?)? validator;

  const CustomDropDownWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = "",
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      isViewOnly: true,
      onTap: onTap,
      validator: validator,
      suffixIcon: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        child: Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}
