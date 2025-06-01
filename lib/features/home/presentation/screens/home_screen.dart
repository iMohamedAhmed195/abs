import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_ilearn/config/widgets/custom_background.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/widgets/statistics_slide.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:new_ilearn/features/home/presentation/widgets/appBar_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/book_slide.dart';
import 'package:new_ilearn/features/home/presentation/widgets/folder_slide.dart';
import 'package:new_ilearn/features/home/presentation/widgets/groups_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen>  {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: context.read<BottomNavOperationCubit>().index != 2,
          child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppAssets.bubbleDashBordLight,
              )),
        ),
        Visibility(
          visible: context.read<BottomNavOperationCubit>().index != 2,
          child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.bubbleDashBord)),
        ),

        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                bottom: MediaQuery.of(context).size.height * 0.10.h),
            child:   Column(
              children: [
                Visibility(
                  visible: context.read<BottomNavOperationCubit>().index != 4 &&
                      context.read<BottomNavOperationCubit>().index != 2,
                  child: AppBarDashBord(
                    image: AppAssets.person,
                    point: 10,
                  ),
                ),
                StatisticsSlide(),
                ActiveGroups(),
                FolderSlide(),
                SizedBox(
                  height: 15,
                ),
                BookSlide()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
