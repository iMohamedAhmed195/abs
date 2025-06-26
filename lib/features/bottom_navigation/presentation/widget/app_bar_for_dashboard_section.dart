import 'package:abs/exports.dart';

class AppBarForDashboardSection extends StatelessWidget {
  const AppBarForDashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 9.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              print('log in console from avatar');
            },
            child: CircleAvatar(
              radius: 28.r,
              backgroundColor: AppColors.white,
              backgroundImage: AssetImage(AppAssets.profile),
            ),
          ),
          8.hs,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('كيرلس عادل', style: getBoldTextStyle(color: AppColors.secondaryColor, fontSize: 16)),
              Text('فرع المعادي', style: getBoldTextStyle(color: AppColors.branchColor, fontSize: 12)),
            ],
          ),
          8.hs,
          SizedBox(
              width: 40.w,
              height: 35.h,
              child: CustomPngImage(image: AppAssets.level,isAsset: true,)
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              print('log in console from bell icon');
            },
            child: Stack(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  padding: EdgeInsets.all(9.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backgroundIconContainer,
                  ),
                  child: CustomSVGImage(asset: AppAssets.notification),
                ),
                Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.red,
                    border: Border.all(color: AppColors.white, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: getBoldTextStyle(color: AppColors.white, fontSize: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.hs,
          Container(
            width: 36.w,
            height: 36.h,
            padding: EdgeInsets.all(9.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundIconContainer,
            ),
            child: CustomSVGImage(asset: AppAssets.menu),
          ),
        ],
      ),
    );
  }
}
