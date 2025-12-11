import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/constants/border_constents.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title, onActionTitle;
  final IconData iconTitle;
  final bool needAction;
  final bool needLeadingIcon;
  final bool needTitleCentre;
  final bool needRefreshBtn;

  final bool isWhiteStatusBar;
  final Function()? refreshBtnClick, backTap;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.needAction = false,
    this.needTitleCentre = true,
    this.needRefreshBtn = false,
    this.isWhiteStatusBar = false,
    this.iconTitle = Icons.add,
    this.refreshBtnClick,
    this.onActionTitle = "",
    this.backTap,
    this.needLeadingIcon = true,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 60,
      centerTitle: needTitleCentre,
      scrolledUnderElevation: 0,
      leading:
          leading ??
          (needLeadingIcon
              ? Padding(
                  padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                  child: RawMaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: borderRadius8,
                      side: BorderSide(color: gray.base300, width: 1),
                    ),
                    clipBehavior: Clip.hardEdge,
                    onPressed:
                        backTap ??
                        () {
                          Get.back();
                        },
                    child: Ink(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                )
              : null),
      title: Text(title, style: textStyle.bold.s18),
      actions:
          actions ??
          [
            if (needRefreshBtn)
              Padding(
                padding: padOnly(right: 16),
                child: GestureDetector(
                  onTap: refreshBtnClick,
                  child: Icon(Icons.refresh_rounded),
                ),
              ),
          ],
      systemOverlayStyle: isWhiteStatusBar
          ? SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
