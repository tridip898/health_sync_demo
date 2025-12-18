

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constants/gap_constants.dart';
import '../extensions/widget_extension.dart';

class OtpTextField extends StatelessWidget {
  final bool isIncorrect;
  final Function(String) onSubmit;
  final String prefixValue;
  final bool shouldShowPrefix;

  const OtpTextField({
    super.key,
    required this.isIncorrect,
    required this.onSubmit,
    this.prefixValue = 'OTP:',
    this.shouldShowPrefix = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double constraintWidth;
          double middleGap;
          if (constraints.maxWidth < 300) {
            constraintWidth = constraints.maxWidth;
            middleGap = 4;
          } else {
            constraintWidth = 300;
            middleGap = 6;
          }
          int totalItem = 5;
          double totalGap = ((totalItem - 1) * middleGap);

          double itemWidth = (constraintWidth - totalGap) / totalItem;

          return SizedBox(
            width: constraintWidth,
            height: itemWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (shouldShowPrefix) ...[
                  Container(
                    width: itemWidth,
                    height: itemWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: gray.base50,
                      border: Border.all(color: blue.base500, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      prefixValue,
                      style: textStyle.bold.s14
                    ),
                  ),
                  gapW(middleGap),
                ],
                Expanded(
                  flex: 4,
                  child: PinCodeTextField(
                    errorTextSpace: 0,
                    appContext: context,
                    length: totalItem - 1,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    autoDismissKeyboard: true,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: itemWidth,
                      fieldWidth: itemWidth,

                      // Border
                      activeColor: blue.base500,
                      selectedColor: blue.base500,
                      inactiveColor: gray.base50,

                      // Fill (background)
                      activeFillColor:  Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: gray.base50,

                      borderWidth: 2,
                    ),

                    cursorColor: Colors.black,
                    enableActiveFill: true,
                    onCompleted: onSubmit,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}