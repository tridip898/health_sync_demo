import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/enums.dart';
import 'package:health_sync_question/app/core/widgets/custom_chip.dart';

class CustomChipButton extends StatefulWidget {
  final List<String> items;
  final ChipLayoutType layoutType;
  final ChipSelectionType selectionType;
  final ValueChanged<List<String>>? onChanged;
  final List<String> initialSelected;
  final ChipFitBehavior fitBehavior;

  const CustomChipButton({
    super.key,
    required this.items,
    this.layoutType = ChipLayoutType.wrap,
    this.selectionType = ChipSelectionType.single,
    this.onChanged,
    this.initialSelected = const [],
    this.fitBehavior = ChipFitBehavior.fit,
  });

  @override
  State<CustomChipButton> createState() => _CustomChipButtonState();
}

class _CustomChipButtonState extends State<CustomChipButton> {
  late List<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = [...widget.initialSelected];
    log("Selected values $_selectedValues}");
  }

  @override
  void didUpdateWidget(covariant CustomChipButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialSelected != widget.initialSelected) {
      _selectedValues = [...widget.initialSelected];
    }
  }

  void _onChipTap(String value) {
    setState(() {
      if (widget.selectionType == ChipSelectionType.single) {
        _selectedValues = [value];
      } else {
        _selectedValues.contains(value)
            ? _selectedValues.remove(value)
            : _selectedValues.add(value);
      }
    });

    widget.onChanged?.call(_selectedValues);
  }

  bool _isSelected(String value) => _selectedValues.contains(value);

  bool _fullWidth() {
    if (widget.fitBehavior == ChipFitBehavior.fit) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final chips = widget.items.map((item) {
      return CustomChip(
        text: item,
        isSelected: _isSelected(item),
        onTap: () => _onChipTap(item),
        fullWidth: _fullWidth(),
      );
    }).toList();
    switch (widget.layoutType) {
      case ChipLayoutType.row:
        if (widget.fitBehavior == ChipFitBehavior.fill) {
          return Row(
            children: chips
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: e,
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Row(
            children: chips
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: e,
                  ),
                )
                .toList(),
          );
        }

      case ChipLayoutType.column:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: chips.map((e) => e).toList(),
        );

      case ChipLayoutType.wrap:
        if (widget.fitBehavior == ChipFitBehavior.fill) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: chips
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: e,
                  ),
                )
                .toList(),
          );
        } else {
          return Wrap(spacing: 12, runSpacing: 12, children: chips);
        }
    }
  }
}
