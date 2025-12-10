import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

import '../constants/gap_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? iconImage;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double borderRadius;
  final bool isPassword;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final AutovalidateMode? autoValidateMode;
  final int maxLines;
  final int minLines;
  final double verticalPadding;
  final VoidCallback? onTap;
  final bool isViewOnly;
  final bool isRequired;
  final int? maxLength;
  final bool showCharCount;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefixIcon;
  final double? prefixIconMaxHeight;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.iconImage,
    this.controller,
    this.validator,
    this.borderRadius = 16,
    this.isPassword = false,
    this.suffixIcon,
    this.onChanged,
    this.autoValidateMode,
    this.maxLines = 1,
    this.minLines = 1,
    this.verticalPadding = 16,
    this.onTap,
    this.isViewOnly = false,
    this.isRequired = false,
    this.maxLength,
    this.showCharCount = false,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.prefixIconMaxHeight,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;

  void handleVisibilityClick() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty)
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: textStyle.bold.s16.copyWith(color: Color(0xff0E121B)),
              children: [
                if (widget.isRequired)
                  TextSpan(
                    text: " *",
                    style: textStyle.bold.s16.copyWith(
                      color: Color(0xffF04438),
                    ),
                  ),
              ],
            ),
          ),
        if (widget.labelText.isNotEmpty) gapH8,
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: widget.controller ?? TextEditingController(),
          builder: (context, value, _) {
            final currentLength = value.text.length;
            return Column(
              children: [
                TextFormField(
                  keyboardType: widget.keyboardType,
                  inputFormatters: widget.inputFormatters,
                  maxLines: widget.maxLines,
                  controller: widget.controller,
                  validator:
                      widget.validator ??
                      (value) {
                        return null;
                      },
                  onChanged: (value) {
                    if (widget.maxLength != null &&
                        value.length > widget.maxLength!) {
                      final limited = value.substring(0, widget.maxLength);
                      widget.controller?.text = limited;
                      widget.controller?.selection = TextSelection.fromPosition(
                        TextPosition(offset: limited.length),
                      );
                    } else {
                      widget.onChanged?.call(value);
                    }
                    setState(() {}); // Update counter text
                  },
                  onFieldSubmitted: widget.onFieldSubmitted,
                  obscureText: widget.suffixIcon == null
                      ? widget.isPassword
                            ? showPassword
                                  ? false
                                  : true
                            : widget.isPassword
                      : widget.isPassword,
                  style: textStyle.semiBold.s16.copyWith(
                    color: widget.isViewOnly ? gray.base400 : Color(0xff0E121B),
                  ),
                  minLines: widget.minLines,
                  autovalidateMode: widget.autoValidateMode,
                  readOnly: widget.onTap != null || widget.isViewOnly,
                  showCursor: !widget.isViewOnly,
                  onTap: widget.onTap,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: gray.base100,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: widget.verticalPadding,
                      horizontal: 16,
                    ),
                    prefixIcon:
                        widget.prefixIcon ??
                        (widget.iconImage != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 8,
                                ),
                                child: Image.asset(
                                  widget.iconImage ?? '',
                                  color: widget.isViewOnly
                                      ? gray.base400
                                      : gray.base500,
                                  height: widget.prefixIconMaxHeight ?? 16,
                                  width: widget.prefixIconMaxHeight ?? 16,
                                ),
                              )
                            : null),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: widget.prefixIconMaxHeight ?? 16,
                    ),
                    hintText: widget.hintText,
                    labelStyle: textStyle.medium.s14.copyWith(
                      color: gray.base400,
                    ),
                    hintStyle: textStyle.medium.s14.copyWith(
                      color: gray.base400,
                    ),
                    suffixIcon:
                        widget.suffixIcon ??
                        (widget.isPassword
                            ? GestureDetector(
                                onTap: () {
                                  handleVisibilityClick();
                                },
                                child: Icon(
                                  showPassword
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off,
                                  size: 18,
                                  color: gray.base300,
                                ),
                              )
                            : null),
                    errorStyle: textStyle.medium.s12.copyWith(
                      color: red.base500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(color: gray.base300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(color: gray.base300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.isViewOnly ? gray.base200 : gray.base400,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(color: const Color(0xffF04438)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(color: const Color(0xffF04438)),
                    ),
                  ),
                ),
                if (widget.showCharCount && widget.maxLength != null) ...[
                  gapH8,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$currentLength / ${widget.maxLength}',
                      style: textStyle.regular.s12.copyWith(
                        color: Color(0xff99A0AE),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}
