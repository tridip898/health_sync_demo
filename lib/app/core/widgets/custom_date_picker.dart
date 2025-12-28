import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatefulWidget {
  final String title;
  final DateTime? initialDate;
  final DateTime? selectedDate;
  final String? Function(String?)? validator;
  final void Function(DateTime)? onDateSelected;
  final bool needTopSpace;

  const CustomDatePickerField({
    super.key,
    required this.title,
    this.initialDate,
    this.onDateSelected,
    this.selectedDate,
    this.validator,
    this.needTopSpace = true,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  GlobalKey<FormFieldState<String>> key = GlobalKey();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_selectedDate != null) {
        key.currentState?.didChange(formatDate(_selectedDate!));
      }
    });
  }

  @override
  void didUpdateWidget(covariant CustomDatePickerField oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.selectedDate == null && _selectedDate != null) {
        setState(() {
          _selectedDate = null;
        });
        key.currentState?.didChange(null);
        return;
      }

      if (widget.selectedDate != oldWidget.selectedDate &&
          widget.selectedDate != null) {
        setState(() {
          _selectedDate = widget.selectedDate;
        });
        key.currentState?.didChange(formatDate(widget.selectedDate!));
      }
    });
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
      key.currentState?.didChange(formatDate(picked));
      widget.onDateSelected?.call(picked);
    }
  }

  String formatDate(DateTime tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat('dd-MM-yyyy').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      key: key,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<String> fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title.isNotEmpty)
              Text(
                widget.title,
                style: textStyle.bold.s16.copyWith(color: Color(0xff0E121B)),
              ),
            if (widget.needTopSpace) const SizedBox(height: 8),

            GestureDetector(
              onTap: _pickDate,
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: fieldState.hasError ? Colors.red : gray.base300,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate != null
                          ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                          : "Select date",
                      style: textStyle.medium.s14.copyWith(
                        color: _selectedDate != null
                            ? Colors.black
                            : gray.base400,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            if (fieldState.hasError) ...[
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Text(
                  fieldState.errorText ?? "",
                  style: textStyle.medium.s14.copyWith(
                    color: const Color(0xffF04438),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
