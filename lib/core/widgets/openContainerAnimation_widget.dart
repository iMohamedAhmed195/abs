
import 'package:flutter/material.dart';
import 'package:new_ilearn/core/utils/app_colors.dart';
import 'package:animations/animations.dart';

class OpenContainerAnimation extends StatelessWidget {
  const OpenContainerAnimation(
      {super.key, required this.closedWidget });

  final Widget closedWidget;


  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => closedWidget,
      openBuilder: (context, action) => const Center(),
      closedColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 600),
      openColor: AppColors.primaryColor.withOpacity(0.20),
      openElevation: 0,
      closedElevation: 0,
    );
  }
}
