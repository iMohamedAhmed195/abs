
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../exports.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation(
      {super.key, required this.valueOfTitle, required this.title, this.onTap});

  final String title;
  final String valueOfTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsetsDirectional.zero,
      minTileHeight: 0,
      minVerticalPadding: 4,
      leading: TextWidget(
        text: '$title:',
        fontSizeText: 15.sp,
        colorText: Theme.of(context).textTheme.titleMedium!.color,
      ),
      title: valueOfTitle.isNotEmpty
          ? TextWidget(
              text: valueOfTitle,
              fontSizeText: 18,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: TextWidget(
                        text: AppStrings.add,
                        fontSizeText: 12,
                        colorText:
                            Theme.of(context).textTheme.labelSmall!.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
