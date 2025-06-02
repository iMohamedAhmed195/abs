import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_svg/svg.dart';
 
import 'package:intl/intl.dart';
import 'package:new_ilearn/features/home/presentation/widgets/statisticsBox_widget.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/goalWidget.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/statisticReport_widget.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/statisticsTap_widget.dart';

import '../../../../exports.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key, required this.isScroled});

  final bool isScroled;

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

 late int _typeFilterStatistic; // 0?daily  1?weekly  2?monthly
bool editeGoal = false;
int goalBook = 5;
int goalQuiz = 41;
var formatNumber = NumberFormat("##.##", "en_US");

class _StatisticsPageState extends State<StatisticsPage>   {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _typeFilterStatistic = 0;
    editeGoal = false;
  }

  @override
  void dispose() {
    editeGoal = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isScroled)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatisticsTap(
                    title: AppStrings.points.trans,
                    icon: AppAssets.pointStatistics.trans,
                    numberOfStatistic: formatNumber.format(double.parse(
                       "50")),
                  ),
                  StatisticsTap(
                    title: AppStrings.uploadedBooks.trans,
                    icon: AppAssets.bookStatistics,
                    numberOfStatistic:"10",
                  ),
                  StatisticsTap(
                    title: AppStrings.recordSuccess.trans,
                    icon: AppAssets.testStatistics,
                    numberOfStatistic: "445",
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const StatisticsBox(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: AppStrings.theGoal.trans,
              fontSizeText: 20,
              fontWeight: FontWeight.bold,
            ),
            IconButton(
                onPressed: () {

                  setState(() {
                    editeGoal = !editeGoal;
                  });
                },
                icon: Icon(
                  editeGoal ? Icons.check : Icons.edit,
                  color: !editeGoal
                      ? Theme.of(context).textTheme.titleLarge!.color
                      : Colors.green,
                ))
          ],
        ),
        TextWidget(
          text: AppStrings.numberBooks.trans,
          fontSizeText: 15,
          colorText: Theme.of(context).textTheme.titleMedium!.color,
        ),
        const SizedBox(
          height: 8,
        ),
        GoalWidget(
          colorBorder: !editeGoal
              ? Theme.of(context).textTheme.titleSmall!.color!
              : Theme.of(context).highlightColor,
          visible: editeGoal,
          add: () {
            if (goalBook < 10) {
              setState(() {
                goalBook++;
              });
            }
          },
          title: '$goalBook ${AppStrings.books.trans} ',
          remove: () {
            if (goalBook > 1) {
              setState(() {
                goalBook--;
              });
            }
          },
        ),
        TextWidget(
          text: AppStrings.numberTests.trans,
          fontSizeText: 15,
          colorText: Theme.of(context).textTheme.titleMedium!.color,
        ),
        const SizedBox(
          height: 8,
        ),
        GoalWidget(
          colorBorder: !editeGoal
              ? Theme.of(context).textTheme.titleSmall!.color!
              : Theme.of(context).highlightColor,
          visible: editeGoal,
          add: () {
            if (goalQuiz < 10) {
              setState(() {
                goalQuiz++;
              });
            }
          },
          title: '$goalQuiz ${AppStrings.test.trans} ',
          remove: () {
            if (goalQuiz > 1) {
              setState(() {
                goalQuiz--;
              });
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        ListTile(
          contentPadding: EdgeInsetsDirectional.zero,
          leading: SvgPicture.asset(AppAssets.reports),
          title: TextWidget(
            text: AppStrings.reports.trans,
            fontSizeText: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          thickness: 0,
          endIndent: 10,
          indent: 10,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
                width: 80,
                colorButton: changeColorWithTypeFiltterButton(0),
                height: 38,
                colorTitleButton: changeColorWithTypeTitleButton(0),
                title: AppStrings.daily.trans,
                onClick: () => selectFiltterType(0)),
            ButtonWidget(
                width: 80,
                colorButton: changeColorWithTypeFiltterButton(1),
                height: 38,
                colorTitleButton: changeColorWithTypeTitleButton(1),
                title: AppStrings.weekly.trans,
                onClick: () => selectFiltterType(1)),
            ButtonWidget(
                width: 80,
                colorButton: changeColorWithTypeFiltterButton(2),
                height: 38,
                colorTitleButton: changeColorWithTypeTitleButton(2),
                title: AppStrings.monthly.trans,
                onClick: () => selectFiltterType(2)),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        StatisticReport(
          percent:
          0.9, //state.statisticsWithReport!.getExcitementPoinPercent,
          title: AppStrings.performanceRate.trans,
          colorCircle: Colors.green,
          onClick: () {},
          subTitle: AppStrings.completedTests.trans,
          titlePercent:
          '${   0.8}%',
        ),
        StatisticReport(
          percent:
          0.5,
          title: AppStrings.uploadedBooks.trans,
          colorCircle: Colors.orange,
          onClick: () {},
          subTitle:
          AppStrings.booksUploadedToApplication.trans,
          titlePercent:
          '${105}%',
        ),
        StatisticReport(
          percent: 0.7,
          title: AppStrings.points.trans,
          colorCircle: AppColors.primaryColor,
          onClick: () {},
          subTitle:
          AppStrings.enthusiasmPointsEarned.trans,
          titlePercent:
          '${formatNumber.format(double.parse("475"))}%',
        ),
      ],
    );
  }

  Color changeColorWithTypeFiltterButton(int type) {
    return type == _typeFilterStatistic ? AppColors.primaryColor : AppColors.lightSplashColor;
  }

  Color changeColorWithTypeTitleButton(int type) {
    return type == _typeFilterStatistic ? Colors.white : Colors.black;
  }

  void selectFiltterType(int type) {
    setState(() {
      _typeFilterStatistic = type;
    });

  }

  String reportType(int type) {
    switch (type) {
      case 0:
        return StatisticReportType.daily.name;
      case 1:
        return StatisticReportType.weekly.name;
      case 2:
        return StatisticReportType.monthly.name;
      default:
        return StatisticReportType.weekly.name;
    }
  }
}
enum StatisticReportType { monthly,daily,weekly }