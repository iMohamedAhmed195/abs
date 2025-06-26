import '../../exports.dart';

TextStyle getBoldTextStyle({
  double fontSize = 24,
  Color? color,
  String fontFamily = FontFamilies.PingARLT,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
}) {
  return TextStyle(
      fontSize: fontSize.sp,
      color: color ?? AppColors.black,
      fontWeight: FontWeights.bold,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationStyle: textDecorationStyle,
      decorationColor: decorationColor,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
      fontFeatures: fontFeatures,
      height: height,
      shadows: shadows);
}

// Primary Text Style
TextStyle getRegularTextStyle({
  double fontSize = 14,
  Color? color,
  FontWeight? fontWeight,
  String fontFamily = FontFamilies.PingARLT,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  List<FontFeature>? fontFeatures,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: color ?? AppColors.black,
    fontWeight: FontWeights.regular,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    fontFeatures: fontFeatures,
    height: height,
  );
}

TextStyle getMediumTextStyle({
  double fontSize = 16,
  Color? color,
  FontWeight? fontWeight,
  String fontFamily = FontFamilies.PingARLT,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  List<FontFeature>? fontFeatures,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: color ?? AppColors.black,
    fontWeight: FontWeights.medium,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    fontFeatures: fontFeatures,
    height: height,
  );
}

// Secondary Text Style
TextStyle getSemiBoldTextStyle({
  double fontSize = 14,
  Color? color,
  FontWeight? fontWeight,
  String fontFamily = FontFamilies.PingARLT,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  List<FontFeature>? fontFeatures,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize.sp,
    color: color ?? AppColors.black,
    fontWeight: FontWeights.semiBold,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    fontFeatures: fontFeatures,
    backgroundColor: backgroundColor,
    height: height,
  );
}

ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
      backgroundColor: AppColors.transparent,
      side: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
