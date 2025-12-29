import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class CustomDropDownWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function()? onRemove;

  const CustomDropDownWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = "",
    this.onTap,
    this.validator,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
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
            child: (value.text.isNotEmpty && onRemove != null)
                ? GestureDetector(onTap: onRemove, child: Icon(Icons.close))
                : Icon(Icons.keyboard_arrow_down),
          ),
        );
      },
    );
  }
}
