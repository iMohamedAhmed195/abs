import 'package:abs/exports.dart';

class ShipmentCard extends StatelessWidget {
  final Key key;

  const ShipmentCard({required this.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      direction: DismissDirection.startToEnd,
      confirmDismiss: (direction) async {
        print('Details action triggered!');
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: AppColors.primaryColor,
        child: Text('Details', style: getBoldTextStyle(color: Colors.white, fontSize: 14)),
      ),
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      height: 114.h,
      width: double.infinity,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 13.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.07),
            spreadRadius: -2,
            blurRadius: 16.5,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 61.w,
            height: 61.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(child: CustomSVGImage(asset: AppAssets.miniBox)),
          ),
          16.hs,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 22.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 9.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(42.r),
                ),
                child: Row(
                  children: [
                    CustomSVGImage(asset: AppAssets.sandClock),
                    7.hs,
                    Text(
                      'فالانتظار',
                      style: getSemiBoldTextStyle(fontSize: 12, color: AppColors.primaryColor,fontFamily: FontFamilies.ibmPlexSansArabic),
                    ),
                    3.hs
                  ],
                ),
              ),
              8.vs,
              Text(
                '# 61940874',
                style: getBoldTextStyle(fontSize: 18, color: AppColors.black),
              ),
              7.vs,
              Row(
                children: [
                  CustomSVGImage(asset: AppAssets.boxIcon),
                  7.hs,
                  Text(
                    '1 قطعة .',
                    style: getBoldTextStyle(fontSize: 12, color: AppColors.neutral800),
                  ),
                  5.hs,
                  CustomSVGImage(asset: AppAssets.menuBullet),
                  8.hs,
                  Text(
                    'Deliver',
                    style: getRegularTextStyle(fontSize: 12, color: AppColors.neutral800),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          CustomSVGImage(asset: AppAssets.miniArrowLeft, color: AppColors.black),
        ],
      ),
    );
  }
}

