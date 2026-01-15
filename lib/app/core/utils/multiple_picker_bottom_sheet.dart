import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';


class MultiSelectBottomSheet<T> extends StatelessWidget {
  final List<T> items;
  final RxList<String> selectedIds; // committed state
  final String Function(T item) getId;
  final String Function(T item) getLabel;
  final VoidCallback? onConfirm;
  final ScrollController scrollController;

  MultiSelectBottomSheet({
    super.key,
    required this.items,
    required this.selectedIds,
    required this.getId,
    required this.getLabel,
    this.onConfirm,
    required this.scrollController,
  });

  final RxSet<String> tempSelectedIds = <String>{}.obs;

  @override
  Widget build(BuildContext context) {

    tempSelectedIds
      ..clear()
      ..addAll(selectedIds);

    return SafeArea(
      child: Column(
        children: [
          _dragHandle(),
          const _Title(),
          const Divider(height: 1),

          Expanded(
            child: Obx(() {
              if (items.isEmpty) {
                return const Center(child: Text('No items found'));
              }

              return ListView.separated(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, index) {
                  final item = items[index];
                  final id = getId(item);
                  final label = getLabel(item);

                  return Obx(() {
                    final isSelected = tempSelectedIds.contains(id);

                    return ListTile(
                      title: Text(label),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : const Icon(Icons.circle_outlined, color: Colors.grey),
                      onTap: () {
                        if (isSelected) {
                          tempSelectedIds.remove(id);
                        } else {
                          tempSelectedIds.add(id);
                        }
                      },
                    );
                  });
                },
              );
            }),
          ),

          _confirmButton(),
        ],
      ),
    );
  }

  Widget _confirmButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          text: 'Confirm',
          onPressed: () {
            selectedIds
            ..clear()
                ..assignAll(tempSelectedIds);
            if(onConfirm!= null){
              onConfirm!.call();
            }else{
              Get.back();
            }
          },
        ),
      ),
    );
  }

  Widget _dragHandle() => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: 40,
    height: 4,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'Select Items',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}










