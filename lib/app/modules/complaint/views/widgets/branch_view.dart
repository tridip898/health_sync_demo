import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/boolean_selector_widget.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/modules/complaint/views/widgets/progress_wrapper_widget.dart';

class BranchView extends StatelessWidget {
  final Section section;
  final Function(String answer) onBranchNextTap;
  final int currentIndex;
  final int totalQuestions;

  const BranchView({
    super.key,
    required this.section,
    required this.onBranchNextTap,
    required this.currentIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return ProgressWrapperWidget(
      totalItem: 1 + totalQuestions,
      currentItem: 1 + (currentIndex + 1),
      child: Column(
        children: [
          Text(
            section.question ?? '',
            style: textStyle.semiBold.s16,
            textAlign: TextAlign.center,
          ),
          gapH8,
          if (section.options?.isNotEmpty == true)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: section.options?.keys.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onBranchNextTap(
                      section.options?.values.elementAt(index) ?? '',
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: gray.base100,
                        borderRadius: radius8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              section.options?.keys.elementAt(index) ?? 'N/A',
                              style: textStyle.medium.s14,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right, size: 14),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, _) => gapH8,
              ),
            )
          else if (section.type == InputType.boolean)
            BooleanSelectorWidget(
              value: null,
              onChanged: (value) => onBranchNextTap(value.toString()),
            )
          else if (section.type == InputType.number)
            CustomTextFormField(
              labelText: '',
              hintText: '',
              keyboardType: TextInputType.number,
            )
          else
            CustomTextFormField(labelText: '', hintText: ''),
        ],
      ),
    );
  }
}
