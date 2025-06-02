import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/widgets/text_widget.dart';

import '../../../../exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final List<Widget>? actions;
  final String title;
  final Color colorTitle;
  final Color? colorLeadingIcon;
  final bool leading;
  final PreferredSizeWidget? botom;
  final bool centerTitle;
  final Widget? titleWidget;
  final Function()? onClick;

  const CustomAppBar({
    super.key,
    this.actions,
    required this.title,
    this.onClick,
    this.leading = true,
    this.colorTitle = Colors.black,
    this.colorLeadingIcon,
    this.titleWidget,
    this.botom,
    this.centerTitle = true,
  }) : preferredSize = botom != null
            ? const Size.fromHeight(90.0)
            : const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: actions,
      elevation: 0,
      backgroundColor: AppColors.white,
      title: titleWidget ??
          TextWidget(
            text: title,
            fontSizeText: 18,
            fontWeight: FontWeight.bold,
          ),
      centerTitle: centerTitle,
      leadingWidth: 30.w,
      leading: leading
          ? IconButton(
              onPressed: onClick ?? () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 24,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ))
          : null,
      bottom: botom,
    );
  }
}
