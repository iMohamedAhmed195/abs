import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';

import '../../../../exports.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.image,
    required this.title,
    required this.numberPage,
    this.onClick,
    this.onLongClick,
    this.delete,
    this.fileUrl,
    this.path,
    this.bookId,
    this.showCheckBox = false,
    this.checked = false,
    this.checkSelected,
    this.showDelete = true,
    this.radius = 8,
    this.heightImage = 120,
    this.width = 110,
  });

  final String? image;
  final String title;
  final int? numberPage;
  final Function()? onClick;
  final Function()? onLongClick;
  final Function()? delete;
  final String? fileUrl;
  final String? path;
  final String? bookId;
  final bool showCheckBox;
  final bool checked;
  final Function(bool?)? checkSelected;
  final bool showDelete;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image != null
                    ? ImageCached(urlImage: image!.replaceAll(' ', '%'), height: heightImage.h)
                    : Container(
                  height: heightImage.h,
                  color: AppColors.primaryColor,
                  child: Center(
                    child: Image.asset(AppAssets.logoName, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: title, fontSizeText: 14, maxLine: 1, textOverflow: TextOverflow.ellipsis),
                      if (numberPage != null)
                        TextWidget(
                            text: 'عدد الصفحات :${numberPage ?? 0}', fontSizeText: 12, maxLine: 1, textOverflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Visibility(
                visible: showCheckBox && fileUrl != null && !fileUrl!.startsWith('https://www.youtube.com/watch'),
                child: Checkbox(
                  value: checked,
                  onChanged: checkSelected,
                  activeColor: AppColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Visibility(
                visible: showDelete,
                child: IconButton(
                  icon: CircleAvatar(
                    radius: 13.r,
                    backgroundColor: AppColors.primaryColor,
                    child: SvgPicture.asset(
                      AppAssets.deleteAccount,
                      height: 17.h,
                      width: 17.w,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    dialog(
                      context: context,
                      title: '${AppStrings.delete} ${AppStrings.books}',
                      subTitle: '${AppStrings.doReallyWantDelete} $title',
                      titleButtonAccess: AppStrings.delete,
                      titleButtonReject: AppStrings.cancel,
                      onClickAccessButton: () {
                        Navigator.pop(context);
                        delete?.call();
                      },
                      onClickRejectButton: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
