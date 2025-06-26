import 'dart:ui';
import 'package:abs/exports.dart';
import 'package:abs/features/dashboard/data/dummy_data/dummy_box_data.dart';

class KpiGridViewSection extends StatefulWidget {
  const KpiGridViewSection({super.key});

  @override
  State<KpiGridViewSection> createState() => _KpiGridViewSectionState();
}

class _KpiGridViewSectionState extends State<KpiGridViewSection> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<int>> _countAnimations;
  @override
  void initState() {
    super.initState();
    _controllers = List.generate(boxDetailsList.length, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
    });

    _fadeAnimations = List.generate(boxDetailsList.length, (index) {
      return CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeIn,
      );
    });

    _countAnimations = List.generate(boxDetailsList.length, (index) {
      final endValue = int.tryParse(boxDetailsList[index].subtitle) ?? 0;
      return IntTween(begin: 0, end: endValue).animate(
        CurvedAnimation(parent: _controllers[index], curve: Curves.easeOut),
      );
    });

    // Start with delay (staggered effect)
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18.w,
        mainAxisSpacing: 19.h,
        mainAxisExtent: 120.h,
      ),
      itemCount: boxDetailsList.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeTransition(
            opacity: _fadeAnimations[index],
            child: AnimatedBuilder(
              animation: _countAnimations[index],
              builder: (context, child) {
                return Container(
                  width: 185.w,
                  height: 125.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: boxDetailsList[index].BoxColor,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 12.h, start: 10.w),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                boxDetailsList[index].title,
                                style: getBoldTextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  fontFamily: FontFamilies.lyonArabicDisplay,
                                  fontFeatures: [FontFeature.enable('salt')],
                                ),
                              ),
                              5.vs,
                              Text(
                                _countAnimations[index].value.toString(),
                                style: getBoldTextStyle(
                                  color: boxDetailsList[index].ButtonColor,
                                  fontSize: 30.32,
                                ),
                              ),
                              6.vs,
                              CircleAvatar(
                                radius: 10.r,
                                backgroundColor: boxDetailsList[index].ButtonColor,
                                child: CustomSVGImage(asset: AppAssets.miniArrowRight),
                              ),
                            ],
                          ),
                        ),
                        index == 2 || index == 4
                            ? SizedBox(
                          width: index == 4 ? 130.w : 80.w,
                          child: CustomPngImage(
                            isAsset: true,
                            image: boxDetailsList[index].image,
                          ),
                        )
                            : SizedBox(
                          height: 85.h,
                          width: 90.w,
                          child: CustomSVGImage(
                            asset: boxDetailsList[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

    );
  }
}

