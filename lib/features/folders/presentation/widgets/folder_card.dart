import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/craeteFolderPage.dart';

import '../../../../exports.dart';
class FolderCard extends StatelessWidget {
  const FolderCard({
    super.key,
    required this.title,
    this.image,
    required this.idFolder,
    this.onClick,
    this.onLongClick,
    required this.delete,
    this.radius = 8,
    this.heightImage = 120,
    this.width = 110,
  });

  final String? image;
  final String title;
  final String idFolder;
  final Function()? onClick;
  final Function()? onLongClick;
  final Function() delete;
  final double radius;
  final double heightImage;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      onLongPress: onLongClick,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.only(end: 12),
        width: width.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 4),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                image != null
                    ? ImageCached(urlImage: image!.replaceAll(' ', '%'), height: heightImage.h)
                    : Container(
                  height: heightImage.h,
                  color: AppColors.primaryColor,
                  child: Center(child: Image.asset(AppAssets.logoName, color: Colors.white)),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextWidget(
                    text: title,
                    fontSizeText: 14,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: AppColors.white),
                color: AppColors.white,
                onSelected: (value) {
                  if (value == 'update') {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(9), topLeft: Radius.circular(9))),
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: BottomSheetAddFolder(
                            idFolder: idFolder,
                            update: true,
                            folderName: title,
                            folderImage: image,
                          ),
                        );
                      },
                    );
                  } else if (value == 'delete') {
                    dialog(
                      context: context,
                      title: '${AppStrings.delete.trans} ${AppStrings.folder.trans}',
                      subTitle: '${AppStrings.doReallyWantDelete.trans} $title',
                      titleButtonAccess: AppStrings.delete.trans,
                      titleButtonReject: AppStrings.cancel.trans,
                      onClickAccessButton: () {
                        Navigator.pop(context);
                        delete();
                      },
                      onClickRejectButton: () => Navigator.pop(context),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'update', child: TextWidget(text: AppStrings.update.trans, fontSizeText: 15)),
                  PopupMenuItem(value: 'delete', child: TextWidget(text: AppStrings.delete.trans, fontSizeText: 15)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
