import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/gap_constants.dart';
import '../extensions/widget_extension.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_search_field.dart';
import 'custom_debouncer.dart';

class MultiSelectBottomSheet<T> extends StatefulWidget {
  final List<T> items;
  final List<String> selectedIds;

  final String Function(T item) getId;
  final String Function(T item) getLabel;

  final Function(String)? onSearchSubmit;
  final Function(String)? onReachBottom;
  final bool isLocalSearch;
  final bool isNetworkSearch;

  const MultiSelectBottomSheet({
    super.key,
    required this.items,
    required this.selectedIds,
    required this.getId,
    required this.getLabel,
    this.onSearchSubmit,
    this.onReachBottom,
    this.isLocalSearch = false,
    this.isNetworkSearch = false,
  });

  @override
  State<MultiSelectBottomSheet<T>> createState() =>
      _MultiSelectBottomSheetState<T>();
}

class _MultiSelectBottomSheetState<T> extends State<MultiSelectBottomSheet<T>> {
  final RxSet<String> tempSelectedIds = <String>{}.obs;
  final RxList<T> filteredItems = <T>[].obs;

  final TextEditingController searchController = TextEditingController();
  final debouncer = CustomDebouncer(milliseconds: 1000);
  late ScrollController _sheetScrollController;

  @override
  void initState() {
    super.initState();
    tempSelectedIds.addAll(widget.selectedIds);

    _assignAllItemsToFilter();

    _assignAllItemsToFilter();
  }

  @override
  void didUpdateWidget(covariant MultiSelectBottomSheet<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _assignAllItemsToFilter();
  }

  @override
  void dispose() {
    _sheetScrollController.removeListener(_onScroll);
    searchController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_sheetScrollController.position.pixels >=
        _sheetScrollController.position.maxScrollExtent) {
      if (widget.onReachBottom != null) {
        widget.onReachBottom!(searchController.text.trim());
      }
    }
  }

  void _assignAllItemsToFilter() {
    filteredItems.assignAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.7,
      initialChildSize: 1,
      snapSizes: const [0.7, 1],
      builder: (context, scrollController) {
        _sheetScrollController = scrollController;
        _sheetScrollController.removeListener(_onScroll);
        _sheetScrollController.addListener(_onScroll);

        return GestureDetector(
          onTap: appController.closeKeyboard,
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      const _Title(),
                      gapH12,

                      if (widget.isLocalSearch || widget.isNetworkSearch)
                        Column(
                          children: [
                            CustomSearchField(
                              searchTextController: searchController,
                              hintText: 'Search',
                              label: '',

                              onClear: () {
                                searchController.clear();
                                widget.onSearchSubmit?.call('');
                              },

                              onChanged: (query) {
                                if (widget.isLocalSearch) {
                                  // local logic (optional)
                                } else {
                                  debouncer.run(() {
                                    widget.onSearchSubmit?.call(query);
                                  });
                                }
                              },

                              onSubmitted: (value) {
                                widget.onSearchSubmit?.call(value);
                              },
                            ),

                            gapH12,
                          ],
                        ),

                      /// LIST
                      Expanded(
                        child: Obx(() {
                          return ListView.separated(
                            controller: _sheetScrollController,
                            itemCount: widget.items.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final item = widget.items[index];
                              final id = widget.getId(item);
                              final label = widget.getLabel(item);
                              final isSelected = tempSelectedIds.contains(id);

                              return ListTile(
                                title: Text(label),
                                trailing: isSelected
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : const Icon(Icons.circle_outlined),
                                onTap: () {
                                  setState(() {
                                    isSelected
                                        ? tempSelectedIds.remove(id)
                                        : tempSelectedIds.add(id);
                                  });
                                },
                              );
                            },
                          );
                        }),
                      ),

                      gapH12,

                      /// CONFIRM
                      _confirmButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _confirmButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        text: 'Confirm',
        onPressed: () {
          widget.selectedIds
            ..clear()
            ..assignAll(tempSelectedIds);

          Get.back(result: tempSelectedIds.toList());
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'Select Items',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
