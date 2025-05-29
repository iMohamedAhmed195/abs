

import 'package:new_ilearn/config/widgets/setting_item.dart';

import '../../exports.dart';

class FilePickerDialog extends StatelessWidget {
  final bool isSelected;

  FilePickerDialog({this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.vs,
          Text(
            AppStrings.selectImageFrom.trans,
            style: getBoldTextStyle(fontSize: 18),
          ),
          30.vs,
          if (isSelected)
            SettingItemWidget(
              title: AppStrings.removeImage.trans,
              titleTextStyle: getSemiBoldTextStyle(),
              leading: Icon(Icons.close, color: AppColors.primaryColor),
              onTap: () {
                pop(GalleryFileTypes.REMOVE);
              },
            ),
          SettingItemWidget(
            title: AppStrings.camera.trans,
            titleTextStyle: getSemiBoldTextStyle(),
            leading: Icon(Icons.camera_alt, color: AppColors.primaryColor),
            onTap: () {
              pop(GalleryFileTypes.CAMERA);
            },
          ),
          SettingItemWidget(
            title: AppStrings.gallery.trans,
            titleTextStyle: getSemiBoldTextStyle(),
            leading: const Icon(Icons.photo_library, color: AppColors.primaryColor),
            onTap: () {
              pop(GalleryFileTypes.GALLERY);
            },
          ),
        ],
      ),
    );
  }
}
