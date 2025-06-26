import 'package:abs/exports.dart';

class CommissionBarSection extends StatelessWidget {
  const CommissionBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 144.h,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w, vertical: 23.5.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.lightGrey, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSVGImage(asset: AppAssets.gold),
          5.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("EGP", style: getRegularTextStyle(fontSize: 18, color: AppColors.primaryColor)),
              5.hs,
              Text("1,200", style: getBoldTextStyle(fontSize: 24, color: AppColors.primaryColor)),
            ],
          ),
          10.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("15 شحنة", style: getBoldTextStyle(fontSize: 12, color: AppColors.secondaryColor)),
              Text(
                "تزداد عمولتك بعد وصولك للهدف",
                style: getRegularTextStyle(fontSize: 12, color: AppColors.branchColor),
              ),
              Text("12 شحنة", style: getBoldTextStyle(fontSize: 12, color: AppColors.secondaryColor)),
            ],
          ),
          7.vs,
          Directionality(textDirection:
          TextDirection.ltr,
              child: LinearProgressIndicator(
                value: 0.8,
                backgroundColor:AppColors.progressBackGround,
                color: AppColors.primaryColor,
                minHeight: 8.h,
                borderRadius: BorderRadius.circular(32.r),
              )
          ),
        ],
      ),
    );
  }
}
