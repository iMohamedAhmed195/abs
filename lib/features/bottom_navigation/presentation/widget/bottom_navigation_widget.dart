import 'package:new_ilearn/core/models/title_icon_model.dart';
import '../../../../exports.dart';
import '../managers/bottom_nav_operation_cubit.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({super.key, required this.navBar});
  final List<TitleIconModel> navBar;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        setState(() {
          isDrawerOpen = !isDrawerOpen;
        });
      },
      child: Stack(
        children: [
          Container(
            height: 76.h,
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
                  (index) =>
                      index == 2
                          ? const SizedBox.shrink()
                          : GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              context.read<BottomNavOperationCubit>().changeIndex(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CustomSVGImage(
                                      asset:
                                          context.read<BottomNavOperationCubit>().index == index
                                              ? widget.navBar[index].coloredIcon
                                              : widget.navBar[index].icon,
                                      fit: BoxFit.fill,
                                      matchTextDirection: false,
                                    ),
                                  ),
                                  5.vs,
                                  context.read<BottomNavOperationCubit>().index == index
                                      ? Text(
                                        widget.navBar[index].name.trans,
                                        style: getBoldTextStyle(
                                          fontSize: 14,
                                          color:
                                              context.read<BottomNavOperationCubit>().index == index
                                                  ? AppColors.primaryColor
                                                  : AppColors.grey,
                                        ),
                                      )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.read<BottomNavOperationCubit>().openDrawer();
                    print('open drawer ${isDrawerOpen}');
                    isDrawerOpen = !isDrawerOpen;
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CustomSVGImage(
                            asset:
                                isDrawerOpen
                                    ? AppAssets.coloredMenu
                                    :AppAssets.menu,
                            fit: BoxFit.fill,
                            matchTextDirection: false,
                          ),
                        ),
                        5.vs,
                        isDrawerOpen
                            ? Text(
                              AppStrings.menu.trans,
                              style: getBoldTextStyle(
                                fontSize: 14,
                                color:
                                isDrawerOpen
                                    ? AppColors.primaryColor
                                        : AppColors.grey,
                              ),
                            )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(child: IgnorePointer(child: CustomPaint(painter: NotchPainter()))),
        ],
      ),
    );
  }
}

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final Paint paint = Paint()..color = AppColors.red; // notch color
    final Paint paint = Paint()..color = AppColors.white; // notch color

    final double notchRadius = 50;
    final double notchWidth = 75;
    final double notchDepth = 38;
    final double centerX = size.width / 2;

    final Path notchPath = Path();

    // Define the bump shape same as in clipper but just the notch itself
    notchPath.moveTo(centerX + notchWidth / 2 + 10, 0);
    notchPath.quadraticBezierTo(centerX + notchWidth / 2, 0, centerX + notchWidth / 2 - 10, -notchDepth + 10);
    notchPath.arcToPoint(
      Offset(centerX - notchWidth / 2 + 10, -notchDepth + 10),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    notchPath.quadraticBezierTo(centerX - notchWidth / 2, 0, centerX - notchWidth / 2 - 10, 0);
    notchPath.close();

    canvas.drawPath(notchPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
