

import 'package:lottie/lottie.dart';

import '../../../../exports.dart';

class EmptyFoldersView extends StatelessWidget {
  const EmptyFoldersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppAssets.emptyFolder,
            repeat: false,
            height: MediaQuery.of(context).size.height * 0.3),
        TextWidget(
          text: AppStrings.noFolders,
          fontSizeText: 20,
          fontWeight: FontWeight.bold,
          colorText: AppColors.primaryColor,
        )
      ],
    );
  }
}
