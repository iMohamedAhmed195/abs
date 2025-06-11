

import '../../exports.dart';

class NotInternetPage extends StatelessWidget {
  const NotInternetPage(
      {super.key,
      required this.tryAgain,
      this.usePadding = true,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly});

  final Function() tryAgain;
  final bool usePadding;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: usePadding
          ? const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20)
          : EdgeInsetsDirectional.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Image.asset(AppAssets.noInternet),
          TextWidget(
            text: AppStrings.noInternet,
            fontSizeText: 23,
            colorText: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              TextWidget(
                text: AppStrings.noInternetConnectionFound,
                fontSizeText: 18,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: AppStrings.pleaseCheckYourInternetConnection,
                fontSizeText: 14,
                fontWeight: FontWeight.bold,
                colorText: Colors.black45,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(title: AppStrings.tryAgain, onClick: tryAgain)
        ],
      ),
    );
  }
}
