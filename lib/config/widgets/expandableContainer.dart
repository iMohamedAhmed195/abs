
import '../../exports.dart';

class ExpandableContainer extends StatelessWidget {
  ExpandableContainer({ required this.isExpanded, required this.onTap});
  final bool isExpanded;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap:onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: MediaQuery.sizeOf(context).width * 0.9,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 9.w, vertical: 12.h),
          height: isExpanded ? 230.h : 100.h, // Toggle height
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border(right: BorderSide(color: AppColors.primaryColor)),
              boxShadow: [BoxShadow(offset: Offset(0, 0), blurRadius: 40, color: AppColors.black.withOpacity(0.01))]),
          child: Row(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:40.w,
                        child: Text(
                          'BMW',
                          style: getSemiBoldTextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.brand.trans,
                            style: getRegularTextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width:160.w,
                            child: Text(
                              ': BMW 2025 -X6',
                              overflow: TextOverflow.ellipsis,
                              style: getRegularTextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppStrings.branchBrand.trans,
                            style: getRegularTextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width:140.w,
                            child: Text(
                              ': BMW X6 2025 – Mid-size Luxury SUV',
                              overflow: TextOverflow.ellipsis,
                              style: getRegularTextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      if (isExpanded) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.distributor.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:140.w,
                              child: Text(
                                ': أبو غالي أوتو موتف',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.category.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:140.w,
                              child: Text(
                                ': الفئة الاولي',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.color.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:140.w,
                              child: Text(
                                ': الابيض',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.buyingPrice.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:140.w,
                              child: Text(
                                ': 7.750.000',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.expectedSellingPrice.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:100.w,
                              child: Text(
                                ': 9,250,000​',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.distributor.trans,
                              style: getRegularTextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width:140.w,
                              child: Text(
                                ': أبو غالي أوتو موتف',
                                overflow: TextOverflow.ellipsis,
                                style: getRegularTextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color:isExpanded ? AppColors.primaryColor : AppColors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryColor)
                        ),
                        child: Icon(Icons.check,color: AppColors.white,size: 10.h,),
                      ),
                      10.hs,
                      Container(
                        width: 61.w,
                        height: 22.h,
                        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: Text(
                            '01:09:56',
                            style: getRegularTextStyle(fontSize: 8, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
