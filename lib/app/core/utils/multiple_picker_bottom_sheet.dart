import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';


class MultiSelectBottomSheet<T> extends StatelessWidget {
  final List<T> items;
  final List<String> selectedIds;
  final String Function(T item) getId;
  final String Function(T item) getLabel;
  final VoidCallback? onConfirm;
  final ScrollController scrollController;

  const MultiSelectBottomSheet({
    super.key,
    required this.items,
    required this.selectedIds,
    required this.getId,
    required this.getLabel,
    this.onConfirm,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Select Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Obx(() {
              if (items.isEmpty) return const Center(child: Text('No items found'));

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                controller: scrollController,
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, index) {
                  final item = items[index];
                  final id = getId(item);
                  final label = getLabel(item);

                  return Obx(() {
                    final isSelected = selectedIds.contains(id);
                    return ListTile(
                      title: Text(label),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.circle_outlined, color: Colors.grey),
                      onTap: () {
                        if (isSelected) {
                          selectedIds.remove(id);
                        } else {
                          selectedIds.add(id);
                        }
                      },
                    );
                  });
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: CustomButton(
                onPressed: onConfirm ?? () => Get.back(),
                text: 'Confirm',
              ),
            ),
          ),
        ],
      ),
    );
  }
}









