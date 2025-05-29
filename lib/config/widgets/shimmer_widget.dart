// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shimmer/shimmer.dart';

import '../../../../exports.dart';

class CustomShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxShape? boxShape;
  final double? radius;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;
  final Color? baseColor;
  final Color? highlightColor;
  const CustomShimmer({
    super.key,
    this.height,
    this.width,
    this.boxShape = BoxShape.rectangle,
    this.radius,
    this.borderRadius,
    this.padding,
    this.margin,
    this.boxShadow,
    this.baseColor,
    this.highlightColor,
  });
  const CustomShimmer.fromRectangle({
    super.key,
    this.height = 12,
    this.width = 20,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    this.radius,
    this.padding,
    this.margin,
    this.boxShadow,
  }) : boxShape = BoxShape.rectangle;

  const CustomShimmer.fromCircular({
    super.key,
    this.radius,
    this.baseColor,
    this.highlightColor,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
    this.boxShadow,
  }) : boxShape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.primaryColor.withOpacity(0.2),
      highlightColor: highlightColor ?? AppColors.white,
      // direction: context.read<LanguageCubit>().isEn
      //     ? ShimmerDirection.ltr
      //     : ShimmerDirection.rtl,
      child: boxShape == BoxShape.rectangle
          ? Container(
              height: height,
              width: width,
              padding: padding,
              margin: margin,
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, //! is used to clip the internal child widget of container when u define border radius,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: AppColors.primaryColor.withOpacity(0.6),
                boxShadow: boxShadow,
              ),
            )
          : CircleAvatar(
              backgroundColor: AppColors.primaryColor.withOpacity(0.4),
              radius: radius,
            ),
    );
  }
}
