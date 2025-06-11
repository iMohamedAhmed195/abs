import 'package:new_ilearn/core/widgets/circleStatistics.dart';
import 'package:new_ilearn/features/home/data/models/statistics_model.dart';

import '../../../../exports.dart';

class StatisticsSection extends StatefulWidget {
  const StatisticsSection({super.key, this.statisticsData});
  final StatisticsDataModel? statisticsData;
  @override
  State<StatisticsSection> createState() => _StatisticsSectionState();
}

class _StatisticsSectionState extends State<StatisticsSection> {
  final list = [
    AppStrings.satr.trans,
    AppStrings.sun.trans,
    AppStrings.mon.trans,
    AppStrings.tus.trans,
    AppStrings.wedn.trans,
    AppStrings.ther.trans,
    AppStrings.fri.trans
  ];

  @override
  Widget build(BuildContext context) {

    return  Container(
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
                    percent: widget.statisticsData!.weekPercentageData!.percentage!/1000.0,
                    //5 / 100.0,
                    title:
                    '${(widget. statisticsData!.weekPercentageData!.percentage)! /(1000.0)}%',
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
    );
  }
}
