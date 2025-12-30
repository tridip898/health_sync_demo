import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool needTitleCentre;
  final List<Widget>? actions;

  const AppAppbar({
    super.key,
    required this.title,
    this.needTitleCentre = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFF6F8F7),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(title, style: textStyle.semiBold.s18),
      centerTitle: needTitleCentre,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
