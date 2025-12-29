import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class BooleanSelectorWidget extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;

  const BooleanSelectorWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Option(
          label: 'Yes',
          selected: value == true,
          onTap: () => onChanged(true),
        ),
        gapW12,
        _Option(
          label: 'No',
          selected: value == false,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Option({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Row(
        children: [
          Radio<bool>(
            value: true,
            groupValue: selected ? true : null,
            onChanged: (_) => onTap(),
          ),
          Text(label, style: textStyle.medium.s16),
        ],
      ),
    );
  }
}
