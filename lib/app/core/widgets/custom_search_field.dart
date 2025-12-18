import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';
import 'package:health_sync_question/app/core/widgets/custom_text_field.dart';

class CustomSearchField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController searchTextController;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onClear;

  const CustomSearchField({
    super.key,
    this.label = '',
    this.hintText = 'Search',
    required this.searchTextController,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: searchTextController,
      builder: (context, value, child) {
        final hasText = value.text.trim().isNotEmpty;
        return CustomTextFormField(
          controller: searchTextController,
          labelText: label,
          hintText: hintText,
          onChanged: (value) {
            onChanged?.call(value);
          },
          onFieldSubmitted: onSubmitted,
          suffixIcon: hasText
              ? IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed:
                      onClear ??
                      () {
                        searchTextController.clear();
                        onSubmitted?.call('');
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
