import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';
import 'package:health_sync_question/app/core/utils/custom_debouncer.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class CustomSearchField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController searchTextController;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomSearchField({
    super.key,
    this.label = '',
    this.hintText = 'Search',
    required this.searchTextController,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final debouncer = CustomDebouncer(milliseconds: 1000);

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.searchTextController,
      builder: (context, value, child) {
        final hasText = value.text.trim().isNotEmpty;
        return CustomTextFormField(
          controller: widget.searchTextController,
          labelText: widget.label,
          hintText: widget.hintText,
          onChanged: (value) {
            debouncer.run(() {
              widget.onChanged?.call(value);
            });
          },
          onFieldSubmitted: widget.onSubmitted,
          suffixIcon: hasText
              ? IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    widget.searchTextController.clear();
                  },
                )
              : Container(
                  alignment: Alignment.center,
                  width: 40,
                  child: Image.asset(AssetPath.searchIcon, height: 20),
                ),
        );
      },
    );
  }
}
