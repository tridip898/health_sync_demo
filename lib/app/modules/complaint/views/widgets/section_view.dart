import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/data/app_data/basic_question_data.dart';
import 'package:health_sync_question/app/modules/complaint/views/widgets/progress_wrapper_widget.dart';

class SectionView extends StatelessWidget {
  final Section section;
  final Function(int) onSectionTap;

  const SectionView({
    super.key,
    required this.section,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return ProgressWrapperWidget(
      totalItem: 10,
      currentItem: 1,
      child: Column(
        children: [
          Text(
            section.question ?? '',
            style: textStyle.semiBold.s16,
            textAlign: TextAlign.center,
          ),
          gapH8,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: section.options?.keys.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onSectionTap(index),
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
          ),
        ],
      ),
    );
  }
}