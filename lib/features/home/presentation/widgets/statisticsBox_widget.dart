
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_ilearn/config/widgets/notInternet_page.dart';
import 'package:new_ilearn/config/widgets/somthingError_page.dart';

import 'package:new_ilearn/features/home/presentation/managers/statistics_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/statistics_section.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/statisticReport_shimmer.dart';

import '../../../../exports.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {




    return BlocConsumer<StatisticsCubit, CubitStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return state is LoadedState ?StatisticsSection(statisticsData: state.data,):state is FailedState? ErrorPage(error: state.message, tryAgain: () => reloadPage(context),):state is LoadingState?  Center(child: StatisticReportShimmer(),):NotInternetPage(tryAgain: () => reloadPage(context),);
  },
);
  }

    reloadPage(BuildContext context) {
      BlocProvider.of<StatisticsCubit>(context).getStatistics();
  }
}
