
import '../../exports.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
      {super.key,
      required this.tryAgain,
      required this.error,
        this.statusCode,
      this.showTryButton = true});

  final Function() tryAgain;
  final String error;
  final int? statusCode;
  final bool showTryButton;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppAssets.error),
          statusCode != null ? TextWidget(
            text: statusCode.toString(),
            fontSizeText: 23,
            fontWeight: FontWeight.bold,
            colorText: AppColors.primaryColor,
          ):SizedBox(),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              TextWidget(
                text: AppStrings.somthingError,
                fontSizeText: 18,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                textAlign: TextAlign.center,
                text: error,
                fontSizeText: 14,
                fontWeight: FontWeight.bold,
                colorText: Colors.black45,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
              visible: showTryButton,
              child:
                  ButtonWidget(title: AppStrings.tryAgain, onClick: tryAgain))
        ],
      ),
    );
  }
}
