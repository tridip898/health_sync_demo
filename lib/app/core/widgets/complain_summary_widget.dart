import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class ComplainSummaryWidget extends StatelessWidget {
  final List<Map<String, String>> questionnaires;
  final Function(int) onRemoveQuestionnaire;

  const ComplainSummaryWidget({
    super.key,
    required this.questionnaires,
    required this.onRemoveQuestionnaire,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questionnaires.length,
      itemBuilder: (context, index) {
        final question = questionnaires[index];
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: 12) +
              EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: radius12,
            border: Border.all(color: gray.base200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH8,
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => onRemoveQuestionnaire(index),
                  child: Text(
                    'Remove',
                    style: textStyle.bold.s12.copyWith(
                      color: red.base500,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              ...question.entries.map(
                (item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH8,
                    Text(item.key, style: textStyle.semiBold.s14),
                    Text(item.value, style: textStyle.medium.s12),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => gapH8,
    );
  }
}
