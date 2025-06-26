import 'package:abs/exports.dart';

class DetailsBoxClass{
  final String image;
  final String title;
  final String subtitle;
  final Color BoxColor;
  final Color ButtonColor;
  DetailsBoxClass({required this.image,required this.title,required this.subtitle,required this.BoxColor,required this.ButtonColor});
}
List<DetailsBoxClass> boxDetailsList=[
  DetailsBoxClass(
      image: AppAssets.closedBox,
      title: "الشحنات \nالمُسلَّمة",
      subtitle: "30",
      BoxColor: AppColors.babyBlue,
      ButtonColor: AppColors.tertiaryColor
  ),
  DetailsBoxClass(
      image: AppAssets.openedBox,
      title: "الشحنات \nالمعلقة",
      subtitle: "20",
      BoxColor: AppColors.primaryColor.withOpacity(0.1),
      ButtonColor: AppColors.primaryColor
  ),
  DetailsBoxClass(
      image: AppAssets.money,
      title: "القيمة \nالمجمعة",
      subtitle: "40",
      BoxColor: AppColors.green.withOpacity(0.1),
      ButtonColor: AppColors.green
  ),
  DetailsBoxClass(
      image: AppAssets.errorBox,
      title: "الشحنات الغير \nالمُسلَّمة",
      subtitle: "50",
      BoxColor: AppColors.red.withOpacity(0.1),
      ButtonColor: AppColors.bloodRed
  ),
  DetailsBoxClass(
      image: AppAssets.note,
      title: "مجموعة \nالتوصيل",
      subtitle: "60",
      BoxColor: AppColors.purple.withOpacity(0.25),
      ButtonColor: AppColors.indigo
  ),
  DetailsBoxClass(
      image: AppAssets.cycleBox,
      title: "نورمال  \nبيك اب",
      subtitle: "30",
      BoxColor: AppColors.yellowAlpha.withOpacity(0.1),
      ButtonColor: AppColors.yellow
  ),
];