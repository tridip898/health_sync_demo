import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/utils/custom_debouncer.dart';
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

  const AppDropdownBottomSheet._({
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

  static Future<T?> show<T>({
    required List<T> items,
    T? currentItem,
    required String title,
    required String Function(T) getTitle,
    bool Function(T)? viewOnly,
    Function(String)? onSearchSubmit,
    Function(String)? onReachBottom,
    bool isLocalSearch = false,
    bool isNetworkSearch = false,
    bool moreLoading = false,
  }) {
    return Get.bottomSheet<T>(
      AppDropdownBottomSheet<T>._(
        items: items,
        currentItem: currentItem,
        title: title,
        getTitle: getTitle,
        viewOnly: viewOnly,
        onSearchSubmit: onSearchSubmit,
        onReachBottom: onReachBottom,
        isLocalSearch: isLocalSearch,
        isNetworkSearch: isNetworkSearch,
        moreLoading: moreLoading,
      ),
      isScrollControlled: true,
    );
  }
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
      initialChildSize: 0.6,
      snapSizes: const [0.6, 1],
      builder: (context, scrollController) {
        _sheetScrollController = scrollController;
        _sheetScrollController.removeListener(_onScroll);
        _sheetScrollController.addListener(_onScroll);

        return Column(
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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: gray.base400,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        margin: EdgeInsets.only(bottom: 12),
                      ),
                    ),
                    BottomSheetTitle(title: widget.title, onCloseTap: Get.back),
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
            if (widget.moreLoading)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LoadingWidget(size: 40),
              ),
          ],
        );
      },
    );
  }

  void _assignAllItemsToFilter() {
    filteredItems.assignAll(widget.items);
  }
}

class BottomSheetTitle extends StatelessWidget {
  final String title;
  final Function()? onCloseTap;
  final Color? iconColor;
  final Color? bgColor;

  const BottomSheetTitle({
    super.key,
    required this.title,
    this.onCloseTap,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: padOnly(bottom: 8),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: gray.base200, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.arrow_back_ios, size: 18),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: textStyle.medium.s14.copyWith(color: gray.base1000),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class CircleClose extends StatelessWidget {
  final Function()? onPress;
  final double? radius;
  final Color? iconColor;
  final Color? bgColor;

  const CircleClose({
    super.key,
    this.onPress,
    this.radius,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padAll(0),
      onPressed: onPress ?? Get.back,
      color: gray.base200,
      icon: CircleAvatar(
        radius: radius ?? 15,
        backgroundColor: bgColor ?? gray.base100,
        child: Icon(Icons.close, size: 16, color: iconColor),
      ),
    );
  }
}
