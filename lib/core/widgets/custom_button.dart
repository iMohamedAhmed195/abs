// ignore_for_file: deprecated_member_use

import '../../exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.borderRadius,
      required this.onPressed,
      this.textColor,
      this.borderColor,
      this.backgroundColor,
      this.svgIconPath,
      this.height,
      this.style});
  final String text;
  final double? borderRadius;
  final String? svgIconPath;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 24,
            color: AppColors.black.withOpacity(0.08)
          )
        ]
      ),
      child: MaterialButton(
        height: height ?? 50.h,
         color: backgroundColor ?? AppColors.white,
        elevation: 0,
        highlightElevation: 0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            side: BorderSide(color: borderColor ?? AppColors.transparent)),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgIconPath != null ? 12.hs : 0.hs,
            Center(
              child: Text(
                text,
                style: style ??
                    getSemiBoldTextStyle(
                        fontSize: 18, color: textColor ?? AppColors.black),
              ),
            ),
            svgIconPath != null
                ? SizedBox(
                    width: 14.w,
                  )
                : const SizedBox(
                    width: 0,
                  ),
            svgIconPath != null
                ? SvgPicture.asset(
                    svgIconPath!,
                    width: 24.w,
                    height: 24.w,
                    color: textColor ?? AppColors.white,
                  )
                : const SizedBox(
                    width: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
