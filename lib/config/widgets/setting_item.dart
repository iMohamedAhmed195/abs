
import '../../exports.dart';

class SettingItemWidget extends StatelessWidget {
  final String title;
  final double? width;
  final String? subTitle;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final Function()? onTap;
  final EdgeInsets? padding;
  final int paddingAfterLeading;
  final int paddingBeforeTrailing;
  final Color? titleTextColor;
  final Color? subTitleTextColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Decoration? decoration;
  final double? borderRadius;
  final BorderRadius? radius;

  SettingItemWidget({
    required this.title,
    this.onTap,
    this.width,
    this.subTitle = '',
    this.leading,
    this.trailing,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.padding,
    this.paddingAfterLeading = 16,
    this.paddingBeforeTrailing = 16,
    this.titleTextColor,
    this.subTitleTextColor,
    this.decoration,
    this.borderRadius,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      splashColor: splashColor ?? AppColors.primaryColor,
      hoverColor: hoverColor ?? AppColors.primaryColor,
      highlightColor: highlightColor ?? AppColors.primaryColor,
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: decoration ?? BoxDecoration(),
        child: Row(
          children: [
            leading ?? SizedBox(),
            if (leading != null) paddingAfterLeading.hs,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleTextStyle ?? getBoldTextStyle(color: titleTextColor ?? AppColors.primaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subTitle.validate.isNotEmpty) 4.hs,
                  if (subTitle.validate.isNotEmpty)
                    Text(
                      subTitle!,
                      style: subTitleTextStyle ??
                          getRegularTextStyle(
                            color: subTitleTextColor ?? AppColors.primaryColor,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (trailing != null) paddingBeforeTrailing.hs,
            trailing ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
