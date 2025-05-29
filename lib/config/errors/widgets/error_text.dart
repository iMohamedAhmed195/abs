import '../../../../exports.dart';

class ErrorText extends StatelessWidget {
  final String? text;
  final bool showError;

  const ErrorText({required this.text, this.showError = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: 500.microseconds,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
        child: showError.isTrueGetWidgetOrAnotherWidget(
          Padding(
            padding: EdgeInsetsDirectional.only(top: 5, ),
            child: Row(
              children: [
                SizedBox(
                  height: 15.h,
                    width: 15.w,
                    child: CustomPngImage(image: AppAssets.star,isAsset: true,)
                ),
                5.hs,
                Text(
                  text!,
                  textAlign: TextAlign.start,
                  style: getSemiBoldTextStyle(color: AppColors.primaryColor, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox.shrink(),
        ));
  }
}
