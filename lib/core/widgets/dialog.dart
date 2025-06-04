import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../../exports.dart';

Future<void> dialog(
    {required BuildContext context,
      required String title,
      required String subTitle,
      required String titleButtonAccess,
      required String titleButtonReject,
      required Function() onClickAccessButton,
      required Function() onClickRejectButton}) async {

  await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.33.h,
          width: double.infinity,
          color: Colors.transparent,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.28.h,
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(19.r)),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          textAlign: TextAlign.center,
                          text: title,
                          fontSizeText: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        TextWidget(
                          textAlign: TextAlign.center,
                          text: subTitle,
                          fontSizeText: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ButtonWidget(
                                  title: titleButtonAccess,
                                  onClick: onClickAccessButton,
                                  colorButton: Colors.transparent,
                                  colorBorder: Colors.black45,
                                  colorTitleButton: Colors.black45,
                                )),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: ButtonWidget(
                                    title: titleButtonReject,
                                    onClick: onClickRejectButton))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: SvgPicture.asset(
                  AppAssets.dialogIcon,
                  height: MediaQuery.of(context).size.width * 0.20.h,
                  width: MediaQuery.of(context).size.width * 0.20.w,
                ),
              ),
            ],
          ),
        ),
      ));
}
showModelSheetWidget(BuildContext context, Widget page) async {
  await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(9), topLeft: Radius.circular(9))),
      context: context,
      builder: (context) {
        return page;
      });
}
String formatDate(String date) {
  try {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  } catch (errorFormatDate) {
    log('formatDate $errorFormatDate');
    return '';
  }
}
Future<void> loadingSystem(BuildContext context) async {
  showDialog(
    useSafeArea: false,
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      // child: Stack(
      //   children: [
      //     Center(
      //         child: Container(
      //       decoration: const BoxDecoration(
      //           color: Colors.white, shape: BoxShape.circle),
      //       child: Lottie.asset(images.loading,
      //           fit: BoxFit.cover, height: 50.h, width: 50.w),
      //     )),
      //     Center(
      //       child: SizedBox(
      //         height: 50.h,
      //         width: 50.w,
      //         child: CircularProgressIndicator(
      //           strokeWidth: 1.5,
      //           color: primaryColor,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      child: Center(
        child: Lottie.asset(AppAssets.loading,
            height: MediaQuery.of(context).size.height * 0.4.h,
            width: MediaQuery.of(context).size.width * 0.4.w),
      ),
    ),
  );
}
void showSnackBar({
  required BuildContext context,
  required String message,
  required visibleMessage,
  ToastGravity gravity = ToastGravity.BOTTOM,
  int durationSeconds = 3,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity,
    backgroundColor: visibleMessage ? Colors.green : Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
    timeInSecForIosWeb: durationSeconds,
  );
}