import 'package:abs/core/models/title_icon_model.dart';
import '../../../../exports.dart';
import '../managers/bottom_nav_operation_cubit.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({super.key, required this.navBar});
  final List<TitleIconModel> navBar;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            height: 65.h,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.7), // Container background color
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ), // Example: Rounded corners
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.3), // Convert hex color to Color
                  offset: Offset(0, 4),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  widget.navBar.length,
                  (index) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      context.read<BottomNavOperationCubit>().changeIndex(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Container(
                                height: 35.w,
                                width: 30.h,
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color:
                                      context.read<BottomNavOperationCubit>().index == index
                                          ? AppColors.primaryColor.withOpacity(0.1)
                                          : AppColors.transparent,
                                  borderRadius: BorderRadius.circular(9.r),
                                ),
                                child: CustomSVGImage(
                                  asset: widget.navBar[index].icon,
                                  fit: BoxFit.fill,
                                  matchTextDirection: false,
                                  color:
                                      context.read<BottomNavOperationCubit>().index == index
                                          ? AppColors.primaryColor
                                          : AppColors.grey,
                                ),
                              ),
                           index==1 || index ==2 ?  Positioned(
                             right: -1,
                             top: 3,
                             child: Container(
                                  width: 19.w,
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    border: Border.all(color: AppColors.white, width: 1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '12',
                                      style: getBoldTextStyle(color: AppColors.white, fontSize: 8),
                                    ),
                                  ),
                                ),
                           ) : SizedBox.shrink(),
                            ],
                          ),
                          Text(
                            widget.navBar[index].name.trans,
                            style: getBoldTextStyle(
                              fontSize: 14,
                              color:
                                  context.read<BottomNavOperationCubit>().index == index
                                      ? AppColors.primaryColor
                                      : AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
