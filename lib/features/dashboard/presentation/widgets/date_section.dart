import 'package:abs/exports.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28.h,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w,vertical:3.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.backgroundIconContainer,
          ),
          child: Row(
            children: [
              CustomSVGImage(asset: AppAssets.calendar),
              5.hs,
              Text(
                AppStrings.fixedDate.trans,
                style: getMediumTextStyle(fontSize: 12, color: AppColors.textColor),
              ),
              5.hs,
              CustomSVGImage(asset: AppAssets.miniArrowDown),
            ],
          ),
        ),
        12.hs,
        Container(
          height: 28.h,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical:1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.transparent,
            border: Border.all(
              color: AppColors.backgroundColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Text(
                "جميع الايام",
                style: getMediumTextStyle(fontSize: 12, color: AppColors.textColor),
              ),

            ],
          ),
        )
      ],
    );
  }
}
