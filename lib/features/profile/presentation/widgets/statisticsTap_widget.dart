 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../exports.dart';

class StatisticsTap extends StatelessWidget {
  const StatisticsTap(
      {super.key,
      required this.title,
      required this.icon,
      required this.numberOfStatistic});

  final String icon;
  final String numberOfStatistic;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 32.h,
          width: 32.w,
        ),
        SizedBox(
          width: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: numberOfStatistic,
              fontSizeText: 15,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              text: title.trans,
              fontSizeText: 9,
            ),
          ],
        )
      ],
    );
  }
}
