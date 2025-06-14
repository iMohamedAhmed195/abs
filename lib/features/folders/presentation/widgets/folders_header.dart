

import 'dart:ui';

import 'package:new_ilearn/features/home/presentation/widgets/create_folder_page.dart';

import '../../../../exports.dart';

class FoldersHeader extends StatelessWidget {
  final double shrinkPercent;

  const FoldersHeader({super.key, required this.shrinkPercent});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(top: 24, left: 16, right: 16,bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black12)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (shrinkPercent < 1)
            Opacity(
              opacity: 1 - shrinkPercent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: AppStrings.createFolders.trans, fontSizeText: 18),
                  const SizedBox(height: 4),
                  TextWidget(
                    text: AppStrings.createFoldersTitleDescription.trans,
                    fontSizeText: 14,
                    colorText: AppColors.grey,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: shrinkPercent > 0.95
                    ? Text(AppStrings.folder.trans, style: Theme.of(context).textTheme.titleLarge)
                    : ButtonWidget(
                  height: 40,
                  title: AppStrings.createNewFolder.trans,
                  onClick: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          topLeft: Radius.circular(9),
                        ),
                      ),
                      context: context,
                      builder: (context) => const SingleChildScrollView(
                        child: BottomSheetAddFolder(), // هذه تأتي من ملفك القديم
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: lerpDouble(60, 30, shrinkPercent),
                child: Image.asset(AppAssets.addFolderIcon),
              ),
            ],
          )
        ],
      ),
    );
  }
}
