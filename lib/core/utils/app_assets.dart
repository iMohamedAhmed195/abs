abstract class PngImages {
  static String imagesPath = "assets/images";
}

abstract class SvgImages {
  static String svgPath = "assets/icons";

  ///Icons svg
}
abstract class AnimationImages {
  static String animationPath = "assets/animation";

  ///Icons svg
}

class AppAssets {


  //! PNGs
  static String logoWhite = "${PngImages.imagesPath}/logo_white.png";
  static String logo = "${PngImages.imagesPath}/logo.png";
  static String bubbleWelcomeScreen = '${PngImages.imagesPath}/bubble_wellcomScreen.png';
  static String bubbleWelcomeScreenLight = '${PngImages.imagesPath}/bubble_wellcomeScreen_light.png';
  static String uploadQuestions = '${PngImages.imagesPath}/uploadQuestions.png';
  static String joinOurCommunity = '${PngImages.imagesPath}/joinOurCommunity.png';
  static String createQuiz = '${PngImages.imagesPath}/createQuize.png';
  static String uploadBook = '${PngImages.imagesPath}/uploadBook.png';
  static String logoName = '${PngImages.imagesPath}/logoName.png';
  static String bubbleLoginLeft = '${PngImages.imagesPath}/bubbleLoginLeft.png';
  static String bubbleLoginLeftLight = '${PngImages.imagesPath}/bubbleLoginLeftLight.png';
  static String bubbleLoginRight = '${PngImages.imagesPath}/bubbleLoginRight.png';
  static String google = '${PngImages.imagesPath}/google.png';
  static String facebook = '${PngImages.imagesPath}/facebook.png';
  static String twitter = '${PngImages.imagesPath}/twitter.png';

  //! SVGs
  static String success = "${SvgImages.svgPath}/success.svg";
  static String failure = "${SvgImages.svgPath}/failure.svg";

//! Animation
  static String splashLogo = "${AnimationImages.animationPath}/splashLogo.json";

}
