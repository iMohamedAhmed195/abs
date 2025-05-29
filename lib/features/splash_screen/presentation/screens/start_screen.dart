import 'package:new_ilearn/core/widgets/buttonIcon_widget.dart';

import '../../../../exports.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset(AppAssets.logoName),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              textAlign: TextAlign.center,
              text: AppStrings.startProject.trans,
              fontSizeText: 19,
              fontWeight: FontWeight.w300,
            ),
            const Spacer(
              flex: 3,
            ),
            ButtonWidget(
              title: AppStrings.letsGo.trans,
              onClick: () => clickButton(Routes.registerRoute),
            ),
            const SizedBox(
              height: 30,
            ),
            AuthenticatedIconButtonScreen(
              onClick: () => clickButton(Routes.loginRoute),
              title: AppStrings.alreadyHaveAccount.trans,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  clickButton(String routName) async {
    // await ShApp().saveStartAppStatus(isShowed: true);
    routName.moveTo();
  }
}
