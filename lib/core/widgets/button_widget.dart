import 'package:flutter/material.dart';
import 'package:new_ilearn/core/utils/app_colors.dart';
import 'package:new_ilearn/core/utils/app_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.title,
      this.width = double.infinity,
      required this.onClick,
      this.height = 48,
      this.colorButton,
      this.colorTitleButton = Colors.white,
      this.colorBorder = Colors.transparent,
      this.multiWidget});

  final String title;
  final double width;
  final Function() onClick;
  final double height;
  final Color? colorButton;
  final Color colorTitleButton;
  final Color colorBorder;
  final Widget? multiWidget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            color: colorButton,
            gradient: colorButton == null ? AppColors.buttonColor : null,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: multiWidget ??
              Text(
                title,
                style: getBoldTextStyle(fontSize: 14,color: colorTitleButton),
              ),
        ),
      ),
    );
  }
}
