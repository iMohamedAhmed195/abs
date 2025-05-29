import '../../exports.dart';


class PermissionDialog extends StatelessWidget {
  late String title;
  late String description;
  String? asset;
  late bool isAsset;
  IconData? icon;
  PermissionDialog._internal();
  PermissionDialog.Asset({required this.title, required this.description, required this.asset}) : isAsset = true;
  PermissionDialog.Icon({required this.title, required this.description, required this.icon}) : isAsset = false;

  onAllowPressed() async {
    pop(true);
  }

  //AHMED  SOBHY  WAS CODE  HERE
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Container(
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isAsset.isTrue)
              Padding(
                padding: EdgeInsetsDirectional.only(top: 25.h, bottom: 60.h),
                child: CustomSVGImage(asset: asset!),
              )
            else if (isAsset.isFalse)
              Padding(
                padding: EdgeInsetsDirectional.only(top: 25.h, bottom: 30.h),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 100,
                ),
              ),
            Text(title, style: getBoldTextStyle(fontSize: 20)),
            16.vs,
            Text(
              description,
              style: getMediumTextStyle(fontSize: 16, color: AppColors.descriptionColor),
            ),
            62.vs,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  onPressed: () => pop(true),
                  text: AppStrings.allow.trans,
                  radius: 36.h,
                ),
                17.vs,
                CustomElevatedButton(
                  onPressed: () => pop(false),
                  text: AppStrings.deny.trans,
                  style: getMediumTextStyle(color: AppColors.primaryColor, fontSize: 16.h),
                  color: AppColors.white,
                  radius: 36.h,
                  side: BorderSide(color: AppColors.primaryColor, width: 1.h),
                ),
                35.vs
                /*   ElevatedButton(
                    onPressed: () {
                      pop(false);
                    },
                    child: Text(AppStrings.allow.trans)),
                ElevatedButton(onPressed: onAllowPressed, child: Text("allow")),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
