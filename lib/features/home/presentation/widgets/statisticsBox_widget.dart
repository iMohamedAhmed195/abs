
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';
import 'package:new_ilearn/features/home/presentation/managers/statistics_cubit.dart';

import '../../../../exports.dart';
import 'circleStatistics.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final list = [
      AppStrings.satr.trans,
      AppStrings.sun.trans,
      AppStrings.mon.trans,
      AppStrings.tus.trans,
      AppStrings.wedn.trans,
      AppStrings.ther.trans,
      AppStrings.fri.trans
    ];


    return BlocConsumer<StatisticsCubit, CubitStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return state is LoadedState ? Container(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 21, vertical: 13),
      margin: const EdgeInsetsDirectional.only(top: 29, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, //lightSplashColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleStatistics(
                    animation: true,
                    radius: 26,
                    percent: 0.6,
                    //5 / 100.0,
                    title:
                    '${0.6}%',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          text: AppStrings.today.trans,
                          fontSizeText: 13),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                        text:
                        '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}',
                        fontSizeText: 14,
                        colorText: AppColors.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
              SvgPicture.asset(AppAssets.statisticsIcon)
            ],
          ),
          const Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 8),
              child: Divider(
                endIndent: 20,
                indent: 20,
              )),
          Align(
            child: SizedBox(
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return CircleStatistics(
                    lineWidth: 3,
                    animation: true,
                    title: list[index],
                    percent: 0.5,
                  );
                },
              ),
            ),
          )
        ],
      ),
    ):const Center(child: CircularProgressIndicator(),);
  },
);
  }
}
