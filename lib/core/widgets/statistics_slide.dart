import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ilearn/features/home/presentation/managers/statistics_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/statisticsBox_widget.dart';

import '../../exports.dart';

class StatisticsSlide extends StatefulWidget {
  const StatisticsSlide({super.key});

  @override
  State<StatisticsSlide> createState() => _StatisticsSlideState();
}

class _StatisticsSlideState extends State<StatisticsSlide> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) =>          StatisticsCubit(useCase: ServiceLocator.instance.getIt())..getStatistics(),

          child: StatisticsBox(),
        ));
  }
}
