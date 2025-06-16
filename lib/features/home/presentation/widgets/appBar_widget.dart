import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ilearn/config/extensions/extensions.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_colors.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';
import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/core/widgets/text_widget.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';

import '../../../../exports.dart';

class AppBarDashBord extends StatelessWidget {
  const AppBarDashBord({super.key, required this.image, required this.point});

  final String image;
  final int point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.06.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<BottomNavOperationCubit>().changeIndex(4) ;
                      // BlocProvider.of<NavigationBetweenPagesBloc>(context).add(
                      //     AddIndexPages(
                      //         indexPage: 4, typeButtonWithProfile: 0));
                    },
                    child: ImageUser(
                      image: '',
                      // image: ShApp().userImage ?? '',
                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  InkWell(
                    onTap: () {
                      // BlocProvider.of<NavigationBetweenPagesBloc>(context).add(
                      //     AddIndexPages(
                      //         indexPage: 4, typeButtonWithProfile: 1));
                    },
                    child: Row(
                      children: [
                        // TextWidget(
                        //   text: '$point',
                        //   fontSizeText: 15,
                        //   colorText: ShApp().getLanguageChar == 'ar'
                        //       ? Colors.white
                        //       : primaryColor,
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        SvgPicture.asset(
                          AppAssets.pointIcon,
                          height: 31.h,
                          width: 26.w,
                          color: false == 'ar' ? Colors.white : AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                        Routes.notificationRoute.moveTo();
                      },
                    child: Badge(
                      isLabelVisible: 5 != 0,
                      backgroundColor: Colors.red,
                      label: TextWidget(text: 5.toString(), fontSizeText: 8, colorText: Colors.white),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.notificationIcon,
                            height: 20,
                            width: 20,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 11.w),
                  InkWell(
                    onTap: () {
                  Routes.settingScreen.moveTo();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.settingIcon,
                          height: 20,
                          width: 20,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 22.h),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const BookScreen(
              //         isSearchScreen: true,
              //       ),
              //     ));
            },
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              height: 36.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.searchIcon),
                      SizedBox(width: 8.w),
                      TextWidget(text: AppStrings.searchBook.trans, fontSizeText: 13, colorText: Colors.black38),
                    ],
                  ),
                  // const Icon(
                  //   Icons.photo_camera_outlined,
                  //   color: Colors.black26,
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
