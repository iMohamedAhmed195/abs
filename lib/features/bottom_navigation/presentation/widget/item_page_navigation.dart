
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../exports.dart';

class ItemPageNavigation extends StatelessWidget {
  const ItemPageNavigation(
      {super.key,
      required this.title,
      required this.indexPage,
      required this.selectedItemImage,
      required this.unSelectedItemImage,
      required this.indexThisItem,
      required this.onClickItem});

  final String selectedItemImage;
  final String unSelectedItemImage;
  final String title;
  final int indexPage;
  final int indexThisItem;
  final Function() onClickItem;

  @override
  @override
  Widget build(BuildContext context) {
    final bool isSelected = indexPage == indexThisItem;

    return MaterialButton(
      minWidth: 0,
      height: 0,
      onPressed: onClickItem,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isSelected ? selectedItemImage : unSelectedItemImage,
            color: isSelected
                ? AppColors.primaryColor
                : Theme.of(context).textTheme.titleLarge!.color,
          ),
          if (isSelected)
            TextWidget(
              text: title,
              fontSizeText: 13.sp,
              colorText: AppColors.primaryColor,
            ),
        ],
      ),
    );
  }
}
