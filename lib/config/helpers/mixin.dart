// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:abs/core/widgets/button_widget.dart';
// import 'package:abs/core/widgets/text_widget.dart';
// import 'package:path_provider/path_provider.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// mixin Helper {
//   void showSnackBar(
//       {required BuildContext context,
//       required String message,
//       required bool visibleMessage,
//       SnackBarAction? snackBarAction,
//       int duration = 2}) {
//     /*TextWidget(
//         colorText: Colors.white,
//         fontSizeText: 16,
//         text: message,
//       ),*/
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       action: snackBarAction,
//       padding: EdgeInsets.zero,
//       backgroundColor: Colors.transparent,
//       content: Container(
//         height: 134.h,
//         width: double.infinity,
//         color: Colors.transparent,
//         child: Stack(
//           children: [
//             Align(
//               alignment: AlignmentDirectional.bottomCenter,
//               child: Container(
//                 clipBehavior: Clip.antiAlias,
//                 height: 102.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: visibleMessage ? Colors.green : Colors.red,
//                     borderRadius: BorderRadius.circular(32.r)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.symmetric(
//                             horizontal: 50.w, vertical: 10.h),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             TextWidget(
//                               text: visibleMessage
//                                   ? '${AppLocalizations.of(context)!.excellent}!'
//                                   : '${AppLocalizations.of(context)!.error}!',
//                               fontSizeText: 20,
//                               colorText: Colors.white,
//                             ),
//                             SizedBox(
//                               height: 6.h,
//                             ),
//                             TextWidget(
//                               maxLine: 2,
//                               textOverflow: TextOverflow.ellipsis,
//                               text: visibleMessage
//                                   ? AppLocalizations.of(context)!.successMessage
//                                   : message,
//                               fontSizeText: 13,
//                               colorText: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     ShApp().getLanguageChar == 'en'
//                         ? Transform(
//                             alignment: AlignmentDirectional.center,
//                             transform: Matrix4.rotationY(3.14159),
//                             child: SvgPicture.asset(
//                               visibleMessage
//                                   ? Images().greenBubbles
//                                   : Images().redBubbles,
//                             ),
//                           )
//                         : SvgPicture.asset(
//                             visibleMessage
//                                 ? Images().greenBubbles
//                                 : Images().redBubbles,
//                           ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
//               child: Align(
//                   alignment: AlignmentDirectional.topStart,
//                   child: SvgPicture.asset(
//                     visibleMessage
//                         ? Images().snackBarTop
//                         : Images().snackBarTopError,
//                     height: 48.h,
//                     width: 48.w,
//                   )),
//             ),
//           ],
//         ),
//       ),
//       elevation: 0,
//       behavior: SnackBarBehavior.floating,
//       duration: Duration(seconds: duration),
//     ));
//   }
//
//   Future<Map<String, String>> get header async {
//     Map<String, String> headers = <String, String>{};
//     headers["Accept"] = "application/json";
//     headers["Accept-Language"] = ShApp().getLanguageChar;
//     headers["Authorization"] = 'Bearer ${ShApp().token}';
//     return headers;
//   }
//
//   Future<Map<String, String>> get headerToFile async {
//     Map<String, String> headers = <String, String>{};
//     headers["Accept"] = "application/json";
//     headers["content-type"] = "application/json";
//     return headers;
//   }
//
//   Future<Map<String, String>> get headerWithContentType async {
//     Map<String, String> headers = <String, String>{};
//     headers["content-type"] = "application/json";
//     headers["Authorization"] = 'Bearer ${ShApp().token}';
//     return headers;
//   }
//
//   logResponse(http.Response response) {
//     log('request=>${response.request.toString()}');
//     log('statusCode=>${response.statusCode.toString()}');
//     log('body=>${response.body.toString()}');
//   }
//
//   Future<void> dialog(
//       {required BuildContext context,
//       required String title,
//       required String subTitle,
//       required String titleButtonAccess,
//       required String titleButtonReject,
//       required Function() onClickAccessButton,
//       required Function() onClickRejectButton}) async {
//     final images = Images();
//     await showDialog(
//         context: context,
//         builder: (context) => Dialog(
//               backgroundColor: Colors.transparent,
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.33.h,
//                 width: double.infinity,
//                 color: Colors.transparent,
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional.bottomCenter,
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.28.h,
//                         width: double.infinity,
//                         padding: const EdgeInsetsDirectional.symmetric(
//                             horizontal: 20, vertical: 12),
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).secondaryHeaderColor,
//                             borderRadius: BorderRadius.circular(19.r)),
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.only(top: 20.h),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               TextWidget(
//                                 textAlign: TextAlign.center,
//                                 text: title,
//                                 fontSizeText: 19,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               SizedBox(
//                                 height: 12.h,
//                               ),
//                               TextWidget(
//                                 textAlign: TextAlign.center,
//                                 text: subTitle,
//                                 fontSizeText: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               SizedBox(
//                                 height: 16.h,
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: ButtonWidget(
//                                     title: titleButtonAccess,
//                                     onClick: onClickAccessButton,
//                                     colorButton: Colors.transparent,
//                                     colorBorder: Colors.black45,
//                                     colorTitleButton: Colors.black45,
//                                   )),
//                                   const SizedBox(
//                                     width: 16,
//                                   ),
//                                   Expanded(
//                                       child: ButtonWidget(
//                                           title: titleButtonReject,
//                                           onClick: onClickRejectButton))
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: AlignmentDirectional.topCenter,
//                       child: SvgPicture.asset(
//                         images.dialogIcon,
//                         height: MediaQuery.of(context).size.width * 0.20.h,
//                         width: MediaQuery.of(context).size.width * 0.20.w,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ));
//   }
//
//   showModelSheetWidget(BuildContext context, Widget page) async {
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(9), topLeft: Radius.circular(9))),
//         context: context,
//         builder: (context) {
//           return page;
//         });
//   }
//
//   String formatTime(String time) {
//     try {
//       var date = DateFormat('hh:mm a', ShApp().getLanguageChar)
//           .format(DateTime.parse(time).toLocal());
//       return date;
//     } catch (errorFormatTime) {
//       log('formatDate $errorFormatTime');
//       return '';
//     }
//   }
//
//   String formatDate(String date) {
//     try {
//       return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
//     } catch (errorFormatDate) {
//       log('formatDate $errorFormatDate');
//       return '';
//     }
//   }
//
//   Future<PlatformFile?> selectFileFunction() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowedExtensions: ['pdf'],
//       type: FileType.custom,
//     );
//
//     if (result != null) {
//       File selectedFile = File(result.files.single.path!);
//       Directory? documentsDir = await getApplicationDocumentsDirectory();
//
//       // Replace spaces in the file name with underscores (or remove them)
//       String fileName = selectedFile.path.split('/').last.replaceAll(' ', '_');
//
//       String newFilePath = "${documentsDir.path}/$fileName";
//       log(newFilePath);
//
//       File newFile = await selectedFile.copy(newFilePath);
//
//       PlatformFile platformFile = PlatformFile(
//         name: fileName, // Use the sanitized file name
//         size: await newFile.length(),
//         path: newFile.path,
//       );
//
//       return platformFile;
//     }
//     return null;
//   }
//
//   Future<File?> selectImageFunction({bool isChoseWithGallery = true}) async {
//     final ImagePicker picker = ImagePicker();
//     XFile? image = await picker.pickImage(
//         source: isChoseWithGallery ? ImageSource.gallery : ImageSource.camera);
//     if (image != null) {
//       log('image.path${image.path}');
//       return File(image.path);
//     }
//     return null;
//   }
//
//   // loadingSystem(BuildContext context) async {
//   //   await showDialog(
//   //     barrierColor: Colors.transparent,
//   //     useSafeArea: false,
//   //     barrierDismissible: false,
//   //     context: context,
//   //     builder: (context) => const Center(
//   //       child: CircularProgressIndicator.adaptive(),
//   //     ),
//   //   );
//   // }
//
//   Future<void> loadingSystem(BuildContext context) async {
//     showDialog(
//       useSafeArea: false,
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         // child: Stack(
//         //   children: [
//         //     Center(
//         //         child: Container(
//         //       decoration: const BoxDecoration(
//         //           color: Colors.white, shape: BoxShape.circle),
//         //       child: Lottie.asset(images.loading,
//         //           fit: BoxFit.cover, height: 50.h, width: 50.w),
//         //     )),
//         //     Center(
//         //       child: SizedBox(
//         //         height: 50.h,
//         //         width: 50.w,
//         //         child: CircularProgressIndicator(
//         //           strokeWidth: 1.5,
//         //           color: primaryColor,
//         //         ),
//         //       ),
//         //     )
//         //   ],
//         // ),
//         child: Center(
//           child: Lottie.asset(images.loading,
//               height: MediaQuery.of(context).size.height * 0.4.h,
//               width: MediaQuery.of(context).size.width * 0.4.w),
//         ),
//       ),
//     );
//   }
//
//   void pagination(
//       {required ScrollController scrollController,
//       required int indexPageList,
//       required countPages,
//       required Function() pagination}) {
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.offset) {
//         if (scrollController.hasClients) {
//           log(indexPageList.toString());
//           log(countPages.toString());
//           pagination();
//         }
//       }
//     });
//   }
//
//   void paginationTop(
//       {required ScrollController scrollController,
//       required int indexPageList,
//       required countPages,
//       required Function() pagination}) {
//     scrollController.addListener(() {
//       if (scrollController.offset <= 0) {
//         if (scrollController.hasClients) {
//           pagination();
//         }
//       }
//     });
//   }
//
//   Future<File?> convertToFile({required String fileUrl}) async {
//     var response = await ApiMethods().get(uri: fileUrl);
//     log(response.statusCode.toString());
//     log(response.body);
//     log(response.request.toString());
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/${fileUrl.split('/').last}';
//     final file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return file;
//   }
//
//   Future<ApiResponseObject<ObjectFile>> toFile(
//       {required String fileUrl}) async {
//     var response = await ApiMethods().download(uri: fileUrl, isAuthUsed: false);
//     logResponse(response);
//     if (response.statusCode == 200) {
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/${fileUrl.split('/').last}';
//       final file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);
//       // var jsonResponse = jsonDecode(response.body);
//       return ApiResponseObject<ObjectFile>(
//           message: 'success',
//           status: true,
//           statusCode: response.statusCode,
//           objectData: ObjectFile(file.path));
//     } else {
//       return ApiResponseObject<ObjectFile>(
//         message: "حدث خلل اثناء تحميل الملف",
//         status: false,
//         statusCode: response.statusCode,
//       );
//     }
//   }
//
//   String getLink({required String text}) {
//     String link = '';
//     try {
//       RegExp urlRegExp = RegExp(
//         r'(http|ftp|https):\/\/([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])',
//         caseSensitive: false,
//       );
//       Iterable<RegExpMatch> matches = urlRegExp.allMatches(text);
//       List<String> urls = matches.map((match) => match.group(0)!).toList();
//
//       for (var element in urls) {
//         link = element;
//       }
//     } catch (e) {}
//     return link;
//   }
//
//   launch(String uri) async {
//     Uri url = Uri.parse(uri);
//     try {
//       await launchUrl(url);
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   openFile(String pathFile) async {
//     try {
//       await OpenFile.open(pathFile);
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   viewImage(
//       {required BuildContext context,
//       required int initialPage,
//       int itemCount = 1,
//       required PhotoViewGalleryPageOptions Function(
//               BuildContext context, int index)
//           builder}) async {
//     await showDialog(
//       barrierColor: Colors.black38,
//       context: context,
//       builder: (context) => Dismissible(
//         resizeDuration: const Duration(microseconds: 1),
//         direction: DismissDirection.vertical,
//         onDismissed: (direction) {
//           Navigator.of(context).pop();
//         },
//         key: const Key('imageView'),
//         child: PhotoViewGallery.builder(
//           loadingBuilder: (context, event) {
//             return Center(
//               child: LoadingAnimationWidget.discreteCircle(
//                   color: Colors.white, size: 30),
//             );
//           },
//           pageController: PageController(initialPage: initialPage),
//           backgroundDecoration: const BoxDecoration(color: Colors.transparent),
//           builder: builder,
//           itemCount: itemCount,
//         ),
//       ),
//     );
//   }
//
//   String iconFile(extension) {
//     final images = Images();
//     switch (extension) {
//       case "pdf":
//         return images.iconFile;
//       case "doc":
//         return images.docFile;
//       case "docx":
//         return images.docFile;
//       default:
//         return images.iconFile;
//     }
//   }
//
//   navigatorPop(BuildContext context) async {
//     try {
//       if (Navigator.canPop(context)) {
//         Navigator.pop(context);
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   signOutWithApplication() async {
//     WebSocketController().closeSocket();
//     await GoogleAuth().signOutToGoogle();
//     await ShApp().clearData();
//     Navigator.pushNamedAndRemoveUntil(
//       navigatorKey.currentState!.context,
//       '/Login_Screen',
//       (route) => false,
//     );
//   }
// }
