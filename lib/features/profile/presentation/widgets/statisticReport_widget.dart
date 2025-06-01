
import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/circleStatistics.dart';

import '../../../../exports.dart';

class StatisticReport extends StatelessWidget {
  const StatisticReport(
      {super.key,
      required this.percent,
      required this.colorCircle,
      required this.title,
      required this.onClick,
      required this.subTitle,
      required this.titlePercent});

  final String title;
  final String subTitle;
  final double percent;
  final Color colorCircle;
  final Function() onClick;
  final String titlePercent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleStatistics(
                title: titlePercent,
                percent: percent,
                color: colorCircle,
                radius: 30,
              ),
              const SizedBox(width: 6,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    fontSizeText: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text: subTitle,
                    fontSizeText: 14,
                    colorText: Colors.black38,
                  ),
                ],
              ),
            ],
          ),
          // IconButton(
          //     onPressed: onClick,
          //     icon: const Icon(
          //       size: 17,
          //       Icons.arrow_forward_ios_rounded,
          //       color: ,
          //     )),
        ],
        // leading: CircleStatistics(
        //   title: titlePercent,
        //   percent: percent,
        //   color: colorCircle,
        //   radius: 30,
        // ),
        // subtitle: TextWidget(
        //   text: subTitle,
        //   fontSizeText: 14,
        //   colorText: Colors.black38,
        // ),
        // title: TextWidget(
        //   text: title,
        //   fontSizeText: 15,
        //   fontWeight: FontWeight.bold,
        // ),
        // trailing: IconButton(
        //     onPressed: onClick,
        //     icon: const Icon(
        //       size: 17,
        //       Icons.arrow_forward_ios_rounded,
        //       color: Colors.black26,
        //     )),
      ),
    );
  }
}
