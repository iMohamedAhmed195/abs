import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/core/widgets/imageCash_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/create_folder_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../exports.dart';

class BooksWidgetItem extends StatelessWidget {
  const BooksWidgetItem({
    super.key,
    required this.image,
    required this.title,
    this.radius = 8,
    this.numberPage,
    this.showButton = false,
    this.onClick,
    this.heightImage = 120,
    this.checked = false,
    this.showCheckBox = false,
    this.checkSelected,
    this.onLongClick,
    this.fileUrl,
    this.path,
    this.bookId,
    required this.delete,
    this.isShowDeleteButton = true,
    this.width = 110,
    required this.isBook,
    this.idFolder = '',
  });

  final String? image;
  final String title;
  final double radius;
  final int? numberPage;
  final bool showButton;
  final Function()? onClick;
  final double heightImage;
  final bool showCheckBox;
  final bool checked;
  final String? path;
  final String? fileUrl;
  final Function()? onLongClick;
  final Function() delete;
  final bool isShowDeleteButton;
  final Function(bool? values)? checkSelected;
  final String? bookId;
  final double width;
  final bool isBook;
  final String idFolder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongClick,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onClick,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.only(end: 12),
        width: width.w,
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(0, 4), blurRadius: 4)],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image != null ? ImageCached(urlImage: image!.replaceAll(' ', '%'), height: heightImage.h) : Container(
                      color: AppColors.primaryColor,
                      child: Center(
                        child: SizedBox(
                          height: heightImage.h,
                          child: Image.asset(AppAssets.logoName, color: Colors.white),
                        ),
                      ),
                    ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: numberPage != null ? AlignmentDirectional.centerStart : AlignmentDirectional.center,
                        child: TextWidget(
                          text: title,
                          fontSizeText: 14,
                          textOverflow: TextOverflow.ellipsis,
                          maxLine: 1,
                        ),
                      ),
                      Visibility(
                        visible: numberPage != null ? true : false,
                        child: TextWidget(
                          textOverflow: TextOverflow.ellipsis,
                          maxLine: 1,
                          text: 'عدد الصفحات :${numberPage ?? 0}',
                          fontSizeText: 12,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Visibility(
                        visible: showButton,
                        child: ButtonWidget(
                          height: MediaQuery.of(context).size.height * 0.043.h,
                          colorTitleButton: Colors.black,
                          colorButton: AppColors.lightSplashColor,
                          title: fileUrl != null && fileUrl!.startsWith('https://www.youtube.com/watch') ? AppStrings.showVideo.trans : AppStrings.readBook.trans,
                          onClick: () async {
                            // if (bookId != null && fileUrl != null && !fileUrl!.startsWith('https://www.youtube.com/watch')) {
                              // try {readBookWithId = bookId ?? '';
                              //   if (path != null && await BookProccessingController().checkThePath(pathFile: path!)) {
                              //     // await OpenFile.open(path);
                              //     Navigator.push(context,
                              //       MaterialPageRoute(
                              //         builder: (context) => OpenFilePdfPage(nameFile: title, path: path!),
                              //       ),
                              //     );
                              //   }
                              //   else {
                              //     readBookWithId = bookId ?? '';
                              //     //loadingSystem(context);
                              //     BlocProvider.of<SendMessageBloc>(
                              //       context,
                              //     ).add(ToFileEvent(fileUrl!, bookId!, 'BookBox'));
                              //   }
                              // } catch (e) {
                              //   log(e.toString());
                              //   showSnackBar(context: context, message: e.toString(), visibleMessage: false);
                              // }
                            // } else {
                            //   if (fileUrl != null && fileUrl!.startsWith('https://www.youtube.com/watch')) {
                            //     launch(fileUrl!);
                            //   }
                            // }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: showCheckBox && fileUrl != null && !fileUrl!.startsWith('https://www.youtube.com/watch'),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Checkbox(
                      activeColor: AppColors.primaryColor,
                      hoverColor: Colors.white,
                      fillColor: WidgetStatePropertyAll(checked ? AppColors.primaryColor : Colors.white),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      value: checked,
                      onChanged: checkSelected ?? (value) {},
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowDeleteButton,
                  child: IconButton(
                    onPressed: () {
                      if (isBook) {
                        dialog(
                          context: context,
                          title: '${AppStrings.delete.trans} ${isBook ? AppStrings.books.trans : AppStrings.folder.trans}',
                          subTitle: '${AppStrings.doReallyWantDelete.trans} $title',
                          titleButtonAccess: AppStrings.delete.trans,
                          titleButtonReject: AppStrings.cancel.trans,
                          onClickAccessButton: () {
                            Navigator.pop(context);
                            delete();
                          },
                          onClickRejectButton: () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                    icon: CircleAvatar(
                      radius: 13.r,
                      backgroundColor: Theme.of(context).indicatorColor,
                      child:
                          isBook
                              ? SvgPicture.asset(AppAssets.deleteAccount, height: 17.h, width: 17.w, color: Colors.red)
                              : Center(
                                child: PopupMenuButton(
                                  color: Theme.of(context).splashColor,
                                  onSelected: (value) {
                                    if (value == 'update') {
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
                                        title: '${AppStrings.delete.trans} ${isBook ? AppStrings.books.trans : AppStrings.folder.trans}',
                                        subTitle: '${AppStrings.doReallyWantDelete.trans} $title',
                                        titleButtonAccess: AppStrings.delete.trans,
                                        titleButtonReject: AppStrings.cancel.trans,
                                        onClickAccessButton: () {
                                          Navigator.pop(context);
                                          delete();
                                        },
                                        onClickRejectButton: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    }
                                  },
                                  padding: EdgeInsetsDirectional.zero,
                                  iconColor: Colors.white,
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        value: 'update',
                                        child: TextWidget(text: AppStrings.update.trans, fontSizeText: 15),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: TextWidget(text: AppStrings.delete.trans, fontSizeText: 15),
                                      ),
                                    ];
                                  },
                                ),
                              ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
