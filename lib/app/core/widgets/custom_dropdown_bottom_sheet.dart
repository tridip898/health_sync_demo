import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/custom_debouncer.dart';
import 'package:health_sync_question/app/core/widgets/bottom_sheet_title.dart';
import 'package:health_sync_question/app/core/widgets/custom_search_field.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';

class AppDropdownBottomSheet<T> extends StatefulWidget {
  final List<T> items;
  final T? currentItem;
  final String title;
  final String Function(T) getTitle;
  final bool Function(T)? viewOnly;
  final Function(String)? onSearchSubmit;
  final Function(String)? onReachBottom;
  final bool isLocalSearch;
  final bool isNetworkSearch;
  final bool moreLoading;

  const AppDropdownBottomSheet({
    super.key,
    required this.items,
    this.currentItem,
    required this.title,
    required this.getTitle,
    this.viewOnly,
    this.onSearchSubmit,
    this.onReachBottom,
    this.isLocalSearch = false,
    this.isNetworkSearch = false,
    this.moreLoading = false,
  });

  @override
  State<AppDropdownBottomSheet<T>> createState() =>
      _AppDropdownBottomSheetState<T>();
}

class _AppDropdownBottomSheetState<T> extends State<AppDropdownBottomSheet<T>> {
  late ScrollController _sheetScrollController;
  final debouncer = CustomDebouncer(milliseconds: 1000);

  @override
  void initState() {
    _assignAllItemsToFilter();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppDropdownBottomSheet<T> oldWidget) {
    _assignAllItemsToFilter();
    super.didUpdateWidget(oldWidget);
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

  final RxList<T> filteredItems = <T>[].obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.6,
      initialChildSize: 1,
      snapSizes: const [0.6, 1],
      builder: (context, scrollController) {
        _sheetScrollController = scrollController;
        _sheetScrollController.removeListener(_onScroll);
        _sheetScrollController.addListener(_onScroll);

        return GestureDetector(
          onTap: appController.closeKeyboard,
          behavior: HitTestBehavior.opaque,
          child: Column(
            children: [
              SizedBox(
                height: MediaQueryData.fromView(View.of(context)).padding.top,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                  child: Column(
                    children: [
                      BottomSheetTitle(
                        title: widget.title,
                        onCloseTap: Get.back,
                        horizontalPadding: 0,
                      ),
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
                                if (widget.onSearchSubmit != null) {
                                  widget.onSearchSubmit!('');
                                } else {
                                  _assignAllItemsToFilter();
                                }
                              },
                              onChanged: (query) {
                                if (widget.isLocalSearch) {
                                  if (query.isEmpty) {
                                    _assignAllItemsToFilter();
                                  } else {
                                    filteredItems.assignAll(
                                      widget.items.where(
                                        (item) => widget
                                            .getTitle(item)
                                            .toLowerCase()
                                            .contains(query.toLowerCase()),
                                      ),
                                    );
                                  }
                                } else if (widget.onSearchSubmit != null) {
                                  debouncer.run(() {
                                    widget.onSearchSubmit!(query);
                                  });
                                }
                              },
                              onSubmitted: (value) {
                                if (widget.onSearchSubmit != null) {
                                  widget.onSearchSubmit!(value);
                                }
                              },
                            ),
                            gapH12,
                          ],
                        ),
                      Expanded(
                        child: Obx(() {
                          if (filteredItems.isEmpty) return SizedBox();
                          return ListView.separated(
                            physics: ClampingScrollPhysics(),
                            controller: _sheetScrollController,
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  if (widget.viewOnly?.call(
                                        filteredItems[index],
                                      ) ??
                                      false) {
                                    return;
                                  }
                                  Get.back(result: filteredItems[index]);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.getTitle(filteredItems[index]),
                                          maxLines: 1,
                                          style: textStyle.regular.s14.copyWith(
                                            color:
                                                (widget.viewOnly?.call(
                                                      filteredItems[index],
                                                    ) ??
                                                    false)
                                                ? gray.base300
                                                : null,
                                          ),
                                        ),
                                      ),
                                      gapW12,
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 15,
                                          color: gray.base400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) {
                              return Container(
                                height: 8,
                                alignment: Alignment.center,
                                child: Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: gray.base200,
                                ),
                              );
                            },
                          );
                        }),
                      ),
                      gapH16,
                    ],
                  ),
                ),
              ),
              if (widget.moreLoading && widget.items.isNotEmpty)
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: LoadingWidget(size: 40),
                ),
            ],
          ),
        );
      },
    );
  }

  void _assignAllItemsToFilter() {
    filteredItems.assignAll(widget.items);
  }
}
