import 'package:new_ilearn/config/widgets/custome_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:new_ilearn/config/extensions/extensions.dart';
import 'package:new_ilearn/config/routes/app_routes_helper.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/core/utils/app_colors.dart';
import 'package:new_ilearn/core/utils/app_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.isBold = true, this.titleStyle});
  final String title;
  final bool isBold;
  final TextStyle? titleStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 23.ph,
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              pop(context);
            },
            child: CustomSVGImage(
              matchTextDirection: false,
              asset: AppAssets.arrowBack,
            ),
          ),
          Expanded(
            child: Center(
                child: Text(
              title,
              style: titleStyle != null
                  ? titleStyle
                  : isBold
                      ? getBoldTextStyle(
                          fontSize: 20,
                          color: AppColors.black,
                        )
                      : getRegularTextStyle(
                          color: AppColors.black,
                        ),
            )),
          ),

        ],
      ),
    );
  }
}
