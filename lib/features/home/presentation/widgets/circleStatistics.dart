 import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../exports.dart';

class CircleStatistics extends StatelessWidget {
  const CircleStatistics(
      {super.key,
      required this.title,
      this.radius = 20,
      required this.percent,
      this.color,
      this.centerWidget,
      this.paddingEnd = 5,
      this.lineWidth = 4.0,
      this.animation = false,this.colorText,this.backgroundColor,this.backgroundWidth = 4});

  final String title;
  final double radius;
  final double percent;
  final Color? color;
  final Widget? centerWidget;
  final double paddingEnd;
  final double lineWidth;
  final bool animation;
  final Color ?colorText;
  final Color ?backgroundColor;
  final double backgroundWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: paddingEnd),
      child: CircularPercentIndicator(
        animation: animation,
        backgroundWidth: backgroundWidth,
        radius: radius,
        lineWidth: lineWidth,
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: backgroundColor??Theme.of(context).indicatorColor,
        percent: percent,
        center: centerWidget ?? TextWidget(text: title, fontSizeText: 10,colorText: colorText,),
        progressColor: color ?? AppColors.primaryColor,
      ),
    );
    // return Container(
    //   margin: const EdgeInsetsDirectional.only(end: 5),
    //   height: 40,
    //   width: 40,
    //   decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Colors.transparent,
    //       border: Border.all(color: primaryColor, width: 2)),
    //   child: Center(
    //     child: TextWidget(text: title, fontSizeText: 10),
    //   ),
    // );
  }
}
